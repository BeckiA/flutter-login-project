import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../screens/dashboard_screens/search_screen.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: GestureDetector(
        onTap: () {
          // Redirect to another page here
          Get.to(() => SearchScreen());
        },
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(50),
              right: Radius.circular(50),
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.search),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Search here...',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
