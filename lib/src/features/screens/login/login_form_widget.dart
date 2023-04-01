import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: VAFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: VAEmail,
                hintText: VAEmail,
              ),
            ),
            const SizedBox(
              height: VAFormHeight - 20,
            ),
            TextFormField(
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key_outlined),
                labelText: VAPassword,
                hintText: VAPassword,
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye_sharp),
                  onPressed: null,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text(VAForgot),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
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
