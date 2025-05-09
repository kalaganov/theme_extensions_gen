import 'package:flutter/material.dart';
import 'package:templates/generated/theme_extensions/context_extensions.dart';

class ThemedCard extends StatelessWidget {
  const ThemedCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.themedCardTheme;

    return Container(
      decoration: theme.decoration,
      padding: theme.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Card Title',
            style: theme.titleStyle,
            maxLines: 1,
          ),
          SizedBox(height: theme.titleGapY),
          Text(
            _cardDescription,
            style: theme.descriptionStyle,
          ),
        ],
      ),
    );
  }
}

const _cardDescription = 'Discover new destinations with our travel guide. '
    'Explore hidden gems, top-rated attractions, and local favorites to make '
    'every trip unforgettable. Plan your journey with expert tips and '
    'recommendations tailored for you. From city escapes to nature retreats, '
    'find the perfect spot for any mood.';
