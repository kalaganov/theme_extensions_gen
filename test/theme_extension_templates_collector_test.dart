import 'dart:convert';
import 'dart:io';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/theme_extension_templates_collector.dart';

Future<void> main() async {
  test('ThemeExtensionTemplatesCollector collects templates correctly',
      () async {
    final inputSource =
        File('test/assets/app_themes.template').readAsStringSync();
    final expectedOutput =
        File('test/assets/app_themes.templates.json').readAsStringSync();

    final writer = InMemoryAssetWriter();

    await testBuilder(
      ThemeExtensionTemplatesCollector(),
      {'a|lib/features/profile/app_themes.dart': inputSource},
      writer: writer,
      reader: await PackageAssetReader.currentIsolate(),
    );

    final actualId =
        AssetId('a', 'lib/features/profile/app_themes.theme_templates.json');
    final actual = String.fromCharCodes(writer.assets[actualId]!.toList());
    final actualJson = jsonDecode(actual);
    final expectedJson = jsonDecode(expectedOutput);

    const eq = DeepCollectionEquality.unordered();
    expect(eq.equals(actualJson, expectedJson), isTrue);
  });
}
