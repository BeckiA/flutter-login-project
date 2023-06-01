import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../../../utils/themes/app_theme_controller.dart';
import '../screens/note_view_screen.dart';
import '../utils/constants.dart';

class ListItem extends StatelessWidget {
  final int id;
  final String title;
  final String content;
  final String imagePath;
  final String date;
  ListItem(
      {required this.id,
      required this.title,
      required this.content,
      required this.imagePath,
      required this.date});
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Container(
      width: double.infinity,
      height: 135.0,
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, NoteViewScreen.route, arguments: id);
          Get.toNamed(NoteViewScreen.route, arguments: {"id": id});
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                  offset: Offset(0, 2))
            ],
            color: themeController.isDarkMode.value
                ? Colors.black
                : Colors.white12,
            // boxShadow: shadow,
            borderRadius: BorderRadius.circular(15.0),
            // border: Border.all(color: grey, width: 1.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        date,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Expanded(
                        child: Text(
                          content,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: themeController.isDarkMode.value
                                ? Colors.white70
                                : Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (imagePath != null)
                Row(
                  children: [
                    const SizedBox(
                      width: 12.0,
                    ),
                    Container(
                      width: 80.0,
                      height: 95.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: FileImage(
                            File(imagePath),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
