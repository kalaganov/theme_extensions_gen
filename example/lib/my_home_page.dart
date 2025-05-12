import 'package:example/theme_switcher.dart';
import 'package:example/themed_widgets/themed_button.dart';
import 'package:example/themed_widgets/themed_card.dart';
import 'package:example/themed_widgets/themed_chips.dart';
import 'package:flutter/material.dart';
import 'package:templates/generated/theme_extensions/context_extensions.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.themedTextTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Extensions Example'),
        centerTitle: true,
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              const Center(child: ThemedButton()),
              const ThemedCard(),
              Text('Title', style: textTheme.title),
              Text('Subtitle', style: textTheme.subtitle),
              Text('Primary text', style: textTheme.primaryText),
              Text('Secondary text', style: textTheme.secondaryText),
              const ThemedChips(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Center(child: ThemeSwitcher()),
      ),
    );
  }
}
