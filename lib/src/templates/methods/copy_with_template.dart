import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/models/constructor_params.dart';
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// Template for generating the `copyWith` method
/// for a `ThemeExtension` class implementation.
///
/// The `copyWith` method allows creating a copy
/// of the object with modified fields while preserving
/// the other field values.
@immutable
final class CopyWithTemplate implements Template {
  /// Creates a [CopyWithTemplate] for the given [className] and [params].
  ///
  /// The generated method supports optional named parameters,
  /// where each field falls back to the existing value if not provided.
  const CopyWithTemplate({
    required String className,
    required ConstructorParams params,
  })  : _className = className,
        _params = params;

  final String _className;
  final ConstructorParams _params;

  @override
  void write(StringBuffer sb) {
    sb.writeln('@override');
    sb.writeln('$_className copyWith({');
    for (var i = 0; i < _params.params.length; i++) {
      final param = _params.params[i];
      sb.writeln('${param.type}? ${param.name},');
    }
    sb.writeln('}) => ');
    sb.writeln('$_className(');
    for (final p in _params.params) {
      final n = p.name;
      sb.writeln('$n: $n ?? this.$n,');
    }
    sb.writeln(');');
    sb.writeln();
  }
}
