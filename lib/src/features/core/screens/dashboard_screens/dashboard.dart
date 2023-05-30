import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../authentication/controllers/profile_controller.dart';
import '../../controllers/attractions.dart';
import '../attraction_sites_grid/attraction_site_grid.dart';
import 'dashboard_header_widgets.dart';
import '../../controllers/atrractions_list.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState

    Get.put(Attractions());
    Get.put(AttractionGrids());
    Get.put(AttractionList());
    // Implmenting initalization of a username data
    final profileController = Get.put(ProfileController());

    final _authRepo = Get.put(AuthenticationRepository());
    final userEmail = _authRepo.firebaseUser.value!.email as String;
    String userName = '';
    profileController.getUserNameData(userEmail);
  }

  Widget build(BuildContext context) {
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
