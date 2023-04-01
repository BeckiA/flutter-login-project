import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import 'login_footer_widget.dart';
import 'login_form_widget.dart';
import '../../../common_widgets/form_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          /**SECTION-1 [IMAGE & TEXT] */
          child: Container(
            padding: const EdgeInsets.all(VADefaultSize),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FormHeader(
                  size: size,
                  image: VALoginScreenImage,
                  subTitle: VALoginSubTitle,
                  title: VALoginTitle),
              LoginForm(),
              LoginFooter()
            ]),
          ),
        ),
      ),
    );
  }
}
