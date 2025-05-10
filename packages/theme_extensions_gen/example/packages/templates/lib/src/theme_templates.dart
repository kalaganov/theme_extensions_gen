import 'package:flutter/material.dart';
import 'package:theme_extensions_gen_annotations/theme_extensions_gen_annotations.dart';

part 'theme_templates.g.dart';

@ThemeExtensionTemplate()
abstract interface class ThemedCardTheme extends ThemeExtension<ThemedCardTheme>
    with _$ThemedCardThemeMixin {
  const factory ThemedCardTheme({
    required Decoration decoration,
    required EdgeInsets padding,
    required TextStyle titleStyle,
    required TextStyle descriptionStyle,
    required double titleGapY,
  }) = _$ThemedCardTheme;
}

@ThemeExtensionTemplate()
abstract interface class ThemedButtonTheme
    extends ThemeExtension<ThemedButtonTheme> with _$ThemedButtonThemeMixin {
  const factory ThemedButtonTheme({
    required double height,
    required TextStyle textStyle,
    required EdgeInsets padding,
    required Decoration decoration,
  }) = _$ThemedButtonTheme;
}

@ThemeExtensionTemplate()
abstract interface class ThemedChipTheme extends ThemeExtension<ThemedChipTheme>
    with _$ThemedChipThemeMixin {
  const factory ThemedChipTheme({
    required TextStyle textStyle,
    required TextStyle textStyleSelected,
    required EdgeInsets padding,
    required Decoration decoration,
    required Decoration decorationSelected,
  }) = _$ThemedChipTheme;
}

@ThemeExtensionTemplate()
abstract interface class ThemedTextTheme extends ThemeExtension<ThemedTextTheme>
    with _$ThemedTextThemeMixin {
  const factory ThemedTextTheme({
    required TextStyle title,
    required TextStyle subtitle,
    required TextStyle primaryText,
    required TextStyle secondaryText,
  }) = _$ThemedTextTheme;
}
