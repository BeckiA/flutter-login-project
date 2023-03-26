import 'package:flutter/material.dart';
import '/src/utils/themes/widget_theme/text_theme.dart';

class VAAppTheme {
  VAAppTheme._();
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: const MaterialColor(0xFFE5B80B, <int, Color>{
        50: Color(0xFCF8E7),
        100: Color(0xFAF1CE),
        200: Color(0xF7EAB6),
        300: Color(0xF5E39D),
        400: Color(0xF2DC85),
        500: Color(0xEFD46D),
        600: Color(0xE5B80B),
        700: Color(0xEDCD54),
        800: Color(0xEAC63C),
      }),
      textTheme: VATextTheme.lightTextTheme,
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: ElevatedButton.styleFrom()));
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark, textTheme: VATextTheme.darkTextTheme);
}
