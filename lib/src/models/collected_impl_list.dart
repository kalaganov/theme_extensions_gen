import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/misc/types.dart';
import 'package:theme_extensions_gen/src/models/collected_impl.dart';

/// Wrapper for a list of collected elements annotated with
/// `@ThemeExtensionImpl`, used during the build step to pass data forward.
///
/// Contains multiple [CollectedImpl] entries collected from a Dart library.
@immutable
final class CollectedImplList {
  /// Creates a list of collected theme extension implementations.
  const CollectedImplList({required this.data});

  /// Parsed list of collected elements.
  final List<CollectedImpl> data;

  /// Parses wrapper from a JSON map.
  factory CollectedImplList.fromJson(JsonMap map) => CollectedImplList(
        data: (map['data'] as List)
            .cast<JsonMap>()
            .map(CollectedImpl.fromJson)
            .toList(growable: false),
      );

  /// Serializes wrapper into a JSON map.
  JsonMap toJson() => {
        'data': data.map((e) => e.toJson()).toList(growable: false),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectedImplList &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}
