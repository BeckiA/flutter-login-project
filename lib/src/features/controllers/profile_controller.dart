import 'package:get/get.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

import '../model/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  //Step 3 - Get User Email and pass to userRepository to fetch user record
  getUserData() {
    final phone = _authRepo.firebaseUser.value!.phoneNumber;
    print(phone);
    if (phone != null) {
      print(_userRepo.getUserDetails(phone));
      return _userRepo.getUserDetails(phone);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }

  deleteRecord(UserModel user) async {
    await _userRepo.deleteUserRecord(user);
  }
}
