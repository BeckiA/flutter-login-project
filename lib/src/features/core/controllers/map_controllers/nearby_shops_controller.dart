import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'dart:math';

class NearbyShopsController extends GetxController {
  //Creating instance for the Nearby Shops
  static NearbyShopsController get instance => Get.find();
  // Calculates distance between two points
  double distanceBetween(double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<List<Marker>> getShopMarkers(
      double lat, double lng, double distance) async {
    List<Marker> markers = [];

    // Fetch hotel data from OpenStreetMap
    var response = await http.get(Uri.parse(
        'https://overpass-api.de/api/interpreter?data=[out:json][timeout:25];node[amenity=pharmacy](${lat - 0.1},${lng - 0.1},${lat + 0.1},${lng + 0.1});out;'));
    var data = json.decode(response.body);

    // Loop through each hotel and create a marker for it
    data['elements'].forEach((element) {
      var elementLat = element['lat'];
      var elementLng = element['lon'];
      var distanceFromLocation =
          distanceBetween(lat, lng, elementLat, elementLng);

      if (distanceFromLocation <= distance) {
        markers.add(
          Marker(
            width: 80,
            height: 80,
            point: LatLng(elementLat, elementLng),
            builder: (ctx) => Icon(
              LineAwesomeIcons.shopping_cart,
              size: 30,
            ),
          ),
        );
      }
    });

    return markers;
  }
}
