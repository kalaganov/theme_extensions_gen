import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/validators/theme_extension_impl_validator.dart';

import '../mock_elements/mock_elements.dart';

// ignore_for_file: lines_longer_than_80_chars

void main() {
  test('invalid element return type inner method', () {
    const validator = ThemeExtensionImplValidator();
    expect(
      () => validator.validateElementReturnType(_InvalidElement()),
      throwsA(
        predicate((e) => e is UnsupportedError),
      ),
    );
  });
}

class _InvalidElement extends MockElement {
  @override
  String get displayName => '';
}
