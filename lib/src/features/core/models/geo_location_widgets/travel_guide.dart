import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:latlong2/latlong.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TravelGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the arguments that were passed to this screen
    final arguments = Get.arguments;

    // Access the values of the arguments using their keys
    final latitude = arguments['latitude'];
    final longitude = arguments['longitude'];
    final markers = <Marker>[
      Marker(
        width: 80,
        height: 80,
        point: LatLng(latitude, longitude),
        builder: (ctx) => Icon(
          LineAwesomeIcons.map_marker,
          size: 45,
        ),
      ),
      // Marker(
      //   width: 80,
      //   height: 80,
      //   point: LatLng(53.3498, -6.2603),
      //   builder: (ctx) => const FlutterLogo(
      //     textColor: Colors.green,
      //     key: ObjectKey(Colors.green),
      //   ),
      // ),
      // Marker(
      //   width: 80,
      //   height: 80,
      //   point: LatLng(48.8566, 2.3522),
      //   builder: (ctx) => const FlutterLogo(
      //     textColor: Colors.purple,
      //     key: ObjectKey(Colors.purple),
      //   ),
      // ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      // drawer: buildDrawer(context, route),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(latitude, longitude),
                  zoom: 14,
                ),
                nonRotatedChildren: [
                  // RichAttributionWidget(
                  //   popupInitialDisplayDuration: const Duration(seconds: 5),
                  //   animationConfig: const ScaleRAWA(),
                  //   attributions: [
                  // //     TextSourceAttribution(
                  // //       'OpenStreetMap contributors',
                  // //       onTap: () => launchUrl(
                  // //         Uri.parse('https://openstreetmap.org/copyright'),
                  // //       ),
                  // //     ),
                  // //     const TextSourceAttribution(
                  // //       'This attribution is the same throughout this app, except where otherwise specified',
                  // //       prependCopyright: false,
                  // //     ),
                ],
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                  MarkerLayer(markers: markers),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
