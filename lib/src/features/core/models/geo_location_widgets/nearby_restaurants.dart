import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:login_app/src/features/core/controllers/geo_location_controllers/nearby_hotels_controller.dart';

import '../../controllers/geo_location_controllers/nearby_restaurants_controller.dart';

class NearbyRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(NearbyRestaurantsController());
    // Get the arguments that were passed to this screen
    final arguments = Get.arguments;

    // Access the values of the arguments using their keys
    final latitude = arguments['latitude'];
    final longitude = arguments['longitude'];
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: NearbyRestaurantsController.instance
              .getRestaurantMarkers(latitude, longitude, 5000), // 10km radius
          builder:
              (BuildContext context, AsyncSnapshot<List<Marker>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return FlutterMap(
                options: MapOptions(
                  center: LatLng(latitude, longitude),
                  zoom: 14,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                  MarkerLayer(markers: snapshot.data ?? []),
                ],
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
