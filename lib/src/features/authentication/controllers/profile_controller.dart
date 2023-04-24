import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/authentication/controllers/screens/login/login_screen.dart';
import 'package:login_app/src/features/authentication/model/user_model.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  final _auth = FirebaseAuth.instance;
  // USer Data via Shared Preferences
  late var displayName = "";
  late var displayEmail = "";

  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    displayName = prefs.getString('displayName').toString();
    final displayNameObs = displayName != "" ? displayName.obs : Rx<String>("");

    displayEmail = prefs.getString('displayEmail').toString();
    final displayEmailObs =
        displayEmail != "" ? displayEmail.obs : Rx<String>("");
  }

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
}