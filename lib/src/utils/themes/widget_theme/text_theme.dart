import 'package:flutter/material.dart';

class VATextTheme {
  static TextTheme lightTextTheme = TextTheme(
      // ignore: deprecated_member_use
      displayMedium: TextStyle(
        fontSize: 38,
        fontFamily: "Montserrat",
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: TextStyle(
        fontSize: 48,
        fontFamily: "Montserrat",
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      titleSmall:
          TextStyle(fontFamily: "Poppins", color: Colors.black54, fontSize: 28),
      titleMedium: TextStyle(
          fontFamily: "Poppins", color: Colors.black54, fontSize: 32));

  static TextTheme darkTextTheme = TextTheme(
      displayMedium: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 32,
          color: Colors.white70,
          fontWeight: FontWeight.bold),
      displayLarge: TextStyle(
        fontSize: 48,
        fontFamily: "Montserrat",
        color: Colors.white70,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
          fontFamily: "Montserrat", color: Colors.white60, fontSize: 28),
      titleMedium: TextStyle(
          fontFamily: "Poppins", color: Colors.white60, fontSize: 32));
}
