import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import 'login_form_widget.dart';
import 'login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        /**SECTION-1 [IMAGE & TEXT] */
        child: Container(
          padding: const EdgeInsets.all(VADefaultSize),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            LoginHeader(size: size),
            LoginForm(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("OR"),
                const SizedBox(
                  height: VAFormHeight - 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Image(
                      image: AssetImage(VALoginImage),
                      width: 20,
                    ),
                    label: Text(VASignInWithGoogle),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 64, vertical: 16)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(VAWhiteColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: VAFormHeight - 20,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text.rich(TextSpan(
                        text: VADontHaveAcc,
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: [
                          TextSpan(
                              text: VASignup,
                              style: TextStyle(color: Colors.blue))
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
            )
          ]),
        ),
      ),
    );
  }
}
