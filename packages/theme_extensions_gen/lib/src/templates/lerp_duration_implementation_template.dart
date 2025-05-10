import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// A template for generating the ```lerpDuration```
/// function used in interpolation.
///
/// The generated function is copied
/// from `package:flutter/foundation.dart` and provides linear
/// interpolation between two numeric values of type `num?`.
@immutable
final class LerpDurationImplementationTemplate implements Template {
  /// Creates a [LerpDurationImplementationTemplate].
  const LerpDurationImplementationTemplate();

  @override
  void write(StringBuffer sb) {
    sb.writeln('''
    
  // This code is copied from the `package:flutter/foundation.dart` 

  /// Linearly interpolate between two `Duration`s.
  Duration _lerpDuration(Duration a, Duration b, double t) {
    return Duration(
      microseconds: (a.inMicroseconds + (b.inMicroseconds - a.inMicroseconds) * t).round(),
    );
  }
    ''');
  }
}
