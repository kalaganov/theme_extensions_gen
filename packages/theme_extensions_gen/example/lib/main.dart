import 'package:example/application.dart';
import 'package:flutter/material.dart';

/// Entry point for the ThemeExtensions example app.
///
/// This app demonstrates:
/// - Runtime switching between light and dark themes
/// - Shared theme structure using `@ThemeExtensionTemplate`
/// - Typed theme values with `@ThemeExtensionImpl`
/// - Code-generated context accessors for each theme extension
///
/// 📁 Project structure:
/// - `example/packages/templates/` — ThemeExtension definitions
/// - `example/packages/theme_dark/` — Dark theme values
/// - `example/packages/theme_light/` — Light theme values
///
/// 🎥 Demo: https://raw.githubusercontent.com/kalaganov/theme_extensions_gen/main/assets/demo.gif
void main() {

  runApp(const Application());
}


