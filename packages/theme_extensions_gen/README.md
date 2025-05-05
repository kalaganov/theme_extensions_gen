<!-- Logo -->

<img src="https://raw.githubusercontent.com/kalaganov/theme_extensions_gen/main/assets/logo_rounded.webp" width="200" alt="theme_extensions_gen logo"/>

# theme\_extensions\_gen

A modular, annotation-based code generation system for scalable theming in Flutter using <code>
ThemeExtension</code>.

[![Build Status](https://img.shields.io/badge/build-success-brightgreen)]()
[![codecov](https://codecov.io/gh/kalaganov/theme_extensions_gen/branch/main/graph/badge.svg?flag=theme_extensions_gen)](https://codecov.io/gh/kalaganov/theme_extensions_gen/tree/main/packages/theme_extensions_gen)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![Verified Publisher](https://img.shields.io/pub/publisher/theme_extensions_gen)](https://pub.dev/packages/theme_extensions_gen)
---------------------------------------------------------------------------------------------------------------------------------

## Features

* Declarative `@ThemeExtensionTemplate()` interface for theme structure
* `@ThemeExtensionImpl()` for centralized theme value lists
* Auto-generated:

    * `copyWith`, `lerp`, equality, and mixins
    * `BuildContext` extensions
    * Merged `ThemeExtension` lists for `ThemeData`
    * `debugFillProperties()` if `Diagnosticable` is used
* Group-based output (`light`, `dark`, etc.)
* Fully configurable via `build.yaml`

---

## Before / After

| Hand-written ThemeExtension                                                                                    | With @ThemeExtensionTemplate                                                                                     |
|----------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| ![Manual](https://raw.githubusercontent.com/kalaganov/theme_extensions_gen/refs/heads/main/assets/before.webp) | ![Generated](https://raw.githubusercontent.com/kalaganov/theme_extensions_gen/refs/heads/main/assets/after.webp) |

---

## Install

To use [theme_extensions_gen](https://pub.dev/packages/theme_extensions_gen), you will need your typical [build_runner](https://pub.dev/packages/build_runner) code generator setup.

First, install the annotations and the generator by adding
them to your project:

```bash
dart pub add theme_extensions_gen_annotations
dart pub add dev:theme_extensions_gen
dart pub add dev:build_runner
```

This adds:

* [theme_extensions_gen_annotations](https://pub.dev/packages/theme_extensions_gen_annotations), a package containing annotations for
  [theme_extensions_gen](https://pub.dev/packages/theme_extensions_gen)
* [theme_extensions_gen](https://pub.dev/packages/theme_extensions_gen), the code generator
* [build_runner](https://pub.dev/packages/build_runner), the tool to run code generators

## Run the generator

To run the code generator, execute the following command:
```bash
dart run build_runner watch
````
Like most code generators, [theme_extensions_gen](https://pub.dev/packages/theme_extensions_gen) requires importing the [theme_extensions_gen_annotations](https://pub.dev/packages/theme_extensions_gen_annotations) package and
including a part directive at the top of your file.

Thus, any file using [theme_extensions_gen](https://pub.dev/packages/theme_extensions_gen) should begin like this:
```dart
import 'package:theme_extensions_gen_annotations/theme_extensions_gen_annotations.dart';

part 'file_name.g.dart';
```

## Annotations

### `@ThemeExtensionTemplate()`

Marks an abstract interface as a `ThemeExtension` template. The generator creates:

* A concrete class with a factory constructor
* `copyWith`, `lerp`, `==`, `hashCode`
* `debugFillProperties()` if `Diagnosticable` is used in the mixins
* `BuildContext` extensions with accessors like `context.themedButtonTheme`

**Example:**

```dart
@ThemeExtensionTemplate()
abstract interface class ThemedButtonTheme extends ThemeExtension<ThemedButtonTheme>
    with _$ThemedButtonThemeMixin, Diagnosticable {
  const factory ThemedButtonTheme({
    required Decoration decoration,
    required TextStyle textStyle,
    required EdgeInsets padding,
  }) = _$ThemedButtonTheme;
}
```

---

### `@ThemeExtensionImpl({ String? group })`

Marks a `List<ThemeExtension>` as a named implementation group to be collected into a generated
file.

* Lists without `group` are merged into a default file.
* Lists with `group` are merged into a separate file (e.g. for `dark`, `light`, etc.).

```dart
@ThemeExtensionImpl()
List<ThemeExtension> get someFeatureThemeExtensions =>
    const [
      ThemedCardTheme(/* ... */),
      ThemedButtonTheme(/* ... */),
    ];

@ThemeExtensionImpl(group: 'dark')
List<ThemeExtension> get someFeatureThemeExtensions =>
    const [
      ThemedCardTheme(/* ... */),
      ThemedButtonTheme(/* ... */),
    ];
```

---

## Configuration (`build.yaml`)

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

      contextExtensionsGenerator:
        options:
          output_path: "lib/generated/theme_extensions/context_extensions.dart"
```

To **disable `contextExtensionsGenerator`**, use:

```yaml
builders:
  contextExtensionsGenerator:
    enabled: false
```

---

## Example Usage

```dart
final theme = Theme.of(context).extension<ThemedCardTheme>();
// or
final theme = context.themedCardTheme;
```

---

## Example Project

See the [
`example/`](https://github.com/kalaganov/theme_extensions_gen/tree/main/packages/theme_extensions_gen/example)
for:

* Shared ThemeExtension templates
* Light and dark theme implementations
* Runtime theme switching
* Organized resource files (`app_colors.dart`, `app_text_styles.dart`, etc.)

---

## Acknowledgements

Special thanks to  
**[Vladyslav Ulianytskyi](https://www.linkedin.com/in/vladyslav-ulianytskyi-41481335/)**  
for inspiration, technical discussions, and early feedback.

---

Happy theming!
