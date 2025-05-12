import 'package:meta/meta.dart' show immutable;

/// An interface for code generation templates.
@immutable
abstract interface class Template {
  /// Writes the template output to the given [StringBuffer].
  void write(StringBuffer sb);
}
