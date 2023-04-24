import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class VAIntlPhoneFieldTheme {
  VAIntlPhoneFieldTheme._();
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      prefixIconColor: VASeconsdaryColor,
      floatingLabelStyle: TextStyle(color: VASeconsdaryColor),
      labelStyle: TextStyle(fontSize: 20, color: VASeconsdaryColor),
      hintStyle: TextStyle(fontSize: 18, color: VASeconsdaryColor),
      contentPadding: const EdgeInsets.symmetric(vertical: 2),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(width: 2, color: VASeconsdaryColor)));
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      prefixIconColor: VAPrimaryColor,
      labelStyle: TextStyle(fontSize: 20),
      hintStyle: TextStyle(fontSize: 18),
      contentPadding: const EdgeInsets.symmetric(vertical: 2),
      floatingLabelStyle: TextStyle(color: VAPrimaryColor),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(width: 2, color: VAPrimaryColor)));
}
