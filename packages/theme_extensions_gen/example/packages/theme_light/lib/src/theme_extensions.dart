import 'package:flutter/material.dart';
import 'package:templates/templates.dart';
import 'package:theme_extensions_gen_annotations/theme_extensions_gen_annotations.dart';
import 'package:theme_light/src/res/app_colors.dart';
import 'package:theme_light/src/res/app_heights.dart';
import 'package:theme_light/src/res/app_insets.dart';
import 'package:theme_light/src/res/app_radiuses.dart';
import 'package:theme_light/src/res/app_shadows.dart';
import 'package:theme_light/src/res/app_text_styles.dart';

@ThemeExtensionImpl()
List<ThemeExtension> get themeExtensionsLight => const [
      ThemedCardTheme(
        decoration: BoxDecoration(
          color: crystalWhite,
          borderRadius: cardBorderRadius,
          boxShadow: [softAmbientShadow],
        ),
        padding: cardPadding,
        titleStyle: largeSemiBoldDark,
        descriptionStyle: bodyRegularMuted,
        titleGapY: 12,
      ),
      ThemedButtonTheme(
        height: buttonHeight,
        textStyle: buttonMediumBoldLight,
        padding: buttonPadding,
        decoration: BoxDecoration(
          color: azureBlue,
          borderRadius: buttonBorderRadius,
        ),
      ),
      ThemedChipTheme(
        textStyle: chipSmallMediumPrimary,
        textStyleSelected: chipSmallMediumInverted,
        padding: chipPadding,
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: translucentAzure),
          ),
          borderRadius: chipBorderRadius,
        ),
        decorationSelected: BoxDecoration(
          color: azureBlue,
          border: Border.fromBorderSide(
            BorderSide(color: azureBlue),
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
