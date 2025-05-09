import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/misc/types.dart';

/// Collected data from a single element annotated with `@ThemeExtensionImpl`.
///
/// Used to pass import URI, optional group, and annotated element name
/// (variable, list, or getter) to the next build step.
/// Collected data from a single element annotated with `@ThemeExtensionImpl`.
///
/// Used to pass import URI, optional group, and annotated element name
/// (variable, list, or getter) to the next build step.
@immutable
final class CollectedImpl {
  /// Creates an instance containing import URI, group, and element name
  /// collected from a single annotated element.
  const CollectedImpl({
    required this.group,
    required this.importUri,
    required this.name,
  });

  /// Optional group name used to determine output target.
  final String? group;

  /// URI of the source asset (used for import in generated code).
  final String importUri;

  /// Name of the annotated element (variable, getter, or list).
  final String name;

  /// Parses collected data from a JSON map.
  factory CollectedImpl.fromJson(JsonMap map) => CollectedImpl(
        group: map['group'] as String?,
        name: map['name']! as String,
        importUri: map['import']! as String,
      );

  /// Serializes collected data into a JSON map.
  JsonMap toJson() => {
        if (group case final g?) 'group': g,
        'import': importUri,
        'name': name,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectedImpl &&
          runtimeType == other.runtimeType &&
          group == other.group &&
          importUri == other.importUri &&
          name == other.name;

  @override
  int get hashCode => group.hashCode ^ importUri.hashCode ^ name.hashCode;
}
