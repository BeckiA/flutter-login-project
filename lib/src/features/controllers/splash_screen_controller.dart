import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:login_app/src/features/screens/welcome_screen/welcome_screen.dart';

import '../screens/on_boarding_screen/on_boarding_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();
  RxBool animate = false.obs;
  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 200));

    animate.value = true;

    await Future.delayed(Duration(milliseconds: 10000));
    Get.to(OnBoardingScreen());
  }
}
