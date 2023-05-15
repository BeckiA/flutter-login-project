import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/colors.dart';
import '../../authentication/screens/profile/profile_screen.dart';
import '../itinerary/screens/note_list_screen.dart';
import 'dashboard_screens/dashboard.dart';
import 'navigation_screens/favorites_screen.dart';

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
    NoteListScreen(),
    FavoritesScreen(),
    ProfileScreen(),
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
          unselectedFontSize: 10,
          selectedFontSize: 10,
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
                label: "Home",
                icon: Icon(
                  LineAwesomeIcons.home,
                  size: 30,
                )),
            BottomNavigationBarItem(
                label: "Itrenary",
                icon: Icon(
                  LineAwesomeIcons.plus_square,
                  size: 30,
                )),
            BottomNavigationBarItem(
                label: "Favorites",
                icon: Icon(
                  LineAwesomeIcons.heart,
                  size: 30,
                )),
            BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(
                  LineAwesomeIcons.user,
                  size: 30,
                )),
          ]),
    );
  }
}
