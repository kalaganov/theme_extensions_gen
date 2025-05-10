import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// A template for generating a mixin with unimplemented getters and methods.
///
/// This mixin provides the interface for theme extension classes, including
/// property getters and the required ```copyWith``` and ```lerp``` methods.
@immutable
final class MixinTemplate implements Template {
  /// Creates a [MixinTemplate] with the given class name and property list.
  MixinTemplate({
    required String className,
    required List<String> propertyNames,
    required List<String> propertyTypes,
  })  : _className = className,
        _propertyNames = propertyNames,
        _propertyTypes = propertyTypes;

  final String _className;
  final List<String> _propertyNames;
  final List<String> _propertyTypes;

  @override
  void write(StringBuffer sb) {
    sb.writeln('/// @nodoc');
    sb.writeln('// ignore: unused_element');
    sb.writeln('mixin _\$${_className}Mixin {');
    for (var i = 0; i < _propertyNames.length; i++) {
      sb.writeln('${_propertyTypes[i]} get ${_propertyNames[i]} '
          '=> throw UnimplementedError();\n');
    }
    sb.writeln('ThemeExtension<$_className> copyWith() '
        '=> throw UnimplementedError();\n');
    sb.writeln('ThemeExtension<$_className> lerp('
        'covariant $_className? other, '
        'double t,'
        ') => throw UnimplementedError();\n');
    sb.writeln('}\n');
  }
}
