import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/models/constructor_params.dart';
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// Template for generating the `==` (equality) operator
/// for a `ThemeExtension` class implementation.
///
/// The generated operator checks if the runtime type matches
/// and all fields are equal.
@immutable
final class EqualsTemplate implements Template {
  /// Creates an [EqualsTemplate] for the given [className] and [params].
  ///
  /// The generated method compares each field individually
  /// and returns `true` only if all fields are equal.
  const EqualsTemplate({
    required String className,
    required ConstructorParams params,
  })  : _className = className,
        _params = params;

  final String _className;
  final ConstructorParams _params;

  @override
  void write(StringBuffer sb) {
    sb.writeln('@override');
    sb.writeln('bool operator ==(Object other) => ');
    sb.writeln('identical(this, other) || '
        '(other.runtimeType == runtimeType && other is $_className && ');
    final paramsEqStr =
        _params.params.map((p) => '${p.name} == other.${p.name}').join(' && ');
    sb.writeln('$paramsEqStr);');
    sb.writeln();
  }
}
