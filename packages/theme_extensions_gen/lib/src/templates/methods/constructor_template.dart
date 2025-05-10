import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/models/constructor_params.dart';
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// Template for generating a constructor
/// for the `ThemeExtension` implementation class.
///
/// The constructor uses named and required parameters
/// corresponding to the theme properties.
@immutable
final class ConstructorTemplate implements Template {
  /// Creates a [ConstructorTemplate] for the given [className] and [params].
  const ConstructorTemplate({
    required String className,
    required ConstructorParams params,
  })  : _className = className,
        _params = params;

  final String _className;
  final ConstructorParams _params;

  @override
  void write(StringBuffer sb) {
    sb.write('const ${_className}Impl(');
    sb.writeln('  {');
    for (final p in _params.params) {
      sb.writeln('    required this.${p.name},');
    }
    sb.writeln('  });');
    sb.writeln();
  }
}
