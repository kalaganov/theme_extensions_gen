import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/validators/theme_extension_template_validator.dart';

import '../mock_elements/mock_elements.dart';
//ignore_for_file: deprecated_member_use

void main() {
  group('TemplateValidator inner methods', () {
    test('validateAnnotation', () async {
      final element = MockElement();
      final validator = ThemeExtensionTemplateValidator(
        await _createConstantReader(),
        element,
        '',
      );

      expect(
        validator.validateAnnotation,
        throwsA(
          predicate(
            (e) =>
                e is InvalidGenerationSource &&
                e.message.contains('can only be used on classes.'),
          ),
        ),
      );
    });

    test('validateInheritance direct super == null', () async {
      final element = MockClassElement();
      final validator = ThemeExtensionTemplateValidator(
        await _createConstantReader(),
        element,
        '',
      );

      expect(
        validator.validateInheritance,
        throwsA(
          predicate(
            (e) =>
                e is InvalidGenerationSource &&
                e.message.contains(' must directly extend '),
          ),
        ),
      );
    });
  });
}

Future<ConstantReader> _createConstantReader() async {
  final lib = await resolveSources({
    'a|lib/test_lib.dart': '''
        
        @ThemeExtensionTemplate()
        class TestClass {}

        class ThemeExtensionTemplate { const ThemeExtensionTemplate(); }
      '''
  }, (resolver) async {
    final lib = await resolver.libraryFor(
      AssetId('a', 'lib/test_lib.dart'),
    );
    return lib;
  });

  final clazz = lib.topLevelElements
      .whereType<ClassElement>()
      .firstWhere((e) => e.name == 'TestClass');

  final annotation = clazz.metadata.first.computeConstantValue()!;
  return ConstantReader(annotation);
}
