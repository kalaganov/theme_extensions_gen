import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// Template for generating the `type` getter
/// for a `ThemeExtension` class implementation.
///
/// The generated `type` returns the original class name.
/// This is used for runtime type comparisons in Flutter's theming system.
@immutable
final class TypeGetterTemplate implements Template {
  /// Creates a [TypeGetterTemplate] for the given [className].
  const TypeGetterTemplate({
    required String className,
  }) : _className = className;

  final String _className;

  @override
  void write(StringBuffer sb) {
    sb.writeln('@override');
    sb.writeln('Object get type => $_className;\n');
  }
}
