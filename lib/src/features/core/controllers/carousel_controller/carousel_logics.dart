import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class CarouselLogic extends GetxController {
  static CarouselLogic get instance => Get.find();
  final List<String> imgList = [
    VACarouselImage1,
    VACarouselImage2,
    VACarouselImage3,
    VACarouselImage4,
    VACarouselImage5,
    VACarouselImage6
  ];

  final List<String> siteNames = [
    VACarouselText1,
    VACarouselText2,
    VACarouselText3,
    VACarouselText4,
    VACarouselText5,
    VACarouselText6
  ];
  late final List<Widget> imageSliders;

  void onInit() {
    double screenWidth = MediaQuery.of(Get.context!).size.width;
    imageSliders = imgList
        .map((item) => Container(
              width: screenWidth,
              child: ClipRRect(
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: screenWidth,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ))
        .toList();
  }
}
