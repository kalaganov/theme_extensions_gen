import 'package:example/theme_manager_scope.dart';
import 'package:flutter/material.dart';

typedef ThemedAppBuilder = Widget Function(
  BuildContext context,
  ThemeData theme,
);

class ThemedApp extends StatelessWidget {
  const ThemedApp({
    required this.builder,
    super.key,
  });

  final ThemedAppBuilder builder;

  @override
  Widget build(BuildContext context) {
    final manager = ThemeManagerScope.of(context);

    return builder(
      context,
      _createThemeData(manager.isLight, manager.extensions),
    );
  }

  ThemeData _createThemeData(
    bool isLight,
    List<ThemeExtension> extensions,
  ) =>
      ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: isLight ? Brightness.light : Brightness.dark,
          seedColor: Colors.indigo,
        ),
        extensions: extensions,
        splashFactory: NoSplash.splashFactory,
      );
}
