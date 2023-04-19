import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/model/user_model.dart';
import 'package:login_app/src/features/screens/forget_password/forget_password_otp/forgot_password_otp_screen.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());
  // call this function from the Design & it will do the rest
  void registerUser(String email, String password) {
    // print(email);
    // print(password);
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => OTPScreen());
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.PhoneAuthentication(phoneNo);
    // Get.to(() => OTPScreen());
  }
}
