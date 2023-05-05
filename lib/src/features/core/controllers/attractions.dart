import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../constants/image_strings.dart';

class Attractions extends GetxController {
  static Attractions get instance => Get.find();

  final List<String> attractions = [
    "Historical Sites",
    "Religious Sites",
    "National Parks",
    "Water Bodies",
    "Historical Villages",
    "Museums",
    "Festivals",
    "Events",
  ];

  final List<String> gridImages = [
    VAGridImage1,
    VAGridImage2,
    VAGridImage3,
    VAGridImage4,
    VAGridImage5,
    VAGridImage6,
    VAGridImage7,
    VAGridImage8
  ];
}
