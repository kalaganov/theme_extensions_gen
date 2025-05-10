import 'package:theme_extensions_gen/src/models/constructor_param.dart';

/// A wrapper class that holds a validated and ordered list of constructor
/// parameters.
///
/// Ensures positional parameters always come before named ones.
final class ConstructorParams {
  /// Creates [ConstructorParams] from raw parallel lists of names and types,
  /// Assumes all lists have equal length.
  factory ConstructorParams.fromParts({
    required List<String> names,
    required List<String> types,
    required List<bool> isNullableLerp,
  }) {
    assert(names.length == types.length);

    final params = List.generate(
      names.length,
      (i) => ConstructorParam(
        name: names[i],
        type: types[i],
        isLerpMethodNullable: isNullableLerp[i],
      ),
      growable: false,
    );

    return ConstructorParams._(params: params);
  }

  const ConstructorParams._({required this.params});

  /// List of constructor parameters, with positional ones first.
  final List<ConstructorParam> params;
}
