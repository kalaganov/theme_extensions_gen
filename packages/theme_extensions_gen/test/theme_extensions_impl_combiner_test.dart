import 'dart:convert';

import 'package:build_test/build_test.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/models/collected_group.dart';
import 'package:theme_extensions_gen/src/models/options/theme_generator_config.dart';
import 'package:theme_extensions_gen/src/theme_extensions_impl_combiner.dart';

void main() {
  group('ThemeExtensionsImplCombiner', () {
    test('generates Dart file from valid .theme_impl.json', () async {
      final builder = ThemeExtensionsImplCombiner(
        ThemeGeneratorConfig.fromMap(_validConfig),
      );

      await testBuilder(
        builder,
        {
          'a|lib/src/input.theme_impl.json': jsonEncode(_inputJson),
        },
        outputs: {
          r'a|lib/generated/default.dart': decodedMatches(_generatedOutput),
        },
      );
    });
    test('ThemeExtensionTemplatesCollector internal methods fail', () {
      final builder = ThemeExtensionsImplCombiner(
        ThemeGeneratorConfig.fromMap(_validConfig),
      );
      expect(
        () => builder.warnOnUndeclaredGroups([
          const CollectedGroup(
            group: 'missing',
            importToNames: {
              'a': ['b']
            },
          ),
        ]),
        returnsNormally,
      );
    });
  });
}

final _validConfig = {
  'default_output': {
    'path': 'generated/default.dart',
    'list_name': 'defaultTheme'
  }
};

final _inputJson = {
  'data': [
    {
      'group': null,
      'import': 'package:a/src/colors.dart',
      'name': 'themeColors'
    },
    {
      'group': null,
      'import': 'package:a/src/spacing.dart',
      'name': '...themeSpacing'
    }
  ]
};

const _generatedOutput = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
// **************************************************
// ThemeExtensionsImplCombiner
// **************************************************

import 'package:a/src/colors.dart' as \$i1;
import 'package:a/src/spacing.dart' as \$i2;
import 'package:flutter/material.dart';

/// Combined list of all collected `ThemeExtension` instances.
///
/// Add this to your `ThemeData.extensions`.
///
/// Example:
/// ```dart
/// ThemeData(
///   extensions: defaultTheme,
/// )
/// ```
///
/// Or merge:
/// ```dart
/// ThemeData(
///   extensions: [
///     ...otherExtensions,
///     ...defaultTheme,
///   ],
/// )
/// ```
List<ThemeExtension> get defaultTheme => [
      \$i1.themeColors,
      ...\$i2.themeSpacing,
    ];
''';
