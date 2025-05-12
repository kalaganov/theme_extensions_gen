import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/exceptions/theme_impl_validation_exception.dart';
import 'package:theme_extensions_gen/src/validators/theme_extension_impl_validator.dart';

import '../mock_elements/mock_elements.dart';

// ignore_for_file: lines_longer_than_80_chars

void main() {
  test('invalid element type inner method', () {
    const validator = ThemeExtensionImplValidator();
    expect(
      () => validator.validateElementKind(_InvalidElement()),
      throwsA(
        predicate(
          (e) =>
              e is ThemeImplValidationException &&
              e.message.contains(
                'Element must be a top-level variable, function, or getter.',
              ),
        ),
      ),
    );
  });
}

class _InvalidElement extends MockElement {
  @override
  String get displayName => '';
}
