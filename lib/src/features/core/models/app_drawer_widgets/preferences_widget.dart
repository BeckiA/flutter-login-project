import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/themes/app_theme_controller.dart';

class Preferences extends StatelessWidget {
  const Preferences({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            "Preferences",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 21,
              color: themeController.isDarkMode.value ? VAPrimaryColor : VAAccentColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.5,
          height: 0.5,
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(
            LineAwesomeIcons.globe,
            size: 28,
            color: VAPrimaryColor,
          ),
          title: Text(
            "Languages",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
            ),
          ),
          trailing: Icon(
            LineAwesomeIcons.angle_right,
            size: 20,
            color: Colors.grey,
          ),
          onTap: () {
            // Handle languages option tap
          },
        ),
        SizedBox(height: 7),
        ListTile(
          leading: Icon(
            LineAwesomeIcons.moon,
            size: 28,
            color: VAPrimaryColor,
          ),
          title: Text(
            "Dark Theme",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
            ),
          ),
          trailing: Obx(
            () => Switch(
              value: themeController.isDarkMode.value,
              onChanged: (value) {
                themeController.toggleTheme();
                Get.changeThemeMode(themeController.isDarkMode.value
                    ? ThemeMode.dark
                    : ThemeMode.light);
              },
              activeColor: VAPrimaryColor,
            ),
          ),
          onTap: () {
            // Handle dark theme option tap
          },
        ),
        SizedBox(height: 10),
        Divider(
          color: Colors.grey,
          thickness: 0.5,
          height: 0.5,
        ),
      ],
    );
  }
}
