import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/image_strings.dart';

class DashboardProfile extends StatelessWidget {
  const DashboardProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(image: AssetImage(VAProfileImage)),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text("Hi, Name"),
        ]),
        IconButton(onPressed: () {}, icon: Icon(LineAwesomeIcons.bars))
      ],
    );
  }
}
