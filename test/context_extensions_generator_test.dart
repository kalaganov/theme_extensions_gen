import 'dart:convert';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/context_extensions_generator.dart';
import 'package:theme_extensions_gen/src/models/options/context_extensions_generator_config.dart';
import 'package:theme_extensions_gen/src/models/options/option_keys.dart';
import 'package:yaml/yaml.dart';

Future<void> main() async {
  test('generates correct output from multiple templates', () async {
    final inputs = <String, String>{
      'a|lib/src/template1.theme_templates.json': jsonEncode({
        'templateNames': ['AppThemeHomeAppBar'],
        'importUri': 'package:a/features/home/app_bar_themes.dart',
      }),
      'a|lib/src/template2.theme_templates.json': jsonEncode({
        'templateNames': ['AppThemeHomeCard'],
        'importUri': 'package:a/features/home/card_themes.dart',
      }),
      'a|lib/src/template3.theme_templates.json': jsonEncode({
        'templateNames': ['AppThemeTestSameName'],
        'importUri': 'package:a/features/home/other_themes.dart',
      }),
      'a|lib/src/template4.theme_templates.json': jsonEncode({
        'templateNames': ['AppThemeTestSameName'],
        'importUri': 'package:a/features/home/other_themes_filename.dart',
      }),
      'a|lib/src/template5.theme_templates.json': jsonEncode({
        'templateNames': ['AppThemeTestSameName'],
        'importUri': 'package:a/features/profile/other_themes_folder.dart',
      }),
    };

    const expectedOutput = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: lines_longer_than_80_chars

// **************************************************
// ContextExtensionsGenerator
// **************************************************

import 'package:a/features/home/app_bar_themes.dart' as a_0;
import 'package:a/features/home/card_themes.dart' as a_1;
import 'package:a/features/home/other_themes.dart' as a_2;
import 'package:a/features/home/other_themes_filename.dart' as a_3;
import 'package:a/features/profile/other_themes_folder.dart' as a_4;
import 'package:flutter/material.dart';

extension ContextThemeExtensions on BuildContext {
  /// `ThemeExtension<AppThemeHomeAppBar>`
  /// from [package:a/features/home/app_bar_themes.dart]
  a_0.AppThemeHomeAppBar get appThemeHomeAppBar =>
      Theme.of(this).extension<a_0.AppThemeHomeAppBar>()!;

  /// `ThemeExtension<AppThemeHomeCard>`
  /// from [package:a/features/home/card_themes.dart]
  a_1.AppThemeHomeCard get appThemeHomeCard =>
      Theme.of(this).extension<a_1.AppThemeHomeCard>()!;

  /// `ThemeExtension<AppThemeTestSameName>`
  /// from [package:a/features/home/other_themes.dart]
  a_2.AppThemeTestSameName get appThemeTestSameNameOtherThemes =>
      Theme.of(this).extension<a_2.AppThemeTestSameName>()!;

  /// `ThemeExtension<AppThemeTestSameName>`
  /// from [package:a/features/home/other_themes_filename.dart]
  a_3.AppThemeTestSameName get appThemeTestSameNameOtherThemesFilename =>
      Theme.of(this).extension<a_3.AppThemeTestSameName>()!;

  /// `ThemeExtension<AppThemeTestSameName>`
  /// from [package:a/features/profile/other_themes_folder.dart]
  a_4.AppThemeTestSameName get appThemeTestSameNameProfile =>
      Theme.of(this).extension<a_4.AppThemeTestSameName>()!;
}
''';

    final writer = InMemoryAssetWriter();

    await testBuilder(
      ContextExtensionsGenerator(
        ContextExtensionsGeneratorConfig.fromMap(
          const {OptionKeys.outputPath: 'src/context_extensions.dart'},
        ),
      ),
      inputs,
      writer: writer,
      reader: await PackageAssetReader.currentIsolate(),
    );

    final actualId = AssetId('a', 'lib/src/context_extensions.dart');
    final actual = String.fromCharCodes(writer.assets[actualId]!.toList());

    expect(
      _normalize(actual),
      equals(_normalize(expectedOutput)),
    );
  });

  test('ContextExtensionsGeneratorConfig equality and hashCode', () {
    final a = ContextExtensionsGeneratorConfig.fromMap(const {
      OptionKeys.outputPath: 'src/context_extensions.dart',
    });

    final b = ContextExtensionsGeneratorConfig.fromMap(const {
      OptionKeys.outputPath: 'src/context_extensions.dart',
    });

    final c = ContextExtensionsGeneratorConfig.fromMap(const {
      OptionKeys.outputPath: 'other.dart',
    });

    expect(a, equals(b));
    expect(a, isNot(equals(c)));
    expect(a.hashCode, equals(b.hashCode));
  });

  test('ContextExtensionsGeneratorConfig YAML', () {
    final a = ContextExtensionsGeneratorConfig.fromMap(YamlMap.wrap(const {
      OptionKeys.outputPath: 'src/context_extensions.dart',
    }));
    final b = ContextExtensionsGeneratorConfig.fromMap(YamlMap.wrap(const {
      OptionKeys.outputPath: 'src/context_extensions.dart',
    }));

    expect(a, equals(b));
    expect(a.hashCode, equals(b.hashCode));
  });
}

String _normalize(String source) => source.replaceAll(RegExp(r'\s+'), '');
