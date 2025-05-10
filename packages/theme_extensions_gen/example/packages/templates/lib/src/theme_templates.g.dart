// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_templates.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

/// @nodoc
// ignore: unused_element
mixin _$ThemedCardThemeMixin {
  Decoration get decoration => throw UnimplementedError();

  EdgeInsets get padding => throw UnimplementedError();

  TextStyle get titleStyle => throw UnimplementedError();

  TextStyle get descriptionStyle => throw UnimplementedError();

  double get titleGapY => throw UnimplementedError();

  ThemeExtension<ThemedCardTheme> copyWith() => throw UnimplementedError();

  ThemeExtension<ThemedCardTheme> lerp(
    covariant ThemedCardTheme? other,
    double t,
  ) =>
      throw UnimplementedError();
}

/// @nodoc
abstract class _$ThemedCardTheme implements ThemedCardTheme {
  const factory _$ThemedCardTheme({
    required Decoration decoration,
    required EdgeInsets padding,
    required TextStyle titleStyle,
    required TextStyle descriptionStyle,
    required double titleGapY,
  }) = _$ThemedCardThemeImpl;
}

/// @nodoc
@immutable
class _$ThemedCardThemeImpl extends ThemeExtension<ThemedCardTheme>
    implements _$ThemedCardTheme {
  const _$ThemedCardThemeImpl({
    required this.decoration,
    required this.padding,
    required this.titleStyle,
    required this.descriptionStyle,
    required this.titleGapY,
  });

  @override
  final Decoration decoration;

  @override
  final EdgeInsets padding;

  @override
  final TextStyle titleStyle;

  @override
  final TextStyle descriptionStyle;

  @override
  final double titleGapY;

  @override
  Object get type => ThemedCardTheme;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is ThemedCardTheme &&
          decoration == other.decoration &&
          padding == other.padding &&
          titleStyle == other.titleStyle &&
          descriptionStyle == other.descriptionStyle &&
          titleGapY == other.titleGapY);

  @override
  int get hashCode =>
      decoration.hashCode ^
      padding.hashCode ^
      titleStyle.hashCode ^
      descriptionStyle.hashCode ^
      titleGapY.hashCode;

  @override
  ThemeExtension<ThemedCardTheme> copyWith({
    Decoration? decoration,
    EdgeInsets? padding,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    double? titleGapY,
  }) =>
      ThemedCardTheme(
        decoration: decoration ?? this.decoration,
        padding: padding ?? this.padding,
        titleStyle: titleStyle ?? this.titleStyle,
        descriptionStyle: descriptionStyle ?? this.descriptionStyle,
        titleGapY: titleGapY ?? this.titleGapY,
      );

  @override
  ThemeExtension<ThemedCardTheme> lerp(
    ThemeExtension<ThemedCardTheme>? other,
    double t,
  ) =>
      other is! ThemedCardTheme
          ? this
          : ThemedCardTheme(
              decoration: Decoration.lerp(
                decoration,
                other.decoration,
                t,
              )!,
              padding: EdgeInsets.lerp(
                padding,
                other.padding,
                t,
              )!,
              titleStyle: TextStyle.lerp(
                titleStyle,
                other.titleStyle,
                t,
              )!,
              descriptionStyle: TextStyle.lerp(
                descriptionStyle,
                other.descriptionStyle,
                t,
              )!,
              titleGapY: _lerpDouble(titleGapY, other.titleGapY, t),
            );

  double _lerpDouble(double a, double b, double t) =>
      a == b || (a.isNaN && b.isNaN) ? a : a * (1.0 - t) + b * t;

  @override
  String toString() => 'ThemedCardTheme('
      'decoration: $decoration, '
      'padding: $padding, '
      'titleStyle: $titleStyle, '
      'descriptionStyle: $descriptionStyle, '
      'titleGapY: $titleGapY'
      ')';
}

/// @nodoc
// ignore: unused_element
mixin _$ThemedButtonThemeMixin {
  double get height => throw UnimplementedError();

  TextStyle get textStyle => throw UnimplementedError();

  EdgeInsets get padding => throw UnimplementedError();

  Decoration get decoration => throw UnimplementedError();

  ThemeExtension<ThemedButtonTheme> copyWith() => throw UnimplementedError();

  ThemeExtension<ThemedButtonTheme> lerp(
    covariant ThemedButtonTheme? other,
    double t,
  ) =>
      throw UnimplementedError();
}

/// @nodoc
abstract class _$ThemedButtonTheme implements ThemedButtonTheme {
  const factory _$ThemedButtonTheme({
    required double height,
    required TextStyle textStyle,
    required EdgeInsets padding,
    required Decoration decoration,
  }) = _$ThemedButtonThemeImpl;
}

/// @nodoc
@immutable
class _$ThemedButtonThemeImpl extends ThemeExtension<ThemedButtonTheme>
    implements _$ThemedButtonTheme {
  const _$ThemedButtonThemeImpl({
    required this.height,
    required this.textStyle,
    required this.padding,
    required this.decoration,
  });

  @override
  final double height;

  @override
  final TextStyle textStyle;

  @override
  final EdgeInsets padding;

  @override
  final Decoration decoration;

  @override
  Object get type => ThemedButtonTheme;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is ThemedButtonTheme &&
          height == other.height &&
          textStyle == other.textStyle &&
          padding == other.padding &&
          decoration == other.decoration);

  @override
  int get hashCode =>
      height.hashCode ^
      textStyle.hashCode ^
      padding.hashCode ^
      decoration.hashCode;

  @override
  ThemeExtension<ThemedButtonTheme> copyWith({
    double? height,
    TextStyle? textStyle,
    EdgeInsets? padding,
    Decoration? decoration,
  }) =>
      ThemedButtonTheme(
        height: height ?? this.height,
        textStyle: textStyle ?? this.textStyle,
        padding: padding ?? this.padding,
        decoration: decoration ?? this.decoration,
      );

  @override
  ThemeExtension<ThemedButtonTheme> lerp(
    ThemeExtension<ThemedButtonTheme>? other,
    double t,
  ) =>
      other is! ThemedButtonTheme
          ? this
          : ThemedButtonTheme(
              height: _lerpDouble(height, other.height, t),
              textStyle: TextStyle.lerp(
                textStyle,
                other.textStyle,
                t,
              )!,
              padding: EdgeInsets.lerp(
                padding,
                other.padding,
                t,
              )!,
              decoration: Decoration.lerp(
                decoration,
                other.decoration,
                t,
              )!,
            );

  double _lerpDouble(double a, double b, double t) =>
      a == b || (a.isNaN && b.isNaN) ? a : a * (1.0 - t) + b * t;

  @override
  String toString() => 'ThemedButtonTheme('
      'height: $height, '
      'textStyle: $textStyle, '
      'padding: $padding, '
      'decoration: $decoration'
      ')';
}

/// @nodoc
// ignore: unused_element
mixin _$ThemedChipThemeMixin {
  TextStyle get textStyle => throw UnimplementedError();

  TextStyle get textStyleSelected => throw UnimplementedError();

  EdgeInsets get padding => throw UnimplementedError();

  Decoration get decoration => throw UnimplementedError();

  Decoration get decorationSelected => throw UnimplementedError();

  ThemeExtension<ThemedChipTheme> copyWith() => throw UnimplementedError();

  ThemeExtension<ThemedChipTheme> lerp(
    covariant ThemedChipTheme? other,
    double t,
  ) =>
      throw UnimplementedError();
}

/// @nodoc
abstract class _$ThemedChipTheme implements ThemedChipTheme {
  const factory _$ThemedChipTheme({
    required TextStyle textStyle,
    required TextStyle textStyleSelected,
    required EdgeInsets padding,
    required Decoration decoration,
    required Decoration decorationSelected,
  }) = _$ThemedChipThemeImpl;
}

/// @nodoc
@immutable
class _$ThemedChipThemeImpl extends ThemeExtension<ThemedChipTheme>
    implements _$ThemedChipTheme {
  const _$ThemedChipThemeImpl({
    required this.textStyle,
    required this.textStyleSelected,
    required this.padding,
    required this.decoration,
    required this.decorationSelected,
  });

  @override
  final TextStyle textStyle;

  @override
  final TextStyle textStyleSelected;

  @override
  final EdgeInsets padding;

  @override
  final Decoration decoration;

  @override
  final Decoration decorationSelected;

  @override
  Object get type => ThemedChipTheme;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is ThemedChipTheme &&
          textStyle == other.textStyle &&
          textStyleSelected == other.textStyleSelected &&
          padding == other.padding &&
          decoration == other.decoration &&
          decorationSelected == other.decorationSelected);

  @override
  int get hashCode =>
      textStyle.hashCode ^
      textStyleSelected.hashCode ^
      padding.hashCode ^
      decoration.hashCode ^
      decorationSelected.hashCode;

  @override
  ThemeExtension<ThemedChipTheme> copyWith({
    TextStyle? textStyle,
    TextStyle? textStyleSelected,
    EdgeInsets? padding,
    Decoration? decoration,
    Decoration? decorationSelected,
  }) =>
      ThemedChipTheme(
        textStyle: textStyle ?? this.textStyle,
        textStyleSelected: textStyleSelected ?? this.textStyleSelected,
        padding: padding ?? this.padding,
        decoration: decoration ?? this.decoration,
        decorationSelected: decorationSelected ?? this.decorationSelected,
      );

  @override
  ThemeExtension<ThemedChipTheme> lerp(
    ThemeExtension<ThemedChipTheme>? other,
    double t,
  ) =>
      other is! ThemedChipTheme
          ? this
          : ThemedChipTheme(
              textStyle: TextStyle.lerp(
                textStyle,
                other.textStyle,
                t,
              )!,
              textStyleSelected: TextStyle.lerp(
                textStyleSelected,
                other.textStyleSelected,
                t,
              )!,
              padding: EdgeInsets.lerp(
                padding,
                other.padding,
                t,
              )!,
              decoration: Decoration.lerp(
                decoration,
                other.decoration,
                t,
              )!,
              decorationSelected: Decoration.lerp(
                decorationSelected,
                other.decorationSelected,
                t,
              )!,
            );

  @override
  String toString() => 'ThemedChipTheme('
      'textStyle: $textStyle, '
      'textStyleSelected: $textStyleSelected, '
      'padding: $padding, '
      'decoration: $decoration, '
      'decorationSelected: $decorationSelected'
      ')';
}

/// @nodoc
// ignore: unused_element
mixin _$ThemedTextThemeMixin {
  TextStyle get title => throw UnimplementedError();

  TextStyle get subtitle => throw UnimplementedError();

  TextStyle get primaryText => throw UnimplementedError();

  TextStyle get secondaryText => throw UnimplementedError();

  ThemeExtension<ThemedTextTheme> copyWith() => throw UnimplementedError();

  ThemeExtension<ThemedTextTheme> lerp(
    covariant ThemedTextTheme? other,
    double t,
  ) =>
      throw UnimplementedError();
}

/// @nodoc
abstract class _$ThemedTextTheme implements ThemedTextTheme {
  const factory _$ThemedTextTheme({
    required TextStyle title,
    required TextStyle subtitle,
    required TextStyle primaryText,
    required TextStyle secondaryText,
  }) = _$ThemedTextThemeImpl;
}

/// @nodoc
@immutable
class _$ThemedTextThemeImpl extends ThemeExtension<ThemedTextTheme>
    implements _$ThemedTextTheme {
  const _$ThemedTextThemeImpl({
    required this.title,
    required this.subtitle,
    required this.primaryText,
    required this.secondaryText,
  });

  @override
  final TextStyle title;

  @override
  final TextStyle subtitle;

  @override
  final TextStyle primaryText;

  @override
  final TextStyle secondaryText;

  @override
  Object get type => ThemedTextTheme;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is ThemedTextTheme &&
          title == other.title &&
          subtitle == other.subtitle &&
          primaryText == other.primaryText &&
          secondaryText == other.secondaryText);

  @override
  int get hashCode =>
      title.hashCode ^
      subtitle.hashCode ^
      primaryText.hashCode ^
      secondaryText.hashCode;

  @override
  ThemeExtension<ThemedTextTheme> copyWith({
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? primaryText,
    TextStyle? secondaryText,
  }) =>
      ThemedTextTheme(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        primaryText: primaryText ?? this.primaryText,
        secondaryText: secondaryText ?? this.secondaryText,
      );

  @override
  ThemeExtension<ThemedTextTheme> lerp(
    ThemeExtension<ThemedTextTheme>? other,
    double t,
  ) =>
      other is! ThemedTextTheme
          ? this
          : ThemedTextTheme(
              title: TextStyle.lerp(
                title,
                other.title,
                t,
              )!,
              subtitle: TextStyle.lerp(
                subtitle,
                other.subtitle,
                t,
              )!,
              primaryText: TextStyle.lerp(
                primaryText,
                other.primaryText,
                t,
              )!,
              secondaryText: TextStyle.lerp(
                secondaryText,
                other.secondaryText,
                t,
              )!,
            );

  @override
  String toString() => 'ThemedTextTheme('
      'title: $title, '
      'subtitle: $subtitle, '
      'primaryText: $primaryText, '
      'secondaryText: $secondaryText'
      ')';
}
