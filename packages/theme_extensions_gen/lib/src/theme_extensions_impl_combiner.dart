import 'dart:async' show FutureOr;
import 'dart:convert' show jsonDecode;

import 'package:build/build.dart' show AssetId, BuildStep, Builder, log;
import 'package:glob/glob.dart' show Glob;
import 'package:meta/meta.dart' show immutable, visibleForTesting;
import 'package:theme_extensions_gen/src/misc/types.dart';
import 'package:theme_extensions_gen/src/models/collected_group.dart';
import 'package:theme_extensions_gen/src/models/collected_impl.dart';
import 'package:theme_extensions_gen/src/models/collected_impl_list.dart';
import 'package:theme_extensions_gen/src/models/options/theme_generator_config.dart';
import 'package:theme_extensions_gen/src/templates/themes_list_template.dart';

/// Combines all `.theme_impl.json` files into grouped `ThemeExtension` lists.
///
/// Output file path and list name are resolved from the build config
/// via [ThemeGeneratorConfig].
@immutable
final class ThemeExtensionsImplCombiner extends Builder {
  /// Creates a [ThemeExtensionsImplCombiner] using parsed build configuration.
  ThemeExtensionsImplCombiner(this._options);

  final ThemeGeneratorConfig _options;

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final assets = buildStep.findAssets(Glob('**/*.theme_impl.json'));

    final collectedImplLists = <CollectedImplList>[];

    await for (var asset in assets) {
      final str = await buildStep.readAsString(asset);
      final map = jsonDecode(str) as JsonMap;
      final data = CollectedImplList.fromJson(map);
      collectedImplLists.add(data);
    }

    final mergedGroups = _mergeCollectedImpls(collectedImplLists);

    warnOnUndeclaredGroups(mergedGroups);

    for (final group in mergedGroups) {
      final listName = _options.resolveListNameForGroup(group.group);
      final path = _options.resolvePathForGroup(group.group);

      final imports = group.importToNames.keys.toList(growable: false);
      final aliases = _generateAliases(imports);
      final expandedNames = _expandNames(group.importToNames, aliases);

      final aliasedImports = [
        for (final uri in imports) _wrapImport(uri, aliases[uri]!),
      ];

      final sb = StringBuffer();
      final template = ThemesListTemplate(
        names: expandedNames,
        imports: aliasedImports,
        listName: listName,
      );
      template.write(sb);

      await buildStep.writeAsString(
        AssetId(buildStep.inputId.package, 'lib/$path'),
        sb.toString(),
      );
    }
  }

  Map<String, String> _generateAliases(List<String> imports) => {
        for (var i = 0; i < imports.length; i++) imports[i]: '\$i${i + 1}',
      };

  List<String> _expandNames(
    Map<String, List<String>> importToNames,
    Map<String, String> aliases,
  ) =>
      [
        for (final entry in importToNames.entries)
          for (final name in entry.value) _wrapName(aliases[entry.key]!, name),
      ];

  List<CollectedGroup> _mergeCollectedImpls(
    List<CollectedImplList> lists,
  ) {
    final grouped = <String?, List<CollectedImpl>>{};
    final allImpls = lists.expand((l) => l.data);

    for (final impl in allImpls) {
      grouped.putIfAbsent(impl.group, () => []).add(impl);
    }

    return grouped.entries.map((entry) {
      final group = entry.key;
      final impls = entry.value;

      final importToNames = <String, List<String>>{};

      for (final impl in impls) {
        importToNames.putIfAbsent(impl.importUri, () => []).add(impl.name);
      }

      return CollectedGroup(
        group: group,
        importToNames: importToNames,
      );
    }).toList(growable: false);
  }

  String _wrapImport(String uri, String alias) => "'$uri' as $alias";

  String _wrapName(String alias, String name) => name.startsWith('...')
      ? '...$alias.${name.substring(3)}'
      : '$alias.$name';

  /// nodoc
  @visibleForTesting
  void warnOnUndeclaredGroups(List<CollectedGroup> groups) {
    for (final group in groups) {
      final name = group.group;
      if (_options.isGroupMissing(name)) {
        log.warning(
          'ThemeExtensionsImplCombiner: '
          'Group "$name" is not defined in build.yaml.\n'
          'It will use the default output config. '
          'To avoid this warning, declare the group under "output_groups" '
          'with a valid output path '
          '(e.g., "lib/generated/theme_group_name.dart").',
        );
      }
    }
  }

  @override
  Map<String, List<String>> get buildExtensions =>
      {r'$lib$': _options.outputPaths};
}
