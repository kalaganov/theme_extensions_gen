# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A Dart code generation package (`theme_extensions_gen`) that generates Flutter `ThemeExtension` boilerplate from annotated template classes using `build_runner` and `source_gen`. Users annotate interfaces with `@ThemeExtensionTemplate` and implementation lists with `@ThemeExtensionImpl`, and the generators produce concrete classes, `BuildContext` extensions, and merged theme lists.

## Commands

```bash
# Install dependencies
flutter pub get

# Run all tests
dart test

# Run a single test file
dart test test/theme_extensions_generator_test.dart

# Static analysis (strict mode: strict-casts, strict-inference, strict-raw-types)
dart analyze

# Run tests with coverage
dart test --coverage=coverage
dart pub global run coverage:format_coverage \
  --lcov --in=coverage --out=coverage/lcov.info \
  --report-on=lib/src --packages=.dart_tool/package_config.json
```

## Architecture

### Build Pipeline (5 builders in `build.yaml`)

The generators run as `build_runner` builders in a multi-stage pipeline:

1. **`themeExtensionsGenerator`** (`SharedPartBuilder`) — reads `@ThemeExtensionTemplate` annotations, generates `.theme.g.part` files containing the mixin, abstract class, and concrete implementation (with `copyWith`, `lerp`, `==`/`hashCode`, `debugFillProperties`).

2. **`themeExtensionsTemplatesCollector`** — collects template class names into `.theme_templates.json` intermediate files.

3. **`themeExtensionsImplCollector`** — collects `@ThemeExtensionImpl` metadata into `.theme_impl.json` intermediate files.

4. **`contextExtensionsGenerator`** — reads `.theme_templates.json` files, generates a single `context_extensions.dart` with `BuildContext` extension getters for every template type.

5. **`themeExtensionsImplCombiner`** — reads `.theme_impl.json` files, generates merged `List<ThemeExtension>` getters (optionally grouped by theme variant like `dark`/`light`).

Builder entry points are in `lib/theme_extensions_gen.dart`. Builder configuration (outputs, options) is in `build.yaml`.

### Template System

All code generation uses a `Template` interface (`lib/src/templates/interface/template.dart`) with a single `void write(StringBuffer sb)` method. Templates compose hierarchically:

- **`ClassImplTemplate`** composes method templates: `ConstructorTemplate`, `FieldsTemplate`, `CopyWithTemplate`, `LerpTemplate`, `EqualsTemplate`, `HashCodeTemplate`, `DebugFillPropertiesTemplate`, `ToStringTemplate`
- **`MixinTemplate`** generates the interface mixin with unimplemented getters
- **`AbstractClassTemplate`** generates the factory wrapper
- Lerp has special-case templates for `double` and `Duration` types

### Models

`lib/src/models/` contains serializable data classes for passing metadata between build stages:
- `ConstructorParam`/`ConstructorParams` — parameter metadata extracted from annotated classes
- `CollectedImpl`/`CollectedImplList` — `@ThemeExtensionImpl` metadata (JSON-serializable for inter-builder communication)
- `CollectedTemplates` — template class names collected for context extension generation
- `options/` — builder configuration parsed from `build.yaml` options

### Testing

Tests use `build_test` package (`TestReaderWriter`, `testBuilder`) to run builders against input fixtures and compare with golden output files. Test assets are in `test/assets/`:
- `.template` — input Dart source
- `.part` — expected generated output (golden files)
- `.theme_impl.json` / `.templates.json` — expected intermediate metadata

## Code Style

- Dart SDK >=3.9.0, Flutter SDK required
- 80-character line limit enforced
- `public_member_api_docs` lint rule — all public API members need doc comments
- `prefer_single_quotes` — use single quotes for strings
- `avoid_dynamic_calls` and `cast_nullable_to_non_nullable` enabled
- CI runs on Flutter 3.38.7, targets `main` branch
