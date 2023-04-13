import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  // call this function from the Design & it will do the rest
  void registerUser(String email, String password) {
    print(email);
    print(password);
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }
}
