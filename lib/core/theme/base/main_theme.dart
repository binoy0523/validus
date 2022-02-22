import 'package:flutter/material.dart';
import 'package:validus_coin/core/theme/base/default_theme.dart';

/// Theme base class containing all data around how the app should display components.
abstract class MainTheme {
  /// Constructs a new MainTheme object.
  const MainTheme();

  /// App light theme.
  ThemeData get lightTheme => defaultThemeData();

  /// App dark theme.
  ThemeData get darkTheme => defaultThemeData();

}