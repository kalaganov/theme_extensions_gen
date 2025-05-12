import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/misc/types.dart';
import 'package:theme_extensions_gen/src/models/options/option_keys.dart';
import 'package:yaml/yaml.dart' show YamlMap;

/// Configuration parsed from `build.yaml` for theme extension generation.
///
/// Assumes the input map is already valid.
/// No validation is performed — invalid structure will result
/// in runtime errors.
@immutable
final class ContextExtensionsGeneratorConfig {
  /// Parses a raw config map into [ContextExtensionsGeneratorConfig].
  ContextExtensionsGeneratorConfig.fromMap(dynamic raw)
      : outputPath = (raw is YamlMap
            ? raw[OptionKeys.outputPath]
            : (raw as JsonMap)[OptionKeys.outputPath]) as String;

  /// default context extensions output path
  final String outputPath;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContextExtensionsGeneratorConfig &&
          runtimeType == other.runtimeType &&
          outputPath == other.outputPath;

  @override
  int get hashCode => outputPath.hashCode;
}
