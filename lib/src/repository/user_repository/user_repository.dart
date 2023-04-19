import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/model/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
              "Success", "You account has been created successfully.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong, Please Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  // Step 2- Fetch All Users Or User details
  Future<UserModel> getUserDetails(String phone) async {
    final snapshot =
        await _db.collection("Users").where("Phone", isEqualTo: phone).get();
    if (snapshot.docs.isEmpty) {
      print(Exception("No user found with phone number $phone"));
    }
    if (snapshot.docs.length > 1) {
      print(throw Exception("Multiple users found with phone number $phone"));
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
