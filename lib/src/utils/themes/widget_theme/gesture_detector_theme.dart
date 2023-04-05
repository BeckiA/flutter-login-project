import 'package:flutter/material.dart';

class VAGestureDetectorTheme {
  VAGestureDetectorTheme._();

  static GestureDetector lightGestureDetectorTheme = GestureDetector(
      child: Container(
        
    decoration: BoxDecoration(color: Colors.grey.shade200),
  ));

  static BoxDecoration darkGestureDetectorTheme = BoxDecoration(
    color: Colors.black38,
  );
}
