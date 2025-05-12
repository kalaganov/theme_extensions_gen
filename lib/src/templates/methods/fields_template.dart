import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/models/constructor_params.dart';
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// Template for generating final fields
/// for a `ThemeExtension` implementation class.
///
/// Each parameter declared in the constructor
/// will have a corresponding `final` field.
@immutable
final class FieldsTemplate implements Template {
  /// Creates a [FieldsTemplate] for the given [params].
  const FieldsTemplate({
    required ConstructorParams params,
  }) : _params = params;

  final ConstructorParams _params;

  @override
  void write(StringBuffer sb) {
    for (var i = 0; i < _params.params.length; i++) {
      final param = _params.params[i];
      sb.writeln('@override');
      sb.writeln('final ${param.type} ${param.name};\n');
    }
  }
}
