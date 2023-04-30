import 'package:flutter/material.dart';

import '../../controllers/attraction.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttractionScreen extends StatelessWidget {
  final String attractionTitle;
  final List<Attraction> attractions;

  const AttractionScreen({
    Key? key,
    required this.attractionTitle,
    required this.attractions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(attractionTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: attractions.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Attraction(
                  id: attractions[index].id,
                  title: attractions[index].title,
                  location: attractions[index].location,
                  picture: attractions[index].picture,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
