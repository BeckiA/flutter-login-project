import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/authentication/model/user_model.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login/login_screen.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  final _auth = FirebaseAuth.instance;
  Rx<String> userName = ''.obs;
  //Step 3 - Get User Email and pass to userRepository to fetch user record
  getUserData() {
    final email = _authRepo.firebaseUser.value!.email;
    print(email);
    if (email != null) {
      print(_userRepo.getUserDetails(email));
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }

  deleteRecord(UserModel user) async {
    await _userRepo.deleteUserRecord(user);
    await _auth.signOut();
    Get.to(LoginScreen());
  }

  getUserNameData(String email) {
    Future<String> userNameInfo() async {
      String userName = await _userRepo.getUsername(email);
      return userName;
    }

    userNameInfo().then((value) {
      userName.value = value;

      return userName.value;
    });
  }
}
