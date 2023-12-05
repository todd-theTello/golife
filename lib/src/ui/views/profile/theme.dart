import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../themes/themes.dart';
import '../../widgets/app_bars/app_bars.dart';

class ThemeSettingsView extends ConsumerWidget {
  const ThemeSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: ListTileTheme(
        data: ListTileThemeData(
          titleTextStyle: kHeading2(color: theme.colorScheme.onBackground),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: [
            RadioListTile.adaptive(
              value: ThemeMode.system,
              groupValue: themeMode,
              onChanged: (_) {
                ref.read(themeModeProvider.notifier).setSystemDefaults();
              },
              title: const Text('Use device settings'),
              subtitle: const Text("Sets the theme of the application based on your device's theme settings"),
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile.adaptive(
              value: ThemeMode.light,
              groupValue: themeMode,
              onChanged: (_) {
                ref.read(themeModeProvider.notifier).setLightMode();
              },
              title: const Text('Use light theme'),
              subtitle: const Text('The application will always use light theme'),
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile.adaptive(
              visualDensity: VisualDensity.comfortable,
              value: ThemeMode.dark,
              groupValue: themeMode,
              onChanged: (_) {
                ref.read(themeModeProvider.notifier).setDarkMode();
              },
              title: const Text('Use dark theme'),
              subtitle: const Text('The application will always use dark theme'),
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ],
        ),
      ),
    );
  }
}
