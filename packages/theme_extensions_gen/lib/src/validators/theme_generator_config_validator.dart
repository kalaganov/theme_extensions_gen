import 'package:theme_extensions_gen/src/misc/types.dart';
import 'package:theme_extensions_gen/src/models/options/option_keys.dart';

/// Provides validation for `build.yaml` configuration.
///
/// This validator should be run before using the config
/// to ensure correctness and avoid runtime issues.
final class ThemeGeneratorConfigValidator {
  const ThemeGeneratorConfigValidator._();

  /// Validates the structure and types of the parsed config map.
  /// Throws [FormatException] if any rule is violated.
  static void validate(JsonMap config) {
    _validateDefaultOutput(config[OptionKeys.defaultOutput]);
  }

  static void _validateDefaultOutput(Object? value) {
    if (value == null) {
      throw const FormatException(
        'Missing required "${OptionKeys.defaultOutput}" section.',
      );
    }
  }
}
