import 'package:flutter/material.dart';

class VATextTheme {
  static TextTheme lightTextTheme = TextTheme(
      // ignore: deprecated_member_use
      displayMedium: TextStyle(
        fontSize: 32,
        fontFamily: "Montserrat",
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
          fontFamily: "Montserrat", color: Colors.black54, fontSize: 28));

  static TextTheme darkTextTheme = TextTheme(
      displayMedium: TextStyle(
          fontFamily: "Montserrat",
          color: Colors.white70,
          fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
          fontFamily: "Montserrat", color: Colors.white60, fontSize: 28));
}
