import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/core/database/shared_preference.dart';
import 'src/core/routes/routes.dart';
import 'src/ui/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalPreference.init();
  runApp(const ProviderScope(
    child: AppRootWrapper(),
  ));
}

/// Entry widget of the  app
class AppRootWrapper extends ConsumerWidget {
  ///
  const AppRootWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// watch the theme mode provider for changes to theme
    final theme = ref.watch(themeModeProvider);

    /// creates router config
    final route = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: route,
      themeMode: theme,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
