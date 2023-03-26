import 'package:flutter/material.dart';
import 'package:login_app/src/utils/themes/widget_theme/text_theme.dart';

class VAAppTheme {
  VAAppTheme._();
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: VATextTheme.lightTextTheme,
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: ElevatedButton.styleFrom()));
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark, textTheme: VATextTheme.darkTextTheme);
}
