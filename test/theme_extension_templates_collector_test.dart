import 'dart:io';

import 'package:build_test/build_test.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/theme_extension_templates_collector.dart';

Future<void> main() async {
  test(
    'ThemeExtensionTemplatesCollector collects templates correctly',
    () async {
      final inputSource = File(
        'test/assets/app_themes.template',
      ).readAsStringSync();
      final expectedOutput = File(
        'test/assets/app_themes.templates.json',
      ).readAsStringSync();
      final readerWriter = TestReaderWriter(rootPackage: 'a');
      await readerWriter.testing.loadIsolateSources();

      await testBuilder(
        ThemeExtensionTemplatesCollector(),
        {'a|lib/src/app_themes.dart': inputSource},
        outputs: {
          'a|lib/src/app_themes.theme_templates.json': expectedOutput.replaceAll(
            RegExp(r'\s+'),
            '',
          ),
        },
        rootPackage: 'a',
        readerWriter: readerWriter,
      );
    },
  );
}
