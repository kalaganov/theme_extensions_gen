/// Marks a class as a template for generating a `ThemeExtension`
/// implementation.
///
/// This annotation is used by the code generator to create the full
/// implementation of a `ThemeExtension`, including commonly required
/// methods like `copyWith` and `lerp`.
///
/// The annotated class must declare all required fields explicitly.
class ThemeExtensionTemplate {
  /// Annotation used to mark a class as a ThemeExtension template.
  /// This generates a factory-based implementation with boilerplate.
  const ThemeExtensionTemplate();
}

/// Shorthand for [ThemeExtensionTemplate].
///
/// Use this to mark a class as a template for generating a complete
/// `ThemeExtension` implementation.
const themeExtensionTemplate = ThemeExtensionTemplate();

/// Marks a top-level function, getter, or variable that returns either
/// a `ThemeExtension` or a `List` of `ThemeExtension`s.
///
/// The name of this member will be collected and used in the final
/// generated list of theme extensions.
///
/// If [group] is provided, the entry will be routed to the corresponding
/// output file defined in `build.yaml` under `output_groups`.
/// If omitted, the default file defined by `default_output` will be used.
class ThemeExtensionImpl {
  /// Annotation used to mark a list of ThemeExtensions for generation.
  /// Optionally supports grouping (e.g., light/dark).
  const ThemeExtensionImpl({this.group});

  /// Logical group name used to determine the output file.
  /// Matches a key from `output_groups` in `build.yaml`.
  final String? group;
}

/// Shorthand for [ThemeExtensionImpl] with default parameters.
///
/// Use this to mark a top-level function, getter, or variable that
/// returns a `ThemeExtension` or a `List` of them.
///
/// This entry will be included in the final generated list of
/// theme extensions.
const themeExtensionImpl = ThemeExtensionImpl();
