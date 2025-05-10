import 'package:example/theme_manager_scope.dart';
import 'package:flutter/material.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final manager = ThemeManagerScope.of(context);

    return Switch(
      value: manager.isLight,
      onChanged: (newState) => manager.toggle(),
    );
  }
}
