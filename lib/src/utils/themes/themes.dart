import 'package:flutter/material.dart';
import 'package:login_app/src/utils/themes/widget_theme/elevated_button_theme.dart';
import 'package:login_app/src/utils/themes/widget_theme/icon_theme.dart';
import 'package:login_app/src/utils/themes/widget_theme/outlined_button_theme.dart';
import 'package:login_app/src/utils/themes/widget_theme/text_field_theme.dart';
import '/src/utils/themes/widget_theme/text_theme.dart';

class VAAppTheme {
  VAAppTheme._();
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: VATextTheme.lightTextTheme,
      elevatedButtonTheme: VAElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: VAOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: VATextFormFieldTheme.lightInputDecorationTheme,
      iconTheme: VAIconTheme.lightIconTheme);

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: VATextTheme.darkTextTheme,
      outlinedButtonTheme: VAOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: VAElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: VATextFormFieldTheme.darkInputDecorationTheme,
      iconTheme: VAIconTheme.darkIconTheme);
}
