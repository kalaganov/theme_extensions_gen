import 'dart:math';

import 'package:example/themed_widgets/themed_chip.dart';
import 'package:flutter/material.dart';

class ThemedChips extends StatelessWidget {
  const ThemedChips({super.key});

  static const _chipLabels = [
    'New',
    'Popular',
    'Trending',
    'Featured',
    'Recommended',
    'Sale',
    'Hot',
    'Exclusive',
    'Limited',
    'Best Seller',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (int i = 0; i < _chipLabels.length; i++)
          ThemedChip(
            isSelected: Random().nextBool(),
            text: _chipLabels[i],
          ),
      ],
    );
  }
}
