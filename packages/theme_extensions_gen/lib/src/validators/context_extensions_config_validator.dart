import 'package:theme_extensions_gen/src/misc/types.dart';
import 'package:theme_extensions_gen/src/models/options/option_keys.dart';
import 'package:yaml/yaml.dart' show YamlMap;

/// Validates the `build.yaml` configuration.
///
/// This validator should be run before using the config
/// to ensure correctness and prevent runtime issues.
final class ContextExtensionsConfigValidator {
  const ContextExtensionsConfigValidator._();

  /// Validates the structure and types of the parsed config map.
  /// Throws [FormatException] if any rule is violated.
  static void validate(JsonMap config) {
    _validateDefaultOutput(config[OptionKeys.outputPath]);
  }

  static void _validateDefaultOutput(Object? value) {
    if (value == null) {
      throw const FormatException(
        'Missing required "${OptionKeys.outputPath}" section.',
      );
    }
    if (value is YamlMap) {
      if (value[OptionKeys.outputPath] is! String) {
        throw const FormatException(
          'The "${OptionKeys.outputPath}" value must be a String.',
        );
      }
    } else if (value is Map) {
      if (value[OptionKeys.outputPath] is! String) {
        throw const FormatException(
          'The "${OptionKeys.outputPath}" value must be a String.',
        );
      }
    }
  }
}
