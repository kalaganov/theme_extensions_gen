import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/models/constructor_params.dart';
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// A template for generating an abstract class with a factory constructor.
///
/// This template generates an abstract class that implements a given class
/// and declares a factory constructor redirecting to an implementation class.
@immutable
final class AbstractClassTemplate implements Template {
  /// Creates an [AbstractClassTemplate] with the given class and properties.
  AbstractClassTemplate({
    required String className,
    required String abstractClassName,
    required ConstructorParams params,
  })  : _className = className,
        _abstractClassName = abstractClassName,
        _params = params;

  final ConstructorParams _params;
  final String _className;
  final String _abstractClassName;

  @override
  void write(StringBuffer sb) {
    sb.writeln('/// @nodoc');
    sb.writeln(
      'abstract class $_abstractClassName implements $_className {\n'
      '  const factory $_abstractClassName(',
    );

    sb.writeln('  {');
    for (final p in _params.params) {
      sb.writeln('    required ${p.type} ${p.name},');
    }
    sb.writeln('  }');

    sb.writeln(') = ${_abstractClassName}Impl;\n');
    sb.writeln('}\n');
  }
}
