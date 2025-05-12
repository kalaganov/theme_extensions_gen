import 'dart:convert';
import 'dart:io';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/theme_extension_impl_collector.dart';

import 'mock_elements/mock_elements.dart';

//ignore_for_file: deprecated_member_use

Future<void> main() async {
  test('ThemeExtensionTemplatesCollector collects implementations correctly',
      () async {
    final inputSource = File('test/assets/app_themes.impl').readAsStringSync();
    final expectedOutput =
        File('test/assets/app_themes.theme_impl.json').readAsStringSync();

    final writer = InMemoryAssetWriter();

    await testBuilder(
      ThemeExtensionImplCollector(),
      {'a|lib/src/app_themes.dart': inputSource},
      writer: writer,
      reader: await PackageAssetReader.currentIsolate(),
    );
    final actualId = AssetId('a', 'lib/src/app_themes.theme_impl.json');
    final actual = String.fromCharCodes(writer.assets[actualId]!.toList());

    final actualJson = jsonDecode(actual);
    final expectedJson = jsonDecode(expectedOutput);

    const eq = DeepCollectionEquality.unordered();
    expect(eq.equals(actualJson, expectedJson), isTrue);
  });

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
