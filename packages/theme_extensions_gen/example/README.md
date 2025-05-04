# Dynamic ThemeExtensions Example

This example demonstrates a scalable approach to dynamic theming in Flutter  
using code-generated `ThemeExtension` classes via annotations.

It shows how to organize, separate, and apply different visual themes (like light and dark) in a modular way, using shared templates and cleanly structured resources.

---

## ✨ Demo

![theme demo](https://raw.githubusercontent.com/kalaganov/theme_extensions_gen/main/assets/demo.gif)

---

## 🎯 Goal

Provide a maintainable, flexible design system architecture using:

- `@ThemeExtensionTemplate` for defining common interfaces for theming
- `@ThemeExtensionImpl` for actual theme values (colors, text, layout)
- Full code-generation of boilerplate (`copyWith`, `lerp`, etc.)
- Runtime switching between themes with animation support

---

## 📦 Project Structure

```
example/
├── templates/            # ThemeExtension templates (interfaces only)
│   └── e.g. BrandedCardTheme, BrandedButtonTheme, ...
├── theme_light/          # Light theme implementation (colors, styles, etc.)
├── theme_dark/           # Dark theme implementation
├── main.dart             # Demo app showing theme switching
```

---

## 🧩 Key Concepts

### Templates

Templates define the structure of your themes.  
Each `@ThemeExtensionTemplate()` defines a typed interface for a specific UI element or style group:

```dart
@ThemeExtensionTemplate()
abstract interface class BrandedCardTheme
    extends ThemeExtension<BrandedCardTheme> {
  const factory BrandedCardTheme({
    required Decoration decoration,
    required EdgeInsets padding,
    required TextStyle titleStyle,
    required TextStyle descriptionStyle,
    required double titleGapY,
  }) = _$BrandedCardTheme;
}
```

These templates are **code-generated** into full-featured ThemeExtension classes.

---

### Implementations

Each theme (e.g. light or dark) uses `@ThemeExtensionImpl()` to provide concrete values for each template:

```dart
@ThemeExtensionImpl()
List<ThemeExtension> get themeExtensionsDark => const [
  BrandedCardTheme(
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
  // other extensions...
];
```

All visual values (colors, insets, text styles, etc.) are extracted into `src/res/` for better structure and reuse.

---

## 🧑‍💻 Using Theme Data in Widgets

You can access your ThemeExtensions directly using Flutter’s standard API:

```dart
final theme = Theme.of(context).extension<BrandedButtonTheme>();
```

Or, use the convenient generated extension on `BuildContext`:

```dart
final theme = context.brandedButtonTheme;
```

This gives you access to the full theme definition:

```dart
@override
Widget build(BuildContext context) {
  final theme = context.brandedButtonTheme;

  return Container(
    height: theme.height,
    decoration: theme.decoration,
    padding: theme.padding,
    child: Center(
      widthFactor: 1,
      child: Text('Branded Button', style: theme.textStyle, maxLines: 1),
    ),
  );
}
```

---

## 🛠 Setup

This project already includes generated code — no need to run `build_runner`.

Just open the example and explore how themes are structured and used.

---

## 📚 Resources

- [Use themes to share colors and font styles](https://docs.flutter.dev/cookbook/design/themes)
- [Design & theming overview](https://docs.flutter.dev/ui/design)
- [ThemeExtension class – Flutter API reference](https://api.flutter.dev/flutter/material/ThemeExtension-class.html)

---

Happy theming! 🚀
