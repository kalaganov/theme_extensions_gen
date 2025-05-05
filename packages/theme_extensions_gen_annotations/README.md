# theme_extensions_gen_annotations

This package defines annotations used with `theme_extensions_gen` to generate strongly-typed `ThemeExtension` classes and tooling for Flutter theming.

---

## 🎯 Purpose

Use these annotations to eliminate boilerplate in theme creation. Combined with `build_runner` and `theme_extensions_gen`, this package enables:

- Declarative theme structure via `@ThemeExtensionTemplate`
- Centralized and typed theme values via `@ThemeExtensionImpl`
- Optional build-time generation of `BuildContext` extensions

---

## 🔖 Annotations

### `@ThemeExtensionTemplate()`

Marks an abstract interface as a template for a `ThemeExtension`. The generator creates:

- `copyWith`, `lerp`, `==`, `hashCode`, and `runtimeType`
- `debugFillProperties` if the interface uses `Diagnosticable`
- A concrete class with a factory constructor and mixin
- A `BuildContext` extension with getters for all extensions

**Example:**

```dart
@ThemeExtensionTemplate()
abstract interface class ThemedButtonTheme
    extends ThemeExtension<ThemedButtonTheme>
    with _$ThemedButtonThemeMixin, Diagnosticable {
  const factory ThemedButtonTheme({
    required Decoration decoration,
    required TextStyle textStyle,
    required EdgeInsets padding,
  }) = _$ThemedButtonTheme;
}
```

By default, the generator creates `generated/theme_extensions/context_extensions.dart`.  
This can be customized or disabled via `build.yaml`:

```yaml
targets:
  $default:
    builders:
      contextExtensionsGenerator:
        enabled: false
```

Or with a custom path:

```yaml
      contextExtensionsGenerator:
        options:
          output_path: "lib/custom/context_extensions.dart"
```

---

### `@ThemeExtensionImpl({ String? group })`

Marks a list of theme implementations to be combined into a generated list.  
Used like this:

```dart
@ThemeExtensionImpl()
List<ThemeExtension> get someFeatureThemeExtensions => const [
  ThemedCardTheme(
    // 
  ),
  ThemedButtonTheme(/*...*/),
];

@ThemeExtensionImpl(group: 'dark')
List<ThemeExtension> get someFeatureThemeExtensions => const [
  ThemedCardTheme(/*...*/),
  ThemedButtonTheme(/*...*/),
];
```

The generator then combines all matching lists into:

- A default file:
  ```dart
  List<ThemeExtension> get themeExtensions => [
    ...someFeatureThemeExtensions,
    ...someAnotherFeatureThemeExtensions,
  ];
  ```

- A group-specific file (e.g. for `"dark"`):
  ```dart
  List<ThemeExtension> get themeExtensionsDark => [
    ...someFeatureThemeExtensions,
  ];
  ```

Configuration in `build.yaml`:

```yaml
targets:
  $default:
    builders:
      themeExtensionsImplCombiner:
        options:
          default_output:
            path: "lib/generated/theme_extensions/theme_extensions.dart"
            list_name: "themeExtensions"
          groups:
            dark:
              path: "lib/generated/theme_extensions/theme_extensions_dark.dart"
              list_name: "themeExtensionsDark"
```
