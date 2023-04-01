import 'package:flutter/material.dart';
import 'package:login_app/src/constants/sizes.dart';

import '../../../constants/colors.dart';

class VAElevatedButtonTheme {
  VAElevatedButtonTheme._();

  /**-- Light Theme */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: VAWhiteColor,
          backgroundColor: VASeconsdaryColor,
          side: const BorderSide(color: VASeconsdaryColor),
          padding: const EdgeInsets.symmetric(vertical: VAButtonHeight),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0))));

  /**-- Dark Theme */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: VASeconsdaryColor,
          backgroundColor: VAWhiteColor,
          side: const BorderSide(color: VAWhiteColor),
          padding: const EdgeInsets.symmetric(vertical: VAButtonHeight),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0))));
}
