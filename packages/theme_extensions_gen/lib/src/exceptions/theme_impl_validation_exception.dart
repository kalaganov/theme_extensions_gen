import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart' show immutable;

//ignore_for_file: deprecated_member_use

/// Exception thrown when an element annotated with
/// `@ThemeExtensionImpl` is invalid.
@immutable
final class ThemeImplValidationException implements Exception {
  /// Description of what is wrong.
  final String message;

  /// Element that caused the error.
  final Element? element;

  /// Creates a [ThemeImplValidationException]
  const ThemeImplValidationException(this.message, [this.element]);

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('ThemeImplValidationException: $message');
    if (element != null) {
      buffer
        ..write('\nElement: ${element!.displayName}')
        ..write('\nKind: ${element.runtimeType}');
    }
    return buffer.toString();
  }
}
