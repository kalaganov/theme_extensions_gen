import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/models/constructor_params.dart';
import 'package:theme_extensions_gen/src/templates/interface/template.dart';
import 'package:theme_extensions_gen/src/templates/lerp_double_implementation_template.dart';
import 'package:theme_extensions_gen/src/templates/lerp_duration_implementation_template.dart';
import 'package:theme_extensions_gen/src/templates/methods/constructor_template.dart';
import 'package:theme_extensions_gen/src/templates/methods/copy_with_template.dart';
import 'package:theme_extensions_gen/src/templates/methods/debug_fill_properties_template.dart';
import 'package:theme_extensions_gen/src/templates/methods/equals_template.dart';
import 'package:theme_extensions_gen/src/templates/methods/fields_template.dart';
import 'package:theme_extensions_gen/src/templates/methods/hashcode_template.dart';
import 'package:theme_extensions_gen/src/templates/methods/lerp_template.dart';
import 'package:theme_extensions_gen/src/templates/methods/to_string_template.dart';
import 'package:theme_extensions_gen/src/templates/methods/type_getter_template.dart';

/// A template for generating the implementation of a `ThemeExtension` class.
///
/// This implementation class
/// extends `ThemeExtension` and overrides required
/// methods such as `copyWith`, `lerp`, `==`, and `hashCode`.
@immutable
final class ClassImplTemplate implements Template {
  /// Creates a [ClassImplTemplate] with the provided class and properties.
  ClassImplTemplate({
    required String className,
    required String abstractClassName,
    required ConstructorParams params,
    required bool useDiagnosticableMixin,
  })  : _className = className,
        _abstractClassName = abstractClassName,
        _params = params,
        _hasDoubleParam = params.params.any((p) => p.type == 'double'),
        _hasDurationParam = params.params.any((p) => p.type == 'Duration'),
        _useDiagnosticableMixin = useDiagnosticableMixin;

  final String _className;
  final String _abstractClassName;
  final ConstructorParams _params;
  final bool _hasDoubleParam;
  final bool _hasDurationParam;
  final bool _useDiagnosticableMixin;

  @override
  void write(StringBuffer sb) {
    final diagnosticableMixin =
        _useDiagnosticableMixin ? 'with Diagnosticable ' : '';

    sb.writeln('/// @nodoc');
    sb.writeln('@immutable');
    sb.writeln(
      'class ${_abstractClassName}Impl extends ThemeExtension<$_className> '
      '$diagnosticableMixin'
      'implements $_abstractClassName {',
    );

    final templates = [
      ConstructorTemplate(className: _abstractClassName, params: _params),
      FieldsTemplate(params: _params),
      TypeGetterTemplate(className: _className),
      EqualsTemplate(className: _className, params: _params),
      HashcodeTemplate(params: _params),
      CopyWithTemplate(className: _className, params: _params),
      LerpTemplate(className: _className, params: _params),
      if (_hasDoubleParam) const LerpDoubleImplementationTemplate(),
      if (_hasDurationParam) const LerpDurationImplementationTemplate(),
      if (_useDiagnosticableMixin)
        DebugFillPropertiesTemplate(params: _params)
      else
        ToStringTemplate(className: _className, params: _params),
    ];

    for (final template in templates) {
      template.write(sb);
    }

    sb.writeln('}\n');
  }
}
