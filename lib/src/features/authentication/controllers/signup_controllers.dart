import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_app/src/features/authentication/model/user_model.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';
import 'package:firebase_database/firebase_database.dart';

import '../screens/forget_password/forget_password_otp/forgot_password_otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('Users');
  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  var phoneNo = TextEditingController();

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

  Future<bool> isUserExist(String email) async {
    var query = await FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: email)
        .get();

    return query.docs.isNotEmpty;
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    // phoneAuthentication(user.phoneNo);
    if (true) {
      isUserExist(user.email);
    }
    registerUser(user.email, user.password);
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.PhoneAuthentication(phoneNo);
    print("Your Phone Number is${phoneNo}");
    Get.to(() => OTPScreen());
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    // Create new credential
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    // Storing user credentials into the firebase Database
    final UserCredential userCredentials =
        await _auth.signInWithCredential(credential);

    // Create Firebase User Account
    final User? user = userCredentials.user;

    // Store user profile data in Firebase Database
    Map<String, dynamic> userData = {
      "FullName": user?.displayName,
      "Email": user?.email,
      "photoUrl": user?.photoURL,
      "PhoneNo": user?.phoneNumber
    };

    _usersCollection.doc(user?.uid).set(userData);
    // once signed in, return the userCredentials
    return userCredentials;
  }
}
