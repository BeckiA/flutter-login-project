import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class VAOutlinedButtonTheme {
  VAOutlinedButtonTheme._();
  /**-- Light Theme */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: VASeconsdaryColor,
          backgroundColor: VAWhiteColor,
          side: const BorderSide(color: VASeconsdaryColor),
          padding: const EdgeInsets.symmetric(vertical: VAButtonHeight),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0))));

  /**-- Light Theme */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: VAWhiteColor,
          backgroundColor: VASeconsdaryColor,
          side: const BorderSide(color: VAWhiteColor),
          padding: const EdgeInsets.symmetric(vertical: VAButtonHeight),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0))));
}
