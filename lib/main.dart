import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:login_app/src/features/authentication/controllers/screens/on_boarding_screen/on_boarding_screen.dart';
import '../src/utils/themes/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: VAAppTheme.lightTheme,
      darkTheme: VAAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
