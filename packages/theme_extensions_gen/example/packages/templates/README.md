# templates

This package defines shared `ThemeExtension` templates for Flutter apps.

These templates act as **typed interfaces** for theming, allowing each visual 
theme (light, dark, or branded) to implement consistent structure and styling.

---

## 🎯 Purpose

This package is intended to be imported by all theme variants 
(e.g. `theme_light`, `theme_dark`), to:

- Share a common structure for theme extensions
- Generate `ThemeExtension` subclasses via `@ThemeExtensionTemplate`
- Avoid duplication and ensure type safety across themes

---

## 📄 Example Template

```text
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

This will generate a full-featured ThemeExtension class:
- `copyWith`
- `lerp`
- equality
- default implementation

---

## 🧩 Use in Implementations

Once defined in `templates`, each theme package (e.g. `theme_dark`) can implement 
its values using `@ThemeExtensionImpl()`:

```text
@ThemeExtensionImpl()
List<ThemeExtension> get themeExtensionsDark => const [
  BrandedCardTheme(
    decoration: ...,
    padding: ...,
    ...
  ),
];
```
