import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/colors.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../authentication/controllers/profile_controller.dart';
import '../../authentication/screens/profile/Image_picker.dart';
import 'app_drawer_widgets/legal_widget.dart';
import 'app_drawer_widgets/preferences_widget.dart';
import 'app_drawer_widgets/rate_widget.dart';
import 'app_drawer_widgets/travel_essentials_widget.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});
  final profileController = Get.put(ProfileController());

  final _authRepo = Get.put(AuthenticationRepository());

  @override
  Widget build(BuildContext context) {
    // Theme Data
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    // User Information Data Initalization
    final pickerInstance = ImagePickerWidget.instance;
    final userEmail = _authRepo.firebaseUser.value!.email as String;
    final bgImageURL =
        'https://images.unsplash.com/photo-1542273917363-3b1817f69a2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGZvcmVzdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60';
    final userName = profileController.userName.value;
    return Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 250,
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  userName,
                  style: TextStyle(fontFamily: "Montserrat", fontSize: 28),
                ),
                accountEmail: Text(
                  userEmail,
                  style: TextStyle(fontFamily: "Montserrat", fontSize: 18),
                ),
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: pickerInstance.displayPickedImage(),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          bgImageURL,
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                TravelEssentialWidget(isDark: isDark),
                SizedBox(height: 5),
                Preferences(isDark: isDark),
                SizedBox(
                  height: 5,
                ),
                Rate(isDark: isDark),
                SizedBox(
                  height: 5,
                ),
                LegalWidget(
                  isDark: isDark,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
