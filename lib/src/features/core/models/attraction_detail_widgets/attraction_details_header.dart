import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/themes/app_theme_controller.dart';
import '../../controllers/attraction.dart';
import '../../controllers/navigation_menu_controllers/favorite_controller.dart';

class AttractionsDetailHeader extends StatelessWidget {
  AttractionsDetailHeader({
    super.key,
    required this.attraction,
  });

  final Attraction attraction;
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    // Get.put(FavoritesController());
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(attraction.picture), fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: themeController.isDarkMode.value
                        ? VADTextColor
                        : VALTextColor,
                    child: Container(
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(LineAwesomeIcons.arrow_left),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: themeController.isDarkMode.value
                        ? VADTextColor
                        : VALTextColor,
                    radius: 26,
                    child: Container(
                      child: IconButton(
                        onPressed: () {
                          attraction.toggleFavoriteStatus();
                          print(attraction.isFavorite);
                          attraction.isFavorite = attraction.isFavorite;
                        },
                        icon: Icon(
                          attraction.isFavorite
                              ? LineAwesomeIcons.heart_1
                              : LineAwesomeIcons.heart,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.map_marker,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(attraction.location)
                      ],
                    ),
                    Container(
                      child: ChangeNotifierProvider<Attraction>(
                        create: (context) => Attraction(
                            categoryId: "",
                            description: "",
                            id: "",
                            latitude: 0.0,
                            location: "",
                            longitude: 0.0,
                            picture: "",
                            title: "",
                            isFavorite: false),
                        child: Consumer<Attraction>(
                          builder: (ctx, attract, _) {
                            return GestureDetector(
                              child: IconButton(
                                onPressed: () {
                                  attract.toggleFavoriteStatus();
                                  print(attract.isFavorite);
                                  attraction.isFavorite = attract.isFavorite;
                                },
                                icon: Icon(
                                  attraction.isFavorite
                                      ? LineAwesomeIcons.heart_1
                                      : LineAwesomeIcons.heart,
                                  size: 30,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    attraction.title,
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: themeController.isDarkMode.value
                            ? VADTextColor
                            : VALTextColor),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Divider(
                    color: themeController.isDarkMode.value
                        ? VADTextColor
                        : VALTextColor,
                    thickness: 5,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(LineAwesomeIcons.heart),
                        SizedBox(
                          width: 5,
                        ),
                        Text("10 Peoples liked this")
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Icon(LineAwesomeIcons.comment),
                        SizedBox(
                          width: 5,
                        ),
                        Text("2")
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      child: Text(attraction.description),
                    )
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
