import 'package:collection/collection.dart';
import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/misc/types.dart';
import 'package:theme_extensions_gen/src/models/options/option_keys.dart';
import 'package:theme_extensions_gen/src/models/options/output_group.dart';
import 'package:yaml/yaml.dart';

/// Configuration parsed from `build.yaml` for theme extension generation.
///
/// Assumes the input map is already valid.
/// No validation is performed — invalid structure will result
/// in runtime errors.
///
/// Keys used:
/// - [OptionKeys.defaultOutput] → `JsonMap`
/// - [OptionKeys.outputGroups] → `Map<String, JsonMap>`
@immutable
final class ThemeGeneratorConfig {
  /// Parses a raw config map into [ThemeGeneratorConfig].
  ///
  /// Expects correct structure and types — validation is not performed.
  ///
  /// The provided map must contain:
  /// - [OptionKeys.defaultOutput] as `JsonMap`
  /// - [OptionKeys.outputGroups] as `Map<String, JsonMap>`
  factory ThemeGeneratorConfig.fromMap(dynamic raw) {
    final map = raw is YamlMap ? raw.value : raw as JsonMap;
    final rawDefaultGroup = map[OptionKeys.defaultOutput];
    final rawOutputGroups = map[OptionKeys.outputGroups];

    final mapDefaultGroup = rawDefaultGroup is YamlMap
        ? rawDefaultGroup.value.cast<String, dynamic>()
        : rawDefaultGroup as JsonMap;

    final mapOutputGroups = rawOutputGroups == null
        ? <String, dynamic>{}
        : (rawOutputGroups is YamlMap
            ? rawOutputGroups.value.cast<String, dynamic>()
            : rawOutputGroups as JsonMap);

    return ThemeGeneratorConfig._(
      defaultOutput: _toOutputGroup(
        OptionKeys.defaultOutput,
        mapDefaultGroup,
      ),
      outputGroups: mapOutputGroups.entries
          .map((e) => _toOutputGroup(e.key, e.value))
          .toList(growable: false),
    );
  }

  ThemeGeneratorConfig._({
    required this.defaultOutput,
    required this.outputGroups,
  });

  /// Default output config used when group is `null` or not found.
  final OutputGroup defaultOutput;

  /// Output configurations associated with custom group names.
  /// Groups are defined via `@ThemeExtensionImpl(group: ...)`.
  final List<OutputGroup> outputGroups;

  /// Resolves the output file name for the given group.
  /// Falls back to [defaultOutput] if group is null or not found.
  String resolveListNameForGroup(String? group) =>
      _resolveGroup(group).listName!;

  /// Resolves the output path for the given group.
  /// Falls back to [defaultOutput] if group is null or not found.
  String resolvePathForGroup(String? group) => _resolveGroup(group).path;

  OutputGroup _resolveGroup(String? group) =>
      outputGroups.firstWhereOrNull((g) => g.name == group) ?? defaultOutput;

  /// All output file paths used in `buildExtensions`.
  ///
  /// Includes the default output path and all group-specific paths.
  /// Used to declare generated files to the build system.
  List<String> get outputPaths =>
      [defaultOutput.path, ...outputGroups.map((g) => g.path)];

  /// Returns true if [group] is not declared in [outputGroups].
  /// `null` (default group) is always considered declared.
  bool isGroupMissing(String? group) {
    if (group == null) return false;
    return !outputGroups.any((g) => g.name == group);
  }

  static OutputGroup _toOutputGroup(String name, dynamic raw) => OutputGroup(
      name: name,
      map: raw is YamlMap ? raw.value.cast<String, dynamic>() : raw as JsonMap);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeGeneratorConfig &&
          runtimeType == other.runtimeType &&
          defaultOutput == other.defaultOutput &&
          const ListEquality<OutputGroup>()
              .equals(outputGroups, other.outputGroups);

  @override
  int get hashCode =>
      defaultOutput.hashCode ^
      const DeepCollectionEquality().hash(outputGroups);
}
