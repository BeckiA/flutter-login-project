import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IconList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  IconList({required this.items});
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
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
                      child: Column(children: [
                        IconButton(
                          onPressed: () async {
                            final url = items[index][
                                'url']; // Replace with your desired website URL

                            if (!await canLaunch(url)) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Unable to access the website',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Montserrat",
                                            color: Colors.grey)),
                                    content: Text(
                                      'Please try again later.',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(
                                              context); // Close the dialog
                                        },
                                        child: Text('Cancel'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              await launch(
                                url,
                              );
                            }
                          },
                          icon: Icon(
                            items[index]['icon'],
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(items[index]['text'],
                            style: TextStyle(
                                fontSize: 16.0, fontFamily: "Poppins")),
                      ])));
            }));
  }
}
