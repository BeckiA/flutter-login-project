import 'package:flutter/material.dart';

class VATextTheme {
  static TextTheme lightTextTheme = const TextTheme(
      displayMedium: TextStyle(
          fontFamily: "Montserrat-Bold",
          color: Colors.white70,
          fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontFamily: "Montserrat", color: Colors.white60));
  static TextTheme darkTextTheme = const TextTheme(
      displayMedium: TextStyle(fontFamily: "Montserrat", color: Colors.black87),
      titleSmall: TextStyle(fontFamily: "Montserrat", color: Colors.black54));
}
