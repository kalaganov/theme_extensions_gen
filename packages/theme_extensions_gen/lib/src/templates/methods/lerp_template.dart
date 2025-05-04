import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/models/constructor_params.dart';
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// Template for generating the `lerp` method
/// for a `ThemeExtension` class implementation.
///
/// This method handles linear interpolation between two theme extensions,
/// field-by-field, supporting types like `double`, `Duration`,
/// and types with a `lerp` static method or factory constructor.
@immutable
final class LerpTemplate implements Template {
  /// Creates a [LerpTemplate] with the given [className] and [params].
  ///
  /// Uses the constructor parameters to generate interpolation
  /// logic for each field.
  const LerpTemplate({
    required String className,
    required ConstructorParams params,
  })  : _className = className,
        _params = params;

  final String _className;
  final ConstructorParams _params;

  @override
  void write(StringBuffer sb) {
    sb.writeln('@override');
    sb.writeln('ThemeExtension<$_className> lerp(');
    sb.writeln('ThemeExtension<$_className>? other,');
    sb.writeln('double t,');
    sb.writeln(') => ');
    sb.writeln('other is! $_className ? this :');
    sb.writeln('$_className(');
    for (var i = 0; i < _params.params.length; i++) {
      final param = _params.params[i];
      if (param.type == 'double') {
        sb.writeln(
          '${param.name}: _lerpDouble(${param.name}, '
          'other.${param.name}, t),',
        );
      } else if (param.type == 'Duration') {
        sb.writeln(
          '${param.name}: _lerpDuration(${param.name}, '
          'other.${param.name}, t),',
        );
      } else {
        final nullabilitySuffix = param.isLerpMethodNullable ? '!' : '';
        sb.writeln(
          '${param.name}: ${param.type}.lerp('
          '${param.name}, other.${param.name}, t,)$nullabilitySuffix,',
        );
      }
    }
    sb.writeln(');');
    sb.writeln();
  }
}
