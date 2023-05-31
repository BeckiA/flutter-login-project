import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/core/controllers/attraction_details_controller.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/themes/app_theme_controller.dart';
import '../geo_location_widgets/travel_guide.dart';

class AttractionDetailGrid extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String title;
  final String id;
  final String picture;
  AttractionDetailGrid({
    super.key,
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.picture,
    required this.titleContent,
  });

  final List<String> titleContent;
  final ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    Get.put(AttractionDetailController());
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "To Do",
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 60,
            child: Divider(
              color: themeController.isDarkMode.value
                  ? VADTextColor
                  : VALTextColor,
              thickness: 5,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5 / 1.2,
            ),
            itemCount: titleContent.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AttractionDetailController.instance.routes[index],
                      arguments: {
                        'id': id,
                        'title': title,
                        'picture': picture,
                        'latitude': latitude,
                        'longitude': longitude
                      });
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: themeController.isDarkMode.value
                                    ? VADTextColor
                                    : VALTextColor),
                            height: double.infinity,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                titleContent[index],
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
