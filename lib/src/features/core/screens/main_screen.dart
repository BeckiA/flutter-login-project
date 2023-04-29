import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/colors.dart';
import 'navigation_screens/dashboard.dart';
import 'navigation_screens/favorites_screen.dart';
import 'navigation_screens/iternary_screen.dart';
import 'navigation_screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  var currentIndex = 0;
  final pages = [
    Dashboard(),
    Itrenary(),
    Favorite(),
    Profile(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 5,
          selectedFontSize: 5,
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: VAPrimaryColor,
          unselectedItemColor: VAAccentColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                label: "Home", icon: Icon(LineAwesomeIcons.home)),
            BottomNavigationBarItem(
                label: "Itrenary", icon: Icon(LineAwesomeIcons.plus_square)),
            BottomNavigationBarItem(
                label: "Favorites", icon: Icon(LineAwesomeIcons.heart)),
            BottomNavigationBarItem(
                label: "Profile", icon: Icon(LineAwesomeIcons.user)),
          ]),
    );
  }
}
