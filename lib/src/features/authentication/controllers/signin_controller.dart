import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/core/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/signup/signup_screen.dart';
import '../screens/welcome_screen/welcome_screen.dart';

class SignInController extends GetxController {
  // Create a reference to the Firestore collection where user data is stored
  final _usersCollection = FirebaseFirestore.instance.collection('Users');
  final _auth = FirebaseAuth.instance;
  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  Future<List<String>> getUserEmails(String email) async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: email)
        .get();

    List<String> emails = [];
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        emails.add(doc.data()['Email']);
      }
    }

    return emails;
  }

  // Example usage in login screen:
  void onLoginPressed(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var querySnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .where('Email', isEqualTo: email)
            .get();
        var name = querySnapshot.docs[0].data()["FullName"];
        print(name);
        prefs.setString("displayName", name.toString());
        prefs.setString("displayEmail", credential.user!.email.toString());
      }

      List<String> matchingEmails = await getUserEmails(email);

      if (matchingEmails.isEmpty) {
        Get.off(
          () => SignUp(),
        );
        // Show error message to user that their account is no longer active
        Get.snackbar(
            "Failed to Login", "Account does not Exist, SignUp to Continue",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red);
      } else {
        final credentialEmail = credential.user!.email;

        if (matchingEmails[0] == credentialEmail) {
          Get.to(() => Dashboard());
        } else {
          Get.off(
            () => SignUp(),
          );
          // Show error message to user that their account is no longer active
          Get.snackbar(
              "Failed to Login", "Account does not Exist, SignUp to Continue",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              colorText: Colors.red);
        }
      }
    } on Exception catch (e) {
      // TODO
      print(e);
      Get.snackbar("Something Unusual Occurs", "Message- ${e}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    }
  }
}
