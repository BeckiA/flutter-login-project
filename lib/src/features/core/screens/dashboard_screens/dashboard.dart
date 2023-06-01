import 'package:firebase_auth/firebase_auth.dart';
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
  late Rx<User?> firebaseUser;
  bool isLoading = true;
  void initState() {
    super.initState();
    // TODO: implement initState

    final _authRepo = Get.put(AuthenticationRepository());
    firebaseUser = _authRepo.firebaseUser;
    Get.put(Attractions());
    Get.put(AttractionGrids());
    Get.put(AttractionList());
    // Implmenting initalization of a username data
    getUserData();
  }

  Future<void> getUserData() async {
    final profileController = Get.put(ProfileController());
    final user = firebaseUser.value;
    if (user != null) {
      final userEmail = user.email as String;

      await profileController.getUserNameData(userEmail);
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1.42,
                    child: Column(
                      children: [
                        DashboardHeader(),
                        SizedBox(
                          height: 20,
                        ),
                        AttractionGrids(),
                      ],
                    ),
                  )),
            ),
          );
  }
}
