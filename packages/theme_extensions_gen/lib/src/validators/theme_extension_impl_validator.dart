import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:meta/meta.dart' show immutable, visibleForTesting;
import 'package:theme_extensions_gen/src/exceptions/theme_impl_validation_exception.dart';

//ignore_for_file: deprecated_member_use

/// Validates that an annotated element is a valid theme implementation.
///
/// Must be a top-level variable, function, or getter that:
/// - returns a `ThemeExtension` or `List<ThemeExtension>`
/// - has no parameters (if it's a function)
@immutable
final class ThemeExtensionImplValidator {
  /// Creates a [ThemeExtensionImplValidator]
  const ThemeExtensionImplValidator();

  /// Validates a single element for correct usage of
  /// `@CustomThemeExtensionImpl` annotation.
  void validateElement(Element element) {
    validateElementKind(element);
    validateElementReturnType(element);
    validateElementParameters(element);
  }

  /// Validates that the element is top-level (variable, function, or getter).
  @visibleForTesting
  void validateElementKind(Element element) {
    final valid = switch (element) {
      TopLevelVariableElement _ => true,
      FunctionElement e when e.isTopLevel => true,
      PropertyAccessorElement e when e.isGetter && e.isTopLevel => true,
      _ => false,
    };
    if (!valid) {
      throw ThemeImplValidationException(
        'Element must be a top-level variable, function, or getter.',
        element,
      );
    }
  }

  /// Validates that the element's return type
  /// is `ThemeExtension` or `List<ThemeExtension>`.
  @visibleForTesting
  void validateElementReturnType(Element element) {
    final type = switch (element) {
      TopLevelVariableElement e => e.type,
      FunctionElement e => e.returnType,
      PropertyAccessorElement e => e.returnType,
      _ => throw UnsupportedError('Unsupported element type.'),
    };
    if (!type.isThemeExtension && !type.isListOfThemeExtension) {
      throw ThemeImplValidationException(
        'Return type must be ThemeExtension or List<ThemeExtension>.',
        element,
      );
    }
  }

  /// Validates that a function has no parameters.
  @visibleForTesting
  void validateElementParameters(Element element) {
    if (element is! FunctionElement) return;

    if (element.parameters.isNotEmpty) {
      throw ThemeImplValidationException(
        'Annotated function must not accept any parameters.',
        element,
      );
    }
  }
}

extension _ElementExt on Element {
  bool get isTopLevel => enclosingElement3 is CompilationUnitElement;
}

extension _DartTypeExt on DartType {
  bool get isThemeExtension {
    final element = this.element;
    if (element is! InterfaceElement) return false;
    if (element.name == 'ThemeExtension' &&
        element.library.identifier.startsWith('package:flutter/') == true) {
      return true;
    }

    return element.allSupertypes.any((t) {
      final e = t.element;
      return e.name == 'ThemeExtension' &&
          e.library.identifier.startsWith('package:flutter/') == true;
    });
  }

  bool get isListOfThemeExtension {
    if (this is! ParameterizedType) return false;

    final type = this as ParameterizedType;
    if (!type.isDartCoreList || type.typeArguments.length != 1) {
      return false;
    }

    final generic = type.typeArguments.single;
    return generic.isThemeExtension;
  }
}
