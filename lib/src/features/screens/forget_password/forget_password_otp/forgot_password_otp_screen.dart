import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/text_strings.dart';

import '../../../../constants/sizes.dart';
import '../../../controllers/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var otp;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(VADefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              VAOTPTittle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 80.0),
            ),
            Text(
              VAOTPSubtitle.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "$VAOTPMessage support@visitamhara.com",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                otp = code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.put(OTPController());
                    OTPController.instance.verifyOTP(otp ?? '');
                  },
                  child: Text(VANext)),
            )
          ],
        ),
      ),
    );
  }
}
