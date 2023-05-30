import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class IconsItem extends GetxController {
  static IconsItem get instance => Get.find();
  final List<Map<String, dynamic>> items = [
    {
      'icon': LineAwesomeIcons.suitcase_rolling,
      'text': 'Trips',
      'url':
          'https://www.tripadvisor.com/Attractions-g2193232-Activities-Amhara_Region.html'
    },
    {
      'icon': LineAwesomeIcons.campground,
      'text': 'Camping',
      'url':
          'https://www.tripadvisor.com/Hotels-g2193232-c3-oa60-zff29-Amhara_Region-Hotels.html'
    },
    {
      'icon': LineAwesomeIcons.plane_departure,
      'text': 'Flights',
      'url': 'https://www.ethiopianairlines.com'
    },
    {
      'icon': LineAwesomeIcons.car,
      'text': 'Car Rentals',
      'url':
          'https://www.expedia.com/Destinations-In-Amhara-Region.d653928358259798016.Car-Rental-Destinations'
    },
    {
      'icon': LineAwesomeIcons.hotel,
      'text': 'Hotels',
      'url':
          'https://www.expedia.com/Destinations-In-Amhara-Region.d653928358259798016.Hotel-Destinations'
    },
    {
      'icon': LineAwesomeIcons.hiking,
      'text': 'Tour Guides',
      'url': 'https://www.getyourguide.com/amhara-region-l1094/'
    },
    {
      'icon': LineAwesomeIcons.ambulance,
      'text': 'Emergency Contacts',
      'url':
          'https://www.medpages.info/sf/index.php?page=listing&servicecode=77&countryid=&regioncode=363&subregioncode='
    },
  ];
}
