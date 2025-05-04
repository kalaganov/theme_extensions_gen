import 'package:meta/meta.dart' show immutable;

/// Represents a single parameter in a constructor declaration.
@immutable
final class ConstructorParam {
  /// Creates a named parameter with the given [name] and [type].
  const ConstructorParam({
    required this.name,
    required this.type,
    required this.isLerpMethodNullable,
  });

  /// The parameter name as declared.
  final String name;

  /// The parameter type as a string (can be fully qualified).
  final String type;

  /// Whether the associated static `lerp` method (if used)
  /// returns a nullable type.
  ///
  /// This is only relevant if the parameter's type provides a
  /// static `lerp` method (instead of a constructor).
  /// Used to determine if the generated code needs to null-check the result.
  final bool isLerpMethodNullable;
}
