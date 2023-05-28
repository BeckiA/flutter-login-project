import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/colors.dart';

import '../../controllers/atrractions_list.dart';
import '../../controllers/attraction.dart';
import '../../controllers/navigation_menu_controllers/favorite_controller.dart';
import '../../controllers/no_favorites_screen_widget.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final darkColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final attractionList = Get.find<AttractionList>();
    final favorites = attractionList.favoriteItems;
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
        ),
        body: favorites.isEmpty
            ? NoFavorites()
            : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, i) {
                  return Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: () {
                              print(favorites[i].id);
                              Get.toNamed(
                                '/attraction-detail',
                                arguments: {
                                  "id": favorites[i].id,
                                  "latitude": favorites[i].latitude,
                                  "longitude": favorites[i].longitude
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
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10))),
                                    width: 140,
                                    height: 140,
                                    child: Image.network(
                                      favorites[i].picture,
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
                                              favorites[i].title,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            Icon(LineAwesomeIcons.map_marker),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(favorites[i].location),
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
                                                Icon(LineAwesomeIcons.heart_1),
                                                Text("25"),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                Icon(LineAwesomeIcons.comment),
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
                    ),
                  );
                },
              ));
  }
}
