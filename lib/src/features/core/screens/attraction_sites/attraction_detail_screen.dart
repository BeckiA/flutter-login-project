import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/features/core/controllers/atrractions_list.dart';
import 'package:login_app/src/features/core/controllers/attraction_details_controller.dart';

import '../../controllers/attraction.dart';
import '../../models/attraction_detail_widgets/attraction_detail_footer_widget.dart';
import '../../models/attraction_detail_widgets/attraction_detail_grid.dart';
import '../../models/attraction_detail_widgets/attraction_details_header.dart';

class AttractionDetailScreen extends StatelessWidget {
  static const routeName = '/attraction-detail';

  // AttractionDetailScreen({required this.attractions});
  @override
  Widget build(BuildContext context) {
    final brightnessDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final List<Attraction> attractions;
    Get.put(AttractionList());
    Get.put(AttractionDetailController());
    final titleContent = AttractionDetailController.instance.titles;
    final args = Get.arguments as Map<String, dynamic>;
    final id = args['id'] as String;
    final latitude = args['latitude'] as double;
    final longitude = args['longitude'] as double;
    print(id);
    print(latitude);
    print(longitude);
    // final Attraction attraction =
    //     attractions.firstWhere((attraction) => attraction.id == id);
    // Create a list of attractions that belong to the same category as the current attraction
    final attraction = AttractionList.instance.findAttractionById(id);

    final categoryId = attraction.categoryId;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            AttractionsDetailHeader(
                attraction: attraction, brightnessDark: brightnessDark),
            SizedBox(
              height: 20,
            ),
            AttractionDetailGrid(
              latitude: latitude,
              longitude: longitude,
              brightnessDark: brightnessDark,
              titleContent: titleContent,
            ),
            SizedBox(
              height: 20,
            ),
            AttractionDetailsFooter(
              brightnessDark: brightnessDark,
              attractions: [attraction],
              categoryId: categoryId,
              id: id,
            )
          ],
        ),
      ),
    );
  }
}