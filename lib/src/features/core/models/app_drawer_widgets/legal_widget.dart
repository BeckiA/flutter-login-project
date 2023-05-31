import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';

class LegalWidget extends StatelessWidget {
  const LegalWidget({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.only(left: 15),
          child: Text(
            "Legal",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 21,
              color: isDark ? VAPrimaryColor : VAAccentColor,
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
            LineAwesomeIcons.lock,
            size: 28,
            color: VAPrimaryColor,
          ),
          title: Text(
            "Privacy Policy",
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
            // Handle privacy policy tap
          },
        ),
        SizedBox(height: 7),
        ListTile(
          leading: Icon(
            LineAwesomeIcons.info_circle,
            size: 28,
            color: VAPrimaryColor,
          ),
          title: Text(
            "About Us",
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
            // Handle about us tap
          },
        ),
        SizedBox(height: 7),
        ListTile(
          leading: Icon(
            LineAwesomeIcons.envelope,
            size: 28,
            color: VAPrimaryColor,
          ),
          title: Text(
            "Contact Us",
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
            // Handle contact us tap
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
