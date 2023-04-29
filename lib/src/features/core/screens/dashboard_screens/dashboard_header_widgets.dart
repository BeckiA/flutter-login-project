import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import '../carousel-sliders/carousel_main.dart';
import 'dashboard_icons/dashboard_icon_list.dart';
import 'dashboard_icons/dashboard_icons_item.dart';
import 'dashboard_profile/dashboard_profile.dart';
import 'dashboard_searchbar/dashboard_searchbar.dart';

class DashboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(IconsItem());
    Get.put(CarouselWithIndicatorDemo());

    return Column(
      children: [
        DashboardProfile(),
        SizedBox(
          height: 20.0,
        ),
        SearchBar(),
        SizedBox(
          height: 20.0,
        ),
        Container(
          child: IconList(items: IconsItem.instance.items),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "Most Popular",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          child: CarouselWithIndicatorDemo(),
        ),
      ],
    );
  }
}
