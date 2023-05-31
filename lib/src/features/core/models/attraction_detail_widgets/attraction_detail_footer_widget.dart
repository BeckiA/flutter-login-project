import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/colors.dart';
import '../../controllers/attraction.dart';

class AttractionDetailsFooter extends StatelessWidget {
  final String categoryId;
  final List<Attraction> attractions;
  final String id;
  AttractionDetailsFooter({
    required this.categoryId,
    required this.attractions,
    // required this.brightnessDark,
    required this.id,
  });

  // final bool brightnessDark;

  @override
  Widget build(BuildContext context) {
    List<Attraction> relatedAttractions = attractions
        .where((attraction) => attraction.categoryId == categoryId)
        .toList();
    print(relatedAttractions[0].id);
    return relatedAttractions.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'You May Also Like',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: relatedAttractions.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () => Get.toNamed(
                          '/attraction-detail',
                          arguments: {'id': relatedAttractions[index].id},
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            relatedAttractions[index].picture,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : Container(child: Text("No attractions found with this category id"));
  }
}
