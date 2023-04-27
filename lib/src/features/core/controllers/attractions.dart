import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Attractions extends GetxController {
  static Attractions get instance => Get.find();

  final attractions = [
    "Historical Sites",
    "Religious Sites",
    "National Parks",
    "Water Bodies",
    "Historical Villages",
    "Museums",
    "Festivals",
    "Events",
  ];

  final gridImages = [];
}
