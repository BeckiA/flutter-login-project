import 'package:flutter/material.dart';

class IconList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  IconList({required this.items});
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                // Handle the item tap event here.
                print('Item ${index + 1} was tapped.');
              },
              child: Column(
                children: [
                  Icon(
                    items[index]['icon'],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    items[index]['text'],
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
