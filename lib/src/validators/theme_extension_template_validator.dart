import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart'
    show NullabilitySuffix;
import 'package:analyzer/dart/element/type.dart' show DartType;
import 'package:collection/collection.dart';
import 'package:meta/meta.dart' show immutable, visibleForTesting;
import 'package:source_gen/source_gen.dart'
    show ConstantReader, InvalidGenerationSource;

//ignore_for_file: deprecated_member_use

/// Validates a class annotated for theme extension generation.
@immutable
final class ThemeExtensionTemplateValidator {
  /// Creates a [ThemeExtensionTemplateValidator].
  const ThemeExtensionTemplateValidator(
    this._annotation,
    this._element,
    this._redirectedConstructorName,
  );

  final ConstantReader _annotation;
  final Element _element;
  final String _redirectedConstructorName;

  /// Runs all validation checks on the annotated class.
  ///
  /// Ensures the class structure, inheritance, constructors,
  /// and `lerp`-related requirements are correctly implemented.
  void validate() {
    validateAnnotation();
    validateInheritance();
    _validateConstructors();
    _validateLerpStaticMethodOrFactory();
  }

  /// nodoc
  @visibleForTesting
  void validateAnnotation() {
    if (_element is! ClassElement) {
      throw InvalidGenerationSource(
        'The annotation @${_annotation.objectValue.type} '
        'can only be used on classes.',
        element: _element,
      );
    }
  }

  /// nodoc
  @visibleForTesting
  void validateInheritance() {
    final classElement = _element as ClassElement;
    final directSuper = classElement.supertype;

    final superElement = directSuper?.element;

    if (directSuper == null ||
        superElement == null ||
        superElement.name != 'ThemeExtension' ||
        !superElement.library.identifier.startsWith('package:flutter')) {
      throw InvalidGenerationSource(
        'Class ${classElement.name} must directly extend '
        'ThemeExtension<${classElement.name}>. '
        'Found: $superElement.',
        element: _element,
      );
    }

  }

  void _validateConstructors() {
    final classElement = _element as ClassElement;
    final constructors = classElement.constructors;

    if (constructors.length != 1) {
      throw InvalidGenerationSource(
        'Class ${classElement.name} must have exactly one constructor. '
        'Found: ${constructors.length}.',
        element: _element,
      );
    }

    final ctor = constructors.single;

    if (!ctor.isFactory) {
      throw InvalidGenerationSource(
        'The constructor of ${classElement.name} must be a factory.',
        element: _element,
      );
    }

    final className = classElement.name;
    if (_redirectedConstructorName.isEmpty) {
      throw InvalidGenerationSource(
        'Could not find redirect constructor pattern '
        '"$className(...) = ".',
        element: _element,
      );
    } else {
      if (!_redirectedConstructorName.startsWith('_')) {
        throw InvalidGenerationSource(
          'The constructor of $className must redirect '
          'to a private constructor (starting with "_").',
          element: _element,
        );
      }
    }

    if (ctor.parameters.isEmpty) {
      throw InvalidGenerationSource(
        'The factory constructor of ${classElement.name} must have '
        'at least one parameter.',
        element: _element,
      );
    }

    if (!_hasOnlyRequiredNamedParams(ctor)) {
      throw InvalidGenerationSource(
        'All constructor parameters must be required named parameters.',
        element: _element,
      );
    }
  }

  void _validateLerpStaticMethodOrFactory() {
    final classElement = _element as ClassElement;
    final constructor = classElement.constructors.single;

    for (final param in constructor.parameters) {
      final paramTypeElement = param.type.element;

      if (param.type.nullabilitySuffix != NullabilitySuffix.none) {
        throw InvalidGenerationSource(
          'The parameter "${param.name}" in ${classElement.name} must be '
          'non-nullable.',
          element: _element,
        );
      }
      if (param.type.isDartCoreDouble ||
          param.type.getDisplayString() == 'Duration') {
        continue;
      }

      if (paramTypeElement is! ClassElement) {
        throw InvalidGenerationSource(
          'Parameter "${param.name}" of ${classElement.name} must be '
          'a class or interface.',
          element: _element,
        );
      }

      final lerpElement = _getLerpMethodOrConstructor(paramTypeElement);

      if (lerpElement == null) {
        throw InvalidGenerationSource(
          'Class ${paramTypeElement.name} (used in "${param.name}") must '
          'define a static method or named/factory constructor "lerp", '
          'or the parameter must be of type double or Duration.',
          element: _element,
        );
      }

      _validateLerpParameters(lerpElement, paramTypeElement);
    }
  }

  ExecutableElement? _getLerpMethodOrConstructor(ClassElement classElement) {
    final lerpMethod = classElement.methods.firstWhereOrNull(
      (m) => m.isStatic && m.name == 'lerp',
    );
    if (lerpMethod != null) return lerpMethod;

    final lerpConstructor = classElement.constructors.firstWhereOrNull(
      (c) => c.name == 'lerp' || (c.isFactory && c.name == 'lerp'),
    );
    return lerpConstructor;
  }

  void _validateLerpParameters(
    ExecutableElement lerpElement,
    ClassElement paramClassElement,
  ) {
    final params = lerpElement.parameters;

    if (params.length != 3) {
      throw InvalidGenerationSource(
        'The "lerp" method or constructor of ${paramClassElement.name} '
        'must have exactly 3 parameters.',
        element: _element,
      );
    }

    final firstParamType = params[0].type;
    final secondParamType = params[1].type;
    final thirdParamType = params[2].type;

    if (!thirdParamType.isDartCoreDouble ||
        thirdParamType.nullabilitySuffix != NullabilitySuffix.none) {
      throw InvalidGenerationSource(
        'The third parameter of "lerp" in ${paramClassElement.name} '
        'must be a non-nullable double.',
        element: _element,
      );
    }

    final firstValid = _isSameOrSubtype(firstParamType, paramClassElement);
    final secondValid = _isSameOrSubtype(secondParamType, paramClassElement);

    if (!firstValid || !secondValid) {
      throw InvalidGenerationSource(
        'The first two parameters of "lerp" in ${paramClassElement.name} '
        'must be of the same type or subtype of ${paramClassElement.name}.',
        element: _element,
      );
    }
  }

  bool _isSameOrSubtype(DartType paramType, ClassElement classElement) {
    final paramElement = paramType.element;
    if (paramElement is! ClassElement) return false;

    if (paramElement == classElement) return true;

    return paramElement.allSupertypes.any(
      (superType) => superType.element == classElement,
    );
  }

  bool _hasOnlyRequiredNamedParams(ConstructorElement ctor) =>
      ctor.parameters.every((p) => p.isRequiredNamed);
}
