import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../constants/image_strings.dart';
import 'icons_widget.dart';

class DashboardHeader extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'icon': Icons.home,
      'text': 'Home',
    },
    {
      'icon': Icons.favorite,
      'text': 'Favorites',
    },
    {
      'icon': Icons.notifications,
      'text': 'Notifications',
    },
    {
      'icon': Icons.settings,
      'text': 'Settings',
    },
    {
      'icon': Icons.help,
      'text': 'Help',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
        ),
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // Remove focus and dismiss keyboard
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                currentFocus.focusedChild?.unfocus();
              }
            },
            child: TextField(
              style: TextStyle(fontSize: 20),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 1.5,
                ),
                prefixIcon: IconButton(
                  padding:
                      const EdgeInsets.only(top: 1.0, bottom: 1.0, left: 4.0),
                  onPressed: () {},
                  icon: Icon(LineAwesomeIcons.search),
                ),
                hintText: "Search here...",
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          child: IconList(items: items),
        )
      ],
    );
  }
}
