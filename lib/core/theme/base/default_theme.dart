import 'package:flutter/material.dart';
/// ColorScheme used in the app.
ColorScheme defaultColorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0XFFFFC700),
  onPrimary: Color(0XFF000000),
  secondary: Color(0XFFFFB802),
  onSecondary: Color(0XFF000000),
  background: Color(0XFF171734),
  onBackground: Color(0XFFFFFFFF),
  error: Colors.red,
  onError: Color(0XFFFFFFFF),
  surface: Color(0XFF1E1E3D),
  onSurface: Color(0XFFD2D2D2),
  primaryContainer: Color(0XFF1E1E3D),
  secondaryContainer: Color(0XFF2F3444),
  onSurfaceVariant: Color(0XFFA1A1A1),
  
);

/// The default theme data for the whole application
/// More info [here](https://api.flutter.dev/flutter/material/ThemeData-class.html)
ThemeData defaultThemeData({Brightness brightness = Brightness.dark}) {
  final ColorScheme colorScheme = defaultColorScheme.copyWith(brightness: brightness);
  return ThemeData(
    backgroundColor: colorScheme.background,
    brightness: brightness,
    cardColor: colorScheme.surface,
    canvasColor: const Color(0xFF57576b),
    colorScheme: colorScheme,
    primaryColor: colorScheme.primary,
    primaryColorLight:
        colorScheme.primary.withBlue(colorScheme.primary.blue + 20).withRed(colorScheme.primary.red + 20),
    primaryColorDark: colorScheme.primaryContainer,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: colorScheme.secondary.withAlpha(150),
    ),
    selectedRowColor: colorScheme.secondary,
    disabledColor: Color(0XFFA2A2AE),
    highlightColor: colorScheme.primary,
    focusColor: colorScheme.secondary,
    hintColor: colorScheme.secondary,
    indicatorColor: colorScheme.primary,
    
  );
}
