import 'package:example/my_home_page.dart';
import 'package:example/theme_manager.dart';
import 'package:example/theme_manager_scope.dart';
import 'package:example/themed_widgets/themed_app.dart';
import 'package:flutter/material.dart';
import 'package:theme_dark/generated/theme_extensions.dart';
import 'package:theme_light/generated/theme_extensions.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeManagerScope(
      notifier: ThemeManager(themeExtensionsLight, themeExtensionsDark),
      child: ThemedApp(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Theme Extensions Example',
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}
