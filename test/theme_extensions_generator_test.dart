import 'dart:io';

import 'package:build_test/build_test.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/theme_extensions_generator.dart';

Future<void> main() async {
  test('generates correct output', () async {
    final inputSource = File(
      'test/assets/app_themes.template',
    ).readAsStringSync();
    final expectedOutput = File(
      'test/assets/app_themes_generated.part',
    ).readAsStringSync();

    final readerWriter = TestReaderWriter(rootPackage: 'a');
    await readerWriter.testing.loadIsolateSources();

    await testBuilder(
      SharedPartBuilder([ThemeExtensionsGenerator()], 'theme_extensions'),
      {'a|lib/src/app_themes.dart': inputSource},
      outputs: {'a|lib/src/app_themes.theme_extensions.g.part': expectedOutput},
      rootPackage: 'a',
      readerWriter: readerWriter,
    );
  });
}
