import 'package:get/get.dart';
import 'package:login_app/src/features/authentication/controllers/screens/welcome_screen/welcome_screen.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(Welcome()) : Get.back();
  }
}