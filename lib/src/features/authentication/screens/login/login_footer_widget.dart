import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/controllers/signup_controllers.dart';

import '../signup/signup_screen.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: VAFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              controller.signInWithGoogle();
            },
            icon: Image(
              image: AssetImage(VALoginImage),
              width: 20,
            ),
            label: Text(VASignInWithGoogle.toUpperCase()),
          ),
        ),
        const SizedBox(
          height: VAFormHeight - 20,
        ),
        TextButton(
            onPressed: () {
              Get.to(SignUp());
            },
            child: Text.rich(TextSpan(
                text: VADontHaveAcc,
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(
                    text: VASignup.toUpperCase(),
                    style: TextStyle(color: Colors.blue),
                  )
                ]))),
        const SizedBox(
          height: VAFormHeight - 20,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              "Continue as a Guest",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 21,
                  // color: VAPrimaryColor,
                  decoration: TextDecoration.underline),
            ))
      ],
    );
  }
}
