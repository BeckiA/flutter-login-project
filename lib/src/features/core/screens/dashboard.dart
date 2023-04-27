import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/dashboard_header_widgets/dashboard_header_widgets.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Column(
              children: [
                DashboardHeader(),
              ],
            )),
      ),
    );
  }
}
