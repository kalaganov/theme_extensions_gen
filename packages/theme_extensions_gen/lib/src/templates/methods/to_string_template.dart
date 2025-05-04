import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/models/constructor_params.dart';
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// Template for generating the `toString` method
/// for a `ThemeExtension` class implementation.
///
/// Produces a simple, readable single-line `toString` output
/// listing all constructor parameters and their values.
@immutable
final class ToStringTemplate implements Template {
  /// Creates a [ToStringTemplate] with the given [className] and [params].
  ///
  /// The parameters are used to generate the formatted string representation
  /// for debugging and logging purposes.
  const ToStringTemplate({
    required String className,
    required ConstructorParams params,
  })  : _className = className,
        _params = params;

  final String _className;
  final ConstructorParams _params;

  @override
  void write(StringBuffer sb) {
    sb.writeln('@override');
    sb.writeln('String toString() =>  \'$_className(\'');
    for (var i = 0; i < _params.params.length; i++) {
      final p = _params.params[i];
      final suffix = i == _params.params.length - 1 ? '\'' : ', \'';
      sb.writeln('\'${p.name}: \$${p.name}$suffix');
    }
    sb.writeln('\n\')\';');
  }
}
