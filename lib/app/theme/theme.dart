import 'package:flutter/material.dart';

/// Material 3 theme from the brand seed color (mobile plan section 11).
/// [seed] defaults to `assets/app_config.json` brand tokens; an instance's
/// discovery `branding.primary_color` may tint it further.
ThemeData buildTheme({required Color seed, required Brightness brightness}) {
  final scheme = ColorScheme.fromSeed(seedColor: seed, brightness: brightness);
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    visualDensity: VisualDensity.standard,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
    ),
  );
}
