import 'dart:io';

import 'package:build_test/build_test.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/theme_extension_impl_collector.dart';

import 'mock_elements/mock_elements.dart';

Future<void> main() async {
  test(
    'ThemeExtensionTemplatesCollector collects implementations correctly',
    () async {
      final inputSource = File(
        'test/assets/app_themes.impl',
      ).readAsStringSync();
      final expectedOutput = File(
        'test/assets/app_themes.theme_impl.json',
      ).readAsStringSync();

      final readerWriter = TestReaderWriter(rootPackage: 'a');
      await readerWriter.testing.loadIsolateSources();

      await testBuilder(
        ThemeExtensionImplCollector(),
        {'a|lib/src/app_themes.dart': inputSource},
        outputs: {
          'a|lib/src/app_themes.theme_impl.json': expectedOutput.replaceAll(
            RegExp(r'\s+'),
            '',
          ),
        },
        rootPackage: 'a',
        readerWriter: readerWriter,
      );
    },
  );

  test('ThemeExtensionTemplatesCollector internal methods fail', () {
    final builder = ThemeExtensionImplCollector();

    expect(
      () => builder.resolveNamePrefix(MockElement()),
      throwsA(
        predicate(
          (e) =>
              e is StateError && e.message.contains('Unexpected element type:'),
        ),
      ),
    );

    expect(
      () => builder.resolveElementName(MockElement()),
      throwsA(
        predicate(
          (e) =>
              e is StateError && e.message.contains('Unexpected element type:'),
        ),
      ),
    );
  });
}
