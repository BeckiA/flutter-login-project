import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../features/authentication/model/user_model.dart';
import '../../features/authentication/screens/signup/signup_screen.dart';
import '../../features/authentication/screens/welcome_screen/welcome_screen.dart';
import '../../features/core/screens/dashboard.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  createUser(UserModel user) async {
    // Check if user already exists in the database
    var querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: user.email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      Get.snackbar("Error", "User already exists with this email",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      Get.to(SignUp());
    } else {
      await FirebaseFirestore.instance
          .collection("Users")
          .add(user.toJson())
          .whenComplete(
            () => Get.snackbar(
                "Success", "You account has been created successfully.",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.withOpacity(0.1),
                colorText: Colors.green),
          );

      Get.to(Dashboard());
    }
  }

  // Step 2- Fetch All Users Or User details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    if (snapshot.docs.isEmpty) {
      print(Exception("No user found with this email $email"));
    }
    if (snapshot.docs.length > 1) {
      print(throw Exception("Multiple users found with this emai $email"));
    }
    final userData = UserModel.fromsnapshot(snapshot.docs.single);
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromsnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    var querySnapshot = await _db
        .collection("Users")
        .where("Email", isEqualTo: user.email)
        .get();

    var documentSnapshot = querySnapshot.docs.first;
    await documentSnapshot.reference.update(user.toJson());
  }

  Future<void> deleteUserRecord(UserModel user) async {
    var querySnapshot = await _db
        .collection("Users")
        .where("Email", isEqualTo: user.email)
        .get();

    var documentSnapshot = querySnapshot.docs.first;
    await documentSnapshot.reference.delete();
  }
}
