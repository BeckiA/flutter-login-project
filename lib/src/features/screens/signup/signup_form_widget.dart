import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/controllers/signup_controllers.dart';

import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../forget_password/forget_password_otp/forgot_password_otp_screen.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final _formKey;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              style: TextStyle(fontSize: 16.0),
              decoration: const InputDecoration(
                label: Text(VAFullName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: controller.email,
              style: TextStyle(fontSize: 16.0),
              decoration: const InputDecoration(
                label: Text(VAEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: controller.phoneNo,
              style: TextStyle(fontSize: 16.0),
              decoration: const InputDecoration(
                label: Text(VAPhoneNo),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              // keyboardAppearance: ,
              controller: controller.password,
              style: TextStyle(fontSize: 16.0),
              decoration: const InputDecoration(
                label: Text(VAPassword),
                prefixIcon: Icon(Icons.key_outlined),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey?.currentState?.validate() ?? false) {
                    // SignUpController.instance.registerUser(
                    //   controller.email.text.trim(),
                    //   controller.password.text.trim(),
                    // );
                    SignUpController.instance
                        .phoneAuthentication(controller.phoneNo.text.trim());
                    Get.to(OTPScreen());
                  }
                },
                child: Text(VASignup.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
