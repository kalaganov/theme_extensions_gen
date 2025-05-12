import 'dart:async' show FutureOr;
import 'dart:convert' show jsonDecode;

import 'package:build/build.dart' show AssetId, BuildStep, Builder;
import 'package:dart_style/dart_style.dart';
import 'package:glob/glob.dart' show Glob;
import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/misc/types.dart';
import 'package:theme_extensions_gen/src/models/collected_templates.dart';
import 'package:theme_extensions_gen/src/models/options/context_extensions_generator_config.dart';
import 'package:theme_extensions_gen/src/templates/context_extensions_template.dart';

/// A [Builder] that collects all theme templates and generates
/// a set of `BuildContext` extension getters for accessing
/// `ThemeExtension` instances.
///
/// This generator scans for `*.theme_templates.json` files,
/// deserializes them into `CollectedTemplates`, and produces
/// a single Dart file with extension getters.
@immutable
final class ContextExtensionsGenerator extends Builder {
  /// Creates a [ContextExtensionsGenerator] with the given
  /// [ContextExtensionsGeneratorConfig] options.
  ///
  /// The options define where the generated output should be written.
  ContextExtensionsGenerator(this._options);

  final ContextExtensionsGeneratorConfig _options;

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final assets = buildStep.findAssets(Glob('**/*.theme_templates.json'));

    final collectedTemplates = <CollectedTemplates>[];

    await for (var asset in assets) {
      final str = await buildStep.readAsString(asset);
      final map = jsonDecode(str) as JsonMap;
      final data = CollectedTemplates.fromJson(map);
      collectedTemplates.add(data);
    }

    if (collectedTemplates.isEmpty) return;

    final template = ContextExtensionsTemplate(templates: collectedTemplates);

    final sb = StringBuffer();
    template.write(sb);

    final formatter = DartFormatter(
      languageVersion: DartFormatter.latestLanguageVersion,
    );

    await buildStep.writeAsString(
      AssetId(buildStep.inputId.package, 'lib/${_options.outputPath}'),
      formatter.format(sb.toString()),
    );
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': [_options.outputPath],
      };
}
