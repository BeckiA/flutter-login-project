import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/src/common_widgets/form_header_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';

import '../../../controllers/screens/forget_password/forget_password_otp/forgot_password_otp_screen.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(VADefaultSize),
          child: Column(
            children: [
              const SizedBox(
                height: VADefaultSize * 4,
              ),
              FormHeader(
                size: size,
                image: VAForgotPassword,
                subTitle: VAForgetPasswordSubTitle,
                title: VAForgot,
                heightBetween: 30,
                textAlign: TextAlign.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              SizedBox(
                height: VAFormHeight,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text(VAPhoneNo),
                        hintText: VAPhoneNo,
                        prefixIcon: Icon(Icons.phone)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => OTPScreen());
                          },
                          child: Text(VANext)))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
