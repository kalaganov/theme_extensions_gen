import 'package:test/test.dart';
import 'package:theme_extensions_gen_annotations/src/theme_extensions_gen_annotations.dart';

void main() {
  group('ThemeExtensionTemplate', () {
    test('default constructor', () {
      const annotation = ThemeExtensionTemplate();

      expect(annotation, isNotNull);
    });

    test('shorthand constant', () {
      expect(themeExtensionTemplate, isA<ThemeExtensionTemplate>());
    });
  });

  group('ThemeExtensionImpl', () {
    test('default constructor', () {
      const annotation = ThemeExtensionImpl();

      expect(annotation.group, isNull);
    });

    test('custom group', () {
      const annotation = ThemeExtensionImpl(group: 'home');

      expect(annotation.group, 'home');
    });

    test('shorthand constant', () {
      expect(themeExtensionImpl, isA<ThemeExtensionImpl>());
      expect(themeExtensionImpl.group, isNull);
    });
  });
}
