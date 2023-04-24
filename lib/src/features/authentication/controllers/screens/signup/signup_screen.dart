import 'package:flutter/material.dart';
import 'package:login_app/src/common_widgets/form_header_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/controllers/screens/signup/signup_footer.dart';

import '../../../screens/signup/signup_form_widget.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(VADefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeader(
                    size: size,
                    image: VALoginScreenImage,
                    subTitle: VASignUpSubtitle,
                    title: VASignUPTitle),
                SignUpForm(),
                SignUpFormWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
