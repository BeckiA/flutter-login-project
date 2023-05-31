import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/themes/app_theme_controller.dart';

class TravelEssentialWidget extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(left: 15),
          child: Text(
            "Travel Essentials",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 21,
              color: themeController.isDarkMode.value
                  ? VAPrimaryColor
                  : VAAccentColor,
              fontWeight: FontWeight.bold,
            ),
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
            LineAwesomeIcons.info,
            color: VAPrimaryColor,
            size: 28,
          ),
          title: Text(
            "Important Links",
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
            // Handle important links option tap
          },
        ),
        SizedBox(height: 7),
        ListTile(
          leading: Icon(
            LineAwesomeIcons.flag,
            color: VAPrimaryColor,
            size: 28,
          ),
          title: Text(
            "Regional Profile",
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
            // Handle regional profile option tap
          },
        ),
        SizedBox(height: 7),
        ListTile(
          leading: Icon(
            LineAwesomeIcons.phone,
            size: 28,
            color: VAPrimaryColor,
          ),
          title: Text(
            "Emergency Contact",
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
            // Handle emergency contact option tap
          },
        ),
        SizedBox(height: 7),
        Divider(
          color: Colors.grey,
          thickness: 0.5,
          height: 0.5,
        ),
      ],
    );
  }
}
