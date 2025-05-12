import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/models/constructor_params.dart';
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// Template for generating the `debugFillProperties` method
/// for a `Diagnosticable` class implementation.
///
/// This method is used to add all constructor parameters
/// into the diagnostics tree for better debugging support.
@immutable
final class DebugFillPropertiesTemplate implements Template {
  /// Creates a [DebugFillPropertiesTemplate] with the given constructor params.
  ///
  /// The [params] list is used to generate `properties.add(...)`
  /// for each field.
  const DebugFillPropertiesTemplate({
    required ConstructorParams params,
  }) : _params = params;

  final ConstructorParams _params;

  @override
  void write(StringBuffer sb) {
    sb.writeln('@override');
    sb.writeln('void debugFillProperties('
        'DiagnosticPropertiesBuilder properties,) {');
    sb.writeln('super.debugFillProperties(properties);');

    sb.writeln('properties');
    for (final param in _params.params) {
      sb.writeln('..add(${_diagnosticPropertyForType(param.type)}('
          '\'${param.name}\', ${param.name}))');
    }
    sb.writeln('  ;');
    sb.writeln('}\n');
  }

  String _diagnosticPropertyForType(String type) => switch (type) {
        'bool' => 'FlagProperty',
        'int' => 'IntProperty',
        'double' => 'DoubleProperty',
        'String' => 'StringProperty',
        _ => 'DiagnosticsProperty',
      };
}
