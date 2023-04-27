import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class IconsItem extends GetxController {
  static IconsItem get instance => Get.find();
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
}
