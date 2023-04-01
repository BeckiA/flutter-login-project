import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class VATextFormFieldTheme {
  VATextFormFieldTheme._();
  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: VASeconsdaryColor,
          floatingLabelStyle: TextStyle(color: VASeconsdaryColor),
          labelStyle: TextStyle(fontSize: 20),
          hintStyle: TextStyle(fontSize: 18),
          contentPadding: const EdgeInsets.symmetric(vertical: 2),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: VASeconsdaryColor)));
  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: VAPrimaryColor,
          labelStyle: TextStyle(fontSize: 20),
          hintStyle: TextStyle(fontSize: 18),
          contentPadding: const EdgeInsets.symmetric(vertical: 2),
          floatingLabelStyle: TextStyle(color: VAPrimaryColor),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: VAPrimaryColor)));
}
