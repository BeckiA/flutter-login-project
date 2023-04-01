import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: VAFormHeight - 10),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            style: TextStyle(fontSize: 16.0),
            decoration: const InputDecoration(
              label: Text(VAFullName),
              prefixIcon: Icon(Icons.person_outline_rounded),
            ),
          ),
          const SizedBox(
            height: VAFormHeight - 20,
          ),
          TextFormField(
            style: TextStyle(fontSize: 16.0),
            decoration: const InputDecoration(
              label: Text(VAEmail),
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(
            height: VAFormHeight - 20,
          ),
          TextFormField(
            style: TextStyle(fontSize: 16.0),
            decoration: const InputDecoration(
              label: Text(VAPhoneNo),
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          const SizedBox(
            height: VAFormHeight - 20,
          ),
          TextFormField(
            style: TextStyle(fontSize: 16.0),
            decoration: const InputDecoration(
              label: Text(VAPassword),
              prefixIcon: Icon(Icons.key_outlined),
            ),
          ),
          const SizedBox(
            height: VAFormHeight - 10,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: Text(VASignup.toUpperCase())),
          )
        ],
      )),
    );
  }
}
