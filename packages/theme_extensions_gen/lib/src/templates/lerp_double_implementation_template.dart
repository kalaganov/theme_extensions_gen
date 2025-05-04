import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// A template for generating the `lerpDouble`
/// function used in interpolation.
@immutable
final class LerpDoubleImplementationTemplate implements Template {
  /// Creates a [LerpDoubleImplementationTemplate].
  const LerpDoubleImplementationTemplate();

  @override
  void write(StringBuffer sb) => sb.writeln(
        'double _lerpDouble(double a, double b, double t) =>'
        'a == b || (a.isNaN && b.isNaN) ? a : a * (1.0 - t) + b * t;\n',
      );
}
