import 'package:flutter/material.dart';
import 'package:login_app/src/constants/colors.dart';

class VAIconTheme {
  VAIconTheme._();

  /**-- Light Theme */
  static final lightIconTheme = IconThemeData(
    color: VAAccentColor,
    size: 25.0,
  );

  /**-- Dark Theme */
  static final darkIconTheme = IconThemeData(
    color: VAPrimaryColor,
    size: 25.0,
  );
}
