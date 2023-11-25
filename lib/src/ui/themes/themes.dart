import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/database/shared_preference.dart';

part 'colors.dart';
part 'dark_theme.dart';
part 'light_theme.dart';
part 'text_styles.dart';

/// Define a state provider to define the hold the app theme mode
final themeModeProvider = StateNotifierProvider<ThemeModeStateNotifier, ThemeMode>(
  (ref) => ThemeModeStateNotifier(),
);

/// Theme mode notifier to use in riverpod provider
class ThemeModeStateNotifier extends StateNotifier<ThemeMode> {
  /// constructor to define default state
  ThemeModeStateNotifier() : super(ThemeMode.system) {
    switch (LocalPreference.themeMode) {
      case true:
        state = ThemeMode.light;
        break;
      case false:
        state = ThemeMode.dark;
        break;
      default:
        state = ThemeMode.system;
    }
  }

  /// Set dark theme in the app
  Future<void> setDarkMode() async {
    await LocalPreference.writeBoolToStorage(
      key: LocalPreference.KEY_THEME_MODE,
      value: false,
    );
    state = ThemeMode.dark;
  }

  /// Set light theme in the app
  Future<void> setLightMode() async {
    await LocalPreference.writeBoolToStorage(
      key: LocalPreference.KEY_THEME_MODE,
      value: true,
    );
    state = ThemeMode.light;
  }

  /// Set dark theme in the app
  Future<void> setSystemDefaults() async {
    await LocalPreference.removeValue(key: LocalPreference.KEY_THEME_MODE);
    state = ThemeMode.system;
  }
}
