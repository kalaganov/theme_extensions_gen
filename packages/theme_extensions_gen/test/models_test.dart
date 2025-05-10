import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/models/collected_group.dart';
import 'package:theme_extensions_gen/src/models/collected_impl.dart';
import 'package:theme_extensions_gen/src/models/collected_impl_list.dart';
import 'package:theme_extensions_gen/src/models/collected_templates.dart';
import 'package:theme_extensions_gen/src/models/options/theme_generator_config.dart';
import 'package:yaml/yaml.dart';

void main() {
  group('CollectedImpl', () {
    test('CollectedImpl toJson/fromJson roundtrip', () {
      const original = CollectedImpl(
        group: 'brand',
        importUri: 'package:test/foo.dart',
        name: 'themeColors',
      );

      final json = original.toJson();
      final recreated = CollectedImpl.fromJson(json);

      expect(recreated, equals(original));
    });
    test('CollectedImpl equality and hashCode', () {
      const a = CollectedImpl(
        group: 'theme',
        name: '',
        importUri: '',
      );

      const b = CollectedImpl(
        group: 'theme',
        name: '',
        importUri: '',
      );

      const c = CollectedImpl(
        group: 'theme',
        name: '42',
        importUri: '',
      );

      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
      expect(a, isNot(equals(c)));
    });
  });

  group('CollectedImplList', () {
    test('serializes and deserializes correctly', () {
      const original = CollectedImplList(data: [
        CollectedImpl(
          group: 'brand',
          importUri: 'package:test/colors.dart',
          name: 'themeColors',
        ),
        CollectedImpl(
          group: null,
          importUri: 'package:test/spacing.dart',
          name: '...themeSpacing',
        ),
      ]);

      final json = original.toJson();
      final roundtrip = CollectedImplList.fromJson(json);

      expect(roundtrip.data, hasLength(2));
      expect(roundtrip.data[0], original.data[0]);
      expect(roundtrip.data[1], original.data[1]);
    });

    test('CollectedImplList equality and hashCode', () {
      const a = CollectedImplList(
        data: [
          CollectedImpl(
            group: 'group',
            importUri: 'importUri',
            name: 'name',
          ),
        ],
      );

      const b = CollectedImplList(
        data: [
          CollectedImpl(
            group: 'group',
            importUri: 'importUri',
            name: 'name',
          ),
        ],
      );

      const c = CollectedImplList(
        data: [
          CollectedImpl(
            group: 'group42',
            importUri: 'importUri',
            name: 'name',
          ),
        ],
      );

      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
      expect(a, isNot(equals(c)));
    });
  });

  group('ThemeGeneratorConfig', () {
    test('resolves default group values', () {
      final config = ThemeGeneratorConfig.fromMap(const {
        'default_output': {
          'path': 'lib/generated/default.dart',
          'list_name': 'defaultTheme',
        },
      });

      expect(config.resolvePathForGroup(null), 'lib/generated/default.dart');
      expect(config.resolveListNameForGroup(null), 'defaultTheme');
    });

    test('resolves default group values YAML', () {
      final config = ThemeGeneratorConfig.fromMap(YamlMap.wrap(const {
        'default_output': {
          'path': 'lib/generated/default.dart',
          'list_name': 'defaultTheme',
        },
      }));

      expect(config.resolvePathForGroup(null), 'lib/generated/default.dart');
      expect(config.resolveListNameForGroup(null), 'defaultTheme');
    });

    test('resolves named group if present', () {
      final config = ThemeGeneratorConfig.fromMap(const {
        'default_output': {
          'path': 'lib/generated/default.dart',
          'list_name': 'defaultTheme',
        },
        'output_groups': {
          'brand': {
            'path': 'lib/generated/brand.dart',
            'list_name': 'brandTheme',
          }
        }
      });

      expect(config.resolvePathForGroup('brand'), 'lib/generated/brand.dart');
      expect(config.resolveListNameForGroup('brand'), 'brandTheme');
    });

    test('resolves named group if present YAML', () {
      final config = ThemeGeneratorConfig.fromMap(YamlMap.wrap(const {
        'default_output': {
          'path': 'lib/generated/default.dart',
          'list_name': 'defaultTheme',
        },
        'output_groups': {
          'brand': {
            'path': 'lib/generated/brand.dart',
            'list_name': 'brandTheme',
          }
        }
      }));

      expect(config.resolvePathForGroup('brand'), 'lib/generated/brand.dart');
      expect(config.resolveListNameForGroup('brand'), 'brandTheme');
    });

    test('falls back to default if group not found', () {
      final config = ThemeGeneratorConfig.fromMap(const {
        'default_output': {
          'path': 'lib/generated/default.dart',
          'list_name': 'defaultTheme',
        },
        'output_groups': {
          'brand': {
            'path': 'lib/generated/brand.dart',
            'list_name': 'brandTheme',
          }
        }
      });

      expect(
          config.resolvePathForGroup('missing'), 'lib/generated/default.dart');
      expect(config.resolveListNameForGroup('missing'), 'defaultTheme');
      expect(config.isGroupMissing('missing'), true);
    });
  });

  test('equality and hashCode', () {
    final map = {
      'default_output': {
        'path': 'lib/default.dart',
        'list_name': 'defaultList',
      },
      'output_groups': {
        'group1': {
          'path': 'lib/group1.dart',
          'list_name': 'group1List',
        },
      },
    };

    final a = ThemeGeneratorConfig.fromMap(map);
    final b = ThemeGeneratorConfig.fromMap(map);

    final c = ThemeGeneratorConfig.fromMap(const {
      'default_output': {
        'path': 'lib/default.dart',
        'list_name': 'defaultList',
      },
      'output_groups': {
        'group1': {
          'path': 'lib/DIFFERENT.dart',
          'list_name': 'group1List',
        },
      },
    });

    expect(a, equals(b));
    expect(a.hashCode, equals(b.hashCode));
    expect(a, isNot(equals(c)));
  });

  test('CollectedGroup equality and hashCode', () {
    const a = CollectedGroup(
      group: 'theme',
      importToNames: {
        'package:foo/bar.dart': ['AppThemeBar'],
        'package:foo/baz.dart': ['AppThemeBaz'],
      },
    );

    const b = CollectedGroup(
      group: 'theme',
      importToNames: {
        'package:foo/bar.dart': ['AppThemeBar'],
        'package:foo/baz.dart': ['AppThemeBaz'],
      },
    );

    const c = CollectedGroup(
      group: 'theme',
      importToNames: {
        'package:foo/bar.dart': ['DIFFERENT'],
      },
    );

    expect(a, equals(b));
    expect(a.hashCode, equals(b.hashCode));
    expect(a, isNot(equals(c)));
  });

  test('CollectedTemplates equality and hashCode', () {
    const a = CollectedTemplates(
      importUri: '',
      templateNames: [''],
    );

    const b = CollectedTemplates(
      importUri: '',
      templateNames: [''],
    );

    const c = CollectedTemplates(
      importUri: '',
      templateNames: ['42'],
    );

    expect(a, equals(b));
    expect(a.hashCode, equals(b.hashCode));
    expect(a, isNot(equals(c)));
  });
}
