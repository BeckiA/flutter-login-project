import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/attractions.dart';
import '../../models/attraction_sites_grid/attraction_site_grid.dart';
import '../../models/dashboard_header_widgets/dashboard_header_widgets.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(Attractions());
    Get.put(AttractionGrids());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Container(
              height: MediaQuery.of(context).size.height * 1.35,
              child: Column(
                children: [
                  DashboardHeader(),
                  SizedBox(
                    height: 30,
                  ),
                  AttractionGrids(),
                ],
              ),
            )),
      ),
    );
  }
}
