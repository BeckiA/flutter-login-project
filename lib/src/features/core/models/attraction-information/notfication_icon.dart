import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class NoNotfications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      title: const Text(
        'No Notifications ?',
        style: TextStyle(fontFamily: "Montserrat", fontSize: 18),
      ),
      content: const Text('No Notfications has been found',
          style: TextStyle(fontFamily: "Poppins", fontSize: 16)),
      actions: [
        TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
