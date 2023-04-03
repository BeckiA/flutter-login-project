import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/src/features/screens/forget_password/forget_password_phone/forget_password_phone.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../forget_password_email/forget_password_email.dart';
import 'forget_password_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildshowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        context: context,
        builder: (context) => Container(
            padding: const EdgeInsets.all(VADefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  VAForgetPasswordTitle,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: 5),
                Text(
                  VAForgetPasswordSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ForgetPasswordBtnWidget(
                  icon: Icons.mail_outline_rounded,
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(ForgetPasswordEmailScreen());
                  },
                  title: VAEmail,
                  subTitle: VAResetViaEmail,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ForgetPasswordBtnWidget(
                  icon: Icons.mobile_friendly_rounded,
                  onTap: () {
                    Navigator.pop(context);

                    Get.to(ForgetPasswordPhoneScreen());
                  },
                  title: VAPhoneNo,
                  subTitle: VAResetViaPhone,
                ),
              ],
            )));
  }
}
