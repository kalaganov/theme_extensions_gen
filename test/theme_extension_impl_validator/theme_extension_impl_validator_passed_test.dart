import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/validators/theme_extension_impl_validator.dart';
import 'package:theme_extensions_gen_annotations/theme_extensions_gen_annotations.dart';

import 'generated_source.dart';
import 'impl_source.dart';

void main() {
  test('valid ThemeExtensionImpl passes validation', () async {
    final inputId = AssetId('theme_extensions', 'lib/app_theme_impl.dart');
    const typeChecker = TypeChecker.fromRuntime(ThemeExtensionImpl);
    const validator = ThemeExtensionImplValidator();

    await resolveSource(
      _source,
      (resolver) async {
        final lib = await resolver.libraryFor(inputId);
        final reader = LibraryReader(lib);
        final elements = reader.annotatedWith(typeChecker);

        for (final annotated in elements) {
          expect(
            () => validator.validateElement(annotated.element),
            returnsNormally,
          );
        }
      },
      inputId: inputId,
    );
  });
}

const _source = '''
library test;

import 'package:flutter/material.dart';
import 'package:theme_extensions_gen_annotations/theme_extensions_gen_annotations.dart';

@ThemeExtensionImpl()
List<ThemeExtension> themeExtensionsFunctionEmpty() {
  return [];
}

@ThemeExtensionImpl()
List<ThemeExtension> get themeExtensionsGetterEmpty => [];

@ThemeExtensionImpl()
const themeExtensionsTopLevelVariableEmpty = <ThemeExtension>[];

// -----------
@ThemeExtensionImpl()
List<ThemeExtension> themeExtensionsFunctionList() {
  return [
    $implSource,
  ];
}

@ThemeExtensionImpl(group: 'dark')
List<ThemeExtension> get themeExtensionsGetterList => [
  $implSource,
];

@ThemeExtensionImpl()
const themeExtensionsTopLevelList = [
  $implSource,
];

// -----------
@ThemeExtensionImpl()
ThemeExtension themeExtensionsFunction() {
  return $implSource;
}

@ThemeExtensionImpl(group: 'dark')
ThemeExtension get themeExtensionsGetter => $implSource;

@ThemeExtensionImpl()
const themeExtensionsTopLevelVariable = $implSource;

// -----------
class MyThemeExtension extends ThemeExtension {}

@ThemeExtensionImpl()
MyThemeExtension get themeExtensionsGetter => $implSource;

$generatedSource
''';
