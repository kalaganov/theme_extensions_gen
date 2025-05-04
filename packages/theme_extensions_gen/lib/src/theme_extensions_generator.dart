import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart'
    show NullabilitySuffix;
import 'package:build/build.dart';
import 'package:meta/meta.dart' show immutable;
import 'package:source_gen/source_gen.dart';
import 'package:theme_extensions_gen/src/models/constructor_params.dart';
import 'package:theme_extensions_gen/src/templates/abstract_class_template.dart';
import 'package:theme_extensions_gen/src/templates/class_impl_template.dart';
import 'package:theme_extensions_gen/src/templates/mixin_template.dart';
import 'package:theme_extensions_gen/src/validators/theme_extension_template_validator.dart';
import 'package:theme_extensions_gen_annotations/theme_extensions_gen_annotations.dart';

//ignore_for_file: deprecated_member_use

/// Generates theme extension implementations based on the
/// [ThemeExtensionTemplate] annotation.
@immutable
final class ThemeExtensionsGenerator
    extends GeneratorForAnnotation<ThemeExtensionTemplate> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final redirectedName = await _extractRedirectedConstructorName(
      buildStep,
      element,
    );
    final validator = ThemeExtensionTemplateValidator(
      annotation,
      element,
      redirectedName,
    );
    validator.validate();

    final classElement = element as ClassElement;
    final constructor = classElement.constructors.single;
    final className = classElement.name;
    final parameters = constructor.parameters;

    final names = parameters.map((p) => p.name).toList(growable: false);
    final types =
        parameters.map((p) => p.type.toString()).toList(growable: false);

    final isNullableLerp =
        parameters.map(_isLerpMethodNullable).toList(growable: false);

    final params = ConstructorParams.fromParts(
      names: names,
      types: types,
      isNullableLerp: isNullableLerp,
    );

    final templates = [
      MixinTemplate(
        className: className,
        propertyNames: names,
        propertyTypes: types,
      ),
      AbstractClassTemplate(
        className: className,
        abstractClassName: redirectedName,
        params: params,
      ),
      ClassImplTemplate(
        className: className,
        params: params,
        abstractClassName: redirectedName,
        useDiagnosticableMixin: _hasDiagnosticableMixin(classElement),
      ),
    ];

    final sb = StringBuffer();
    for (final t in templates) {
      t.write(sb);
    }

    return sb.toString();
  }

  Future<String> _extractRedirectedConstructorName(
    BuildStep buildStep,
    Element element,
  ) async {
    final assetId = element.source!.uri;
    final fileContent = await buildStep.readAsString(
      AssetId.resolve(assetId),
    );
    final stripped = fileContent.replaceAll(RegExp(r'\s+'), '');
    final pattern = RegExp(
      'factory${element.name}\\(.*?\\)=(_?[^;]+);',
    );
    final match = pattern.firstMatch(stripped);
    return match?.group(1) ?? '';
  }

  bool _isLerpMethodNullable(ParameterElement parameter) {
    if (parameter.type.isDartCoreDouble ||
        parameter.type.getDisplayString() == 'Duration') {
      return false;
    } else {
      final element = parameter.type.element as ClassElement?;
      final staticLerp = element?.getMethod('lerp');
      if (staticLerp == null || !staticLerp.isStatic) return false;

      return staticLerp.returnType.nullabilitySuffix ==
          NullabilitySuffix.question;
    }
  }

  bool _hasDiagnosticableMixin(ClassElement classElement) =>
      classElement.mixins.any(
        (mixin) =>
            mixin.element.name == 'Diagnosticable' &&
            mixin.element.library.identifier.startsWith('package:flutter'),
      );
}
