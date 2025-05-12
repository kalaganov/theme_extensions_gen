import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/exceptions/theme_impl_validation_exception.dart';
import 'package:theme_extensions_gen/src/validators/theme_extension_impl_validator.dart';
import 'package:theme_extensions_gen_annotations/theme_extensions_gen_annotations.dart';

// ignore_for_file: lines_longer_than_80_chars

void main() {
  test(
      'fails when annotated element is not top-level variable, function, or getter',
      () async {
    final inputId = AssetId('theme_extensions', 'lib/app_theme_impl.dart');
    const typeChecker = TypeChecker.fromRuntime(ThemeExtensionImpl);
    const validator = ThemeExtensionImplValidator();

    await resolveSource(
      _source,
      (resolver) async {
        final lib = await resolver.libraryFor(inputId);
        final reader = LibraryReader(lib);
        final element = reader.annotatedWith(typeChecker).single.element;

        expect(
          () => validator.validateElement(element),
          throwsA(
            predicate(
              (e) =>
                  e is ThemeImplValidationException &&
                  e.message.contains(
                    'Element must be a top-level variable, '
                    'function, or getter.',
                  ),
            ),
          ),
        );
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
class A {}
''';
