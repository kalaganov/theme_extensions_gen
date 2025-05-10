import 'package:flutter/material.dart';
import 'package:templates/generated/theme_extensions/context_extensions.dart';

class ThemedButton extends StatelessWidget {
  const ThemedButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.themedButtonTheme;

    return Container(
      height: theme.height,
      decoration: theme.decoration,
      padding: theme.padding,
      child: Center(
        widthFactor: 1,
        child: Text('Themed Button', style: theme.textStyle, maxLines: 1),
      ),
    );
  }
}
