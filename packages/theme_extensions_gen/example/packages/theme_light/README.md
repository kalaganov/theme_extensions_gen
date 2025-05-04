# theme_light

`theme_light` is a set of brand-specific `ThemeExtension` implementations for the **light theme** of a Flutter application.  
It is designed to be used in conjunction with the [`theme_dark`](../theme_dark) package, enabling a clean and scalable approach to multi-theme support.

---

## ✨ Features

- Modular and scalable `ThemeExtension` setup
- Organized design tokens for:
    - Colors
    - Text styles
    - Insets
    - Radii
    - Shadows
    - Heights
- Clean separation of theme logic from widgets
- Pairs with `theme_dark` for a complete theming system

---

## 📦 What's inside

- `themeExtensionsLight` — a list of preconfigured `ThemeExtension` instances
- Resources under `src/res/`:
    - `app_colors.dart`
    - `app_text_styles.dart`
    - `app_insets.dart`
    - `app_radiuses.dart`
    - `app_shadows.dart`
    - `app_heights.dart`

---

## 🛠 Usage

Apply the theme:

```
final theme = ThemeData(
  extensions: themeExtensionsLight,
);
```

Access values from extensions:

```
final buttonTheme = context.brandedButtonTheme;

return Container(
  height: buttonTheme.height,
  padding: buttonTheme.padding,
  decoration: buttonTheme.decoration,
  child: Text('Light Button', style: buttonTheme.textStyle),
);
```

You can also use the standard Flutter API:

```
final cardTheme = Theme.of(context).extension<BrandedCardTheme>();
```

---

## 🔗 Related Packages

- [theme_dark](../theme_dark)
- [templates](../templates)
