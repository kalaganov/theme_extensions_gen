import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/validators/theme_extension_template_validator.dart';
import 'package:theme_extensions_gen_annotations/theme_extensions_gen_annotations.dart';

void main() {
  test('valid ThemeExtension passes validation', () async {
    final inputId = AssetId('theme_extensions', 'lib/app_themes.template');
    const typeChecker = TypeChecker.fromRuntime(ThemeExtensionTemplate);

    await resolveSource(
      _source,
      (resolver) async {
        final lib = await resolver.libraryFor(
          inputId,
          allowSyntaxErrors: true,
        );
        final reader = LibraryReader(lib);
        final annotated = reader.annotatedWith(typeChecker).first;

        final validator = ThemeExtensionTemplateValidator(
          annotated.annotation,
          annotated.element,
          r'_$AppTheme',
        );

        expect(validator.validate, returnsNormally);
      },
      inputId: inputId,
    );
  });
}

const _source = r'''
library test;

import 'package:flutter/material.dart';
import 'package:theme_extensions_gen_annotations/theme_extensions_gen_annotations.dart';

part 'app_themes_generated.part';

@ThemeExtensionTemplate()
abstract interface class AppTheme extends ThemeExtension<AppTheme>
    with _$AppThemeMixin {
  const factory AppTheme({
    required TextStyle textStyle,
    required Color color,
    required Size size,
    required Decoration decoration,
    required Offset offset,
    required Alignment alignment,
    required Duration duration,
    required double gap,
    required Lerpable lerpableParam,
    required LerpableFactory lerpableFactoryParam,
  }) = _$AppTheme;
}

class Lerpable {
  static Lerpable lerp(
      Lerpable a,
      Lerpable b,
      double t,
      ) {
    throw UnimplementedError();
  }
}

class LerpableFactory {
  factory LerpableFactory.lerp(
      LerpableFactory a,
      LerpableFactory b,
      double t,
      ) {
    throw UnimplementedError();
  }
}
''';
