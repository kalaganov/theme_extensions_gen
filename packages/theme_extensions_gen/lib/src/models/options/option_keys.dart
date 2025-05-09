import 'package:meta/meta.dart' show immutable;

/// Constants for builder option keys used in `build.yaml`.
@immutable
abstract final class OptionKeys {
  const OptionKeys._();

  /// Key for default output config.
  static const defaultOutput = 'default_output';

  /// Key for mapping group names to output config maps.
  static const outputGroups = 'output_groups';

  /// Key for output file path inside an output config.
  static const path = 'path';

  /// Key for list name inside an output config.
  static const listName = 'list_name';

  /// Key for default context extensions output path.
  static const outputPath = 'output_path';
}
