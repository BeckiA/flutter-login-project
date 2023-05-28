import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final darkColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search & Explore Places',
                hintStyle: TextStyle(fontSize: 18)),
            onChanged: (val) {
              setState(() {
                searchQuery = val;
              });
            },
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('Attractions').snapshots(),
          builder: (context, snapshots) {
            return (snapshots.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : searchQuery.isEmpty
                    ? Center(
                        child: Text("Search for Attractions..."),
                      )
                    : ListView.builder(
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshots.data!.docs[index].data()
                              as Map<String, dynamic>;

                          if (data['title']
                              .toString()
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase())) {
                            Text(
                              "We have found",
                              style: TextStyle(
                                  fontFamily: "Poppins", fontSize: 18),
                            );
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      print(data['id']);
                                      Get.toNamed(
                                        '/attraction-detail',
                                        arguments: {
                                          "id": data['id'],
                                          "latitude": data['latitude'],
                                          "longitude": data['longitiude']
                                        },
                                        // id: int.parse(favorites[i].id)
                                      );
                                    },
                                    child: Card(
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10))),
                                            width: 140,
                                            height: 140,
                                            child: Image.network(
                                              data['picture'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      data['title'],
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(LineAwesomeIcons
                                                        .map_marker),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(data['location']),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 130,
                                                  child: Divider(
                                                    color: darkColor
                                                        ? VAWhiteColor
                                                        : Colors.blue,
                                                    thickness: 5,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(LineAwesomeIcons
                                                            .heart_1),
                                                        Text("25"),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(LineAwesomeIcons
                                                            .comment),
                                                        Text("2"),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                          return Container();
                        });
          },
        ));
  }
}
