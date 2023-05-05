import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/src/constants/image_strings.dart';
import '../../controllers/atrractions_list.dart';
import '../../controllers/attraction.dart';

import '../../controllers/attractions.dart';
import '../attraction_sites/attraction_screen.dart';

class AttractionGrids extends StatelessWidget {
  AttractionGrids({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AttractionList());
    Get.put(Attractions());

    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2.5,
        ),
        itemCount: Attractions.instance.gridImages.length,
        itemBuilder: (BuildContext context, int index) {
          final attractionItems =
              AttractionList.instance.getAttractionIndex(index);
          final attractionTitle = Attractions.instance.attractions[index];

          return GestureDetector(
            onTap: () {
              Get.to(
                () => AttractionScreen(
                  attractionTitle: attractionTitle,
                  attractions: attractionItems,
                ),
              );
            },
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image:
                            AssetImage(Attractions.instance.gridImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        height: double.infinity,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            attractionTitle,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 24,
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
    );
  }
}
