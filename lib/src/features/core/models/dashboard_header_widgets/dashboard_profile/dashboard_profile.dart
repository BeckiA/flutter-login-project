import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/features/authentication/screens/profile/Image_picker.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../../authentication/controllers/profile_controller.dart';

class DashboardProfile extends StatefulWidget {
  @override
  State<DashboardProfile> createState() => _DashboardProfileState();
}

class _DashboardProfileState extends State<DashboardProfile> {
  final profileController = Get.put(ProfileController());

  final _authRepo = Get.put(AuthenticationRepository());

  @override
  Widget build(BuildContext context) {
    final pickerInstance = ImagePickerWidget.instance;
    final userEmail = _authRepo.firebaseUser.value!.email as String;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(children: [
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: pickerInstance.displayPickedImage(),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Obx(() {
                final userName = profileController.userName.value;
                return Text(
                  "Welcome, $userName",
                );
              }),
            ),
          ]),
        ),
        Card(
            child:
                IconButton(onPressed: () {}, icon: Icon(LineAwesomeIcons.bell)))
      ],
    );
  }
}
