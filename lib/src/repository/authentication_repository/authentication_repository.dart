import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:login_app/src/features/screens/login/login_screen.dart';
import 'package:login_app/src/features/screens/welcome_screen/welcome_screen.dart';
import 'package:login_app/src/repository/exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitalScreen);
  }

  _setInitalScreen(User? user) {
    user == null
        ? Get.offAll(() => OnBoardingScreen())
        : Get.offAll(() => Welcome());
  }

  // FUNCTION
  Future<void> PhoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'Invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid.');
          } else {
            Get.snackbar('Error', 'Something went wrong. Try again');
          }
        },
        codeSent: (verificationId, forceResendingToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => Welcome())
          : Get.to(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION -${ex.message}');
      // Write the error code with snackbars here using Get.Snackbars("Message here more on screen shots")
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}