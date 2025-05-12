import 'package:collection/collection.dart';
import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/misc/types.dart';

/// Holds information about collected theme extension templates.
///
/// Contains the import URI and the list of template class names.
@immutable
final class CollectedTemplates {
  /// Creates an instance of [CollectedTemplates].
  ///
  /// [importUri] - the import path of the collected templates.
  /// [templateNames] - the list of collected template class names.
  const CollectedTemplates({
    required this.importUri,
    required this.templateNames,
  });

  /// The import URI where the templates are located.
  final String importUri;

  /// The list of collected template class names.
  final List<String> templateNames;

  /// Converts this instance to a JSON map.
  JsonMap toJson() => {
        'importUri': importUri,
        'templateNames': templateNames,
      };

  /// Creates a [CollectedTemplates] instance from a JSON map.
  factory CollectedTemplates.fromJson(JsonMap map) => CollectedTemplates(
        importUri: map['importUri'] as String,
        templateNames: (map['templateNames'] as List).cast<String>(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectedTemplates &&
          runtimeType == other.runtimeType &&
          importUri == other.importUri &&
          const ListEquality<String>().equals(
            templateNames,
            other.templateNames,
          );

  @override
  int get hashCode => importUri.hashCode ^ templateNames.hashCode;
}
