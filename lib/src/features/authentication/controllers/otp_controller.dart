import 'package:get/get.dart';
import 'package:login_app/src/features/core/screens/main_screen.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';

import '../screens/welcome_screen/welcome_screen.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(MainScreen()) : Get.back();
  }
}
