import 'package:flutter/material.dart';
import 'package:templates/generated/theme_extensions/context_extensions.dart';

class ThemedChip extends StatelessWidget {
  const ThemedChip({
    required this.isSelected,
    required this.text,
    super.key,
  });

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = context.themedChipTheme;

    return Container(
      decoration: isSelected ? theme.decorationSelected : theme.decoration,
      padding: theme.padding,
      child: Text(
        text,
        style: isSelected ? theme.textStyleSelected : theme.textStyle,
      ),
    );
  }
}
