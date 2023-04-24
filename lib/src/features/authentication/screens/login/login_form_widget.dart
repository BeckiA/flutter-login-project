import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/controllers/signin_controller.dart';
import '../forget_password/forget_password_options/forget_password_bottomsheet.dart';
import '../forget_password/forget_password_options/forget_password_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  final loginController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    final _emailController = loginController.email;
    final _passwordController = loginController.password;
    return Form(
        child: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: VAFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _emailController,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                prefixIcon: Icon(LineAwesomeIcons.user),
                labelText: VAEmail,
                hintText: VAEmail,
              ),
            ),
            const SizedBox(
              height: VAFormHeight - 20,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscureText,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                label: Text(VAPassword),
                prefixIcon: Icon(LineAwesomeIcons.key),
                suffix: IconButton(
                  icon:
                      // ignore: dead_code
                      _obscureText
                          ? Icon(LineAwesomeIcons.eye)
                          : Icon(LineAwesomeIcons.eye_slash),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text(VAForgot),
                onPressed: () {
                  ForgetPasswordScreen.buildshowModalBottomSheet(context);
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    loginController.onLoginPressed(_emailController.text.trim(),
                        _passwordController.text.trim());
                    print(_emailController.text);
                    print(_passwordController.text);
                  },
                  child: Text(
                    VALogin.toUpperCase(),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
