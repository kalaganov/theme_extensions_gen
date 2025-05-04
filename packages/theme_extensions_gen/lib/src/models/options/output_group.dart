import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/misc/types.dart';
import 'package:theme_extensions_gen/src/models/options/option_keys.dart';

/// Holds resolved output file path and list name for a builder group.
@immutable
final class OutputGroup {
  /// Creates an output config containing a file path and
  /// the variable name for the generated list of extensions.
  factory OutputGroup({
    required String name,
    required JsonMap map,
  }) =>
      OutputGroup._(
        name: name,
        path: map[OptionKeys.path] as String,
        listName: map[OptionKeys.listName] as String?,
      );

  const OutputGroup._({
    required this.name,
    required this.path,
    required this.listName,
  });

  /// add description
  final String name;

  /// File path for the output Dart file.
  final String path;

  /// Name of the final combined list variable in generated Dart file.
  final String? listName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OutputGroup &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          path == other.path &&
          listName == other.listName;

  @override
  int get hashCode => name.hashCode ^ path.hashCode ^ listName.hashCode;
}
