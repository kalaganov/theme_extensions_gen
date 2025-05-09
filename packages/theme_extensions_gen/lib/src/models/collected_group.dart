import 'package:collection/collection.dart';
import 'package:meta/meta.dart' show immutable;

/// Represents a merged group of collected theme extension implementations.
///
/// Combines all annotated elements sharing the same [group] name.
/// Used during the second build step to generate
/// the final theme extension list.
@immutable
final class CollectedGroup {
  /// Creates a merged representation of a group.
  ///
  /// [group] is the name used in the `@ThemeExtensionImpl` annotation.
  /// [importToNames] maps each unique import URI to its
  /// associated element names.
  const CollectedGroup({
    required this.group,
    required this.importToNames,
  });

  /// Group name from `@ThemeExtensionImpl(group: ...)`.
  /// `null` indicates the default group (no explicit name).
  final String? group;

  /// Mapping from import URI to the list of annotated element names.
  ///
  /// This structure allows resolving name conflicts and
  /// generating unique aliases during output generation.
  final Map<String, List<String>> importToNames;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectedGroup &&
          runtimeType == other.runtimeType &&
          group == other.group &&
          const DeepCollectionEquality().equals(
            importToNames,
            other.importToNames,
          );

  @override
  int get hashCode =>
      group.hashCode ^ const DeepCollectionEquality().hash(importToNames);
}
