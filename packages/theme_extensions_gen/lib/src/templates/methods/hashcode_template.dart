import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/models/constructor_params.dart';
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// Template for generating the `hashCode` getter
/// for a `ThemeExtension` class implementation.
///
/// Combines all constructor parameters using `^` (bitwise XOR)
/// to create a simple and effective hash code.
@immutable
final class HashcodeTemplate implements Template {
  /// Creates a [HashcodeTemplate] for the given [params].
  ///
  /// The parameters are used to generate a consistent
  /// `hashCode` based on all constructor fields.
  const HashcodeTemplate({
    required ConstructorParams params,
  }) : _params = params;

  final ConstructorParams _params;

  @override
  void write(StringBuffer sb) {
    sb.writeln('@override');
    final paramsHashStr =
        _params.params.map((p) => '${p.name}.hashCode').join(' ^ ');
    sb.writeln('int get hashCode => $paramsHashStr;\n');
  }
}
