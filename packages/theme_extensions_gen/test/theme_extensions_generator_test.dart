import 'dart:io';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/misc/formatter.dart';
import 'package:theme_extensions_gen/src/theme_extensions_generator.dart';

Future<void> main() async {
  test('generates correct output', () async {
    final inputSource =
        File('test/assets/app_themes.template').readAsStringSync();
    final expectedOutput =
        File('test/assets/app_themes_generated.part').readAsStringSync();

    final writer = InMemoryAssetWriter();

    await testBuilder(
      SharedPartBuilder(
        [ThemeExtensionsGenerator()],
        'theme_extensions',
        formatOutput: noopFormatter,
      ),
      {'a|lib/src/app_themes.dart': inputSource},
      writer: writer,
      reader: await PackageAssetReader.currentIsolate(),
    );
    final actualId = AssetId('a', 'lib/src/app_themes.theme_extensions.g.part');
    final actual = String.fromCharCodes(writer.assets[actualId]!.toList());

    expect(
      _normalize(actual),
      equals(_normalize(expectedOutput)),
    );
  });
}

String _normalize(String source) => source.replaceAll(RegExp(r'\s+'), '');
