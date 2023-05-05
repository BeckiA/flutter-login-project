import 'package:get/get.dart';

class AttractionDetailController extends GetxController {
  static AttractionDetailController get instance => Get.find();
  List<String> titles = [
    "Travel Guide",
    "Nearby Hotels",
    "Nearby Restaurants",
    "Comments",
    "Nearby Shop",
    "Weather Forecast"
  ];

  List<String> routes = [
    "travel-guide-screen",
    "nearby-hotel-screen",
    "nearby-restaurant-screen",
    "/comment-screen",
    "/nearby-shops-screen",
    "/weather-forecast-screen"
  ];
}
