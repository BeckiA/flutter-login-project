import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AttractionScreen extends StatelessWidget {
  final int attractionIndex;
  final String attractionTitle;
  AttractionScreen(
      {required this.attractionIndex, required this.attractionTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$attractionTitle"),
      ),
      body: Center(child: Text("This Screen belongs to $attractionTitle")),
    );
  }
}
