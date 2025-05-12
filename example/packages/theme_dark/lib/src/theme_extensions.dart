import 'package:flutter/material.dart';
import 'package:templates/templates.dart';
import 'package:theme_dark/src/res/app_colors.dart';
import 'package:theme_dark/src/res/app_heights.dart';
import 'package:theme_dark/src/res/app_insets.dart';
import 'package:theme_dark/src/res/app_radiuses.dart';
import 'package:theme_dark/src/res/app_shadows.dart';
import 'package:theme_dark/src/res/app_text_styles.dart';
import 'package:theme_extensions_gen_annotations/theme_extensions_gen_annotations.dart';

@ThemeExtensionImpl()
List<ThemeExtension> get themeExtensionsDark => const [
      ThemedCardTheme(
        decoration: BoxDecoration(
          color: voidBlack,
          borderRadius: cardBorderRadius,
          boxShadow: [glowNeonGreenSoftShadow],
        ),
        padding: cardPadding,
        titleStyle: largeSemiBoldNeon,
        descriptionStyle: bodyRegularCyan,
        titleGapY: 12,
      ),
      ThemedButtonTheme(
        height: buttonHeight,
        textStyle: buttonMediumBoldDark,
        padding: buttonPadding,
        decoration: BoxDecoration(
          color: brightMagenta,
          borderRadius: buttonBorderRadius,
          boxShadow: [glowCyanShadow],
        ),
      ),
      ThemedChipTheme(
        textStyle: chipSmallMediumCyan,
        textStyleSelected: chipSmallMediumInverted,
        padding: chipPadding,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.fromBorderSide(
            BorderSide(color: translucentCyan),
          ),
          borderRadius: chipBorderRadius,
        ),
        decorationSelected: BoxDecoration(
          color: neonCyan,
          border: Border.fromBorderSide(
            BorderSide(color: neonCyan),
          ),
          borderRadius: chipBorderRadius,
        ),
      ),
      ThemedTextTheme(
        title: headingLargeMedium,
        subtitle: headingMediumRegular,
        primaryText: bodySmallRegular,
        secondaryText: bodySmallMuted,
      ),
    ];
