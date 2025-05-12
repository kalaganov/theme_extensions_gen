import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/validators/theme_extension_template_validator.dart';
import 'package:theme_extensions_gen_annotations/theme_extensions_gen_annotations.dart';

void main() {
  test('fails when third lerp parameter is not a non-nullable double',
      () async {
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

        expect(
          validator.validate,
          throwsA(
            predicate(
              (e) =>
                  e is InvalidGenerationSource &&
                  e.message.contains('The third parameter of "lerp" in ') &&
                  e.message.contains('must be a non-nullable double.'),
            ),
          ),
        );
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

class WrongLerpable {
  static WrongLerpable lerp(
    WrongLerpable a,
    WrongLerpable b,
    double? t,
  ) {
    throw UnimplementedError();
  }
}

@ThemeExtensionTemplate()
abstract interface class AppTheme extends ThemeExtension<AppTheme>
    with _$AppThemeMixin {
  const factory AppTheme({
    required WrongLerpable param,
  }) = _$AppTheme;
}
    ''';
