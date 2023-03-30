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
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: VAEmail,
                hintText: VAEmail,
                hintStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(vertical: 2),
              ),
            ),
            const SizedBox(
              height: VAFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.key_outlined),
                  labelText: VAPassword,
                  hintText: VAPassword,
                  hintStyle: TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_sharp),
                    onPressed: null,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 2),
                  border: OutlineInputBorder()),
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
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 64, vertical: 16)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(VASeconsdaryColor),
                  ),
                  onPressed: () {},
                  child: Text(
                    VALogin.toUpperCase(),
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
