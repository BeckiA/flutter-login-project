import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigation_menu_controllers/favorite_controller.dart';

// ignore: must_be_immutable
class Attraction extends StatelessWidget with ChangeNotifier {
  final String id;
  final String title;
  final String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final String location;
  final String picture;
  final String description;
  final String categoryId;
  final double latitude;
  final double longitude;
  bool isFavorite;

  Attraction({
    required this.id,
    required this.title,
    required this.location,
    required this.picture,
    required this.description,
    required this.categoryId,
    required this.latitude,
    required this.longitude,
    this.isFavorite = false,
  });

  Future<void> _saveFavoriteStatus() async {
    final box = GetStorage();
    final favorites = box.read<List>('favorites') ?? [];
    if (isFavorite) {
      favorites.add(id);
    } else {
      favorites.remove(id);
    }
    await box.write('favorites', favorites);
  }

  void toggleFavoriteStatus() async {
    isFavorite = !isFavorite;
    await _saveFavoriteStatus();
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/attraction-detail', arguments: {
          'id': id,
          'latitude': latitude,
          'longitude': longitude,
        });
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(picture), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(LineAwesomeIcons.map_marker),
                      SizedBox(
                        width: 5,
                      ),
                      Text("$location")
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(LineAwesomeIcons.clock),
                          SizedBox(
                            width: 5,
                          ),
                          Text("$date"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(LineAwesomeIcons.heart),
                          SizedBox(
                            width: 5,
                          ),
                          Text("20"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(LineAwesomeIcons.comment),
                          SizedBox(
                            width: 5,
                          ),
                          Text("30"),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static fromJson(e) {}
}
