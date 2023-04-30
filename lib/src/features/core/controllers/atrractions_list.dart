import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/image_strings.dart';
import 'attraction.dart';

class AttractionList extends GetxController {
  static AttractionList get instance => Get.find();

  final List<List<Attraction>> _attractionList = [
    [
      Attraction(
        id: "1",
        title: "Castle of Gonder",
        location: "Gondar",
        picture: VACarouselImage2,
      ),
      Attraction(
        id: "1",
        title: "vhffgejr",
        location: "nbjbjnb",
        picture: VACarouselImage2,
      ),
      Attraction(
        id: "1",
        title: "cscss",
        location: "sdsdsdsd",
        picture: VACarouselImage2,
      ),
    ],
    [
      Attraction(
        id: "2",
        title: "Rock-hewn churches of Lalibela",
        location: "Lalibela",
        picture: VACarouselImage1,
      ),
      Attraction(
        id: "2",
        title: "Rock-hewn churches of Lalibela",
        location: "Lalibela",
        picture: VACarouselImage1,
      ),
      Attraction(
        id: "2",
        title: "Rock-hewn churches of Lalibela",
        location: "Lalibela",
        picture: VACarouselImage1,
      ),
    ],
  ];

  List<Attraction> getAttractionIndex(int index) {
    switch (index) {
      case 0:
        return [..._attractionList[index]];
      case 1:
        return [..._attractionList[index]];
      default:
        return [];
    }
  }

  List<List<Attraction>> get attractionItems {
    return [
      ..._attractionList.map((attractions) => [...attractions])
    ];
  }
}
