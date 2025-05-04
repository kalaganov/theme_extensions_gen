import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/validators/theme_extension_template_validator.dart';
import 'package:theme_extensions_gen_annotations/theme_extensions_gen_annotations.dart';

void main() {
  test('fails when class has more than one constructor', () async {
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
                  e.message.contains(' must have exactly one constructor. ') &&
                  e.message.contains('Found: '),
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

@ThemeExtensionTemplate()
abstract interface class AppTheme extends ThemeExtension<AppTheme>
    with _$AppThemeMixin {
  const factory AppTheme({
    required Size size,
  }) = _$AppTheme;

  const factory AppThemeAnother({
    required Size size,
  }) = _$AppTheme;
}
    ''';
