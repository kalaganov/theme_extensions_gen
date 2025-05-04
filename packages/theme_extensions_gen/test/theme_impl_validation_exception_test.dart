import 'package:analyzer/dart/element/element.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/exceptions/theme_impl_validation_exception.dart';

//ignore_for_file: deprecated_member_use

void main() {
  group('ThemeImplValidationException', () {
    test('stores and exposes the message', () {
      const e = ThemeImplValidationException('bad input');
      expect(e.message, equals('bad input'));
    });

    test('has correct toString output', () {
      const e = ThemeImplValidationException('invalid data');
      expect(e.toString(), 'ThemeImplValidationException: invalid data');
    });

    test('toString includes element details if not null', () {
      final exception = ThemeImplValidationException('error', FakeElement());
      final str = exception.toString();

      expect(str, contains('ThemeImplValidationException: error'));
      expect(str, contains('Element: FakeElement'));
      expect(str, contains('Kind:'));
    });

    test('is instance of Error', () {
      const e = ThemeImplValidationException('oops');
      expect(e, isA<ThemeImplValidationException>());
    });
  });
}

class FakeElement implements Element {
  @override
  String get displayName => 'FakeElement';

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
