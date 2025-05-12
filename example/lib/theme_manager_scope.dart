import 'package:example/theme_manager.dart';
import 'package:flutter/material.dart';

class ThemeManagerScope extends InheritedNotifier<ThemeManager> {
  const ThemeManagerScope({
    required super.notifier,
    required super.child,
    super.key,
  });

  static ThemeManager of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<ThemeManagerScope>()!
      .notifier!;
}
