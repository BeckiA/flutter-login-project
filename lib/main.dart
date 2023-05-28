import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/core/controllers/atrractions_list.dart';
import 'package:login_app/src/features/core/controllers/attraction.dart';
import 'package:login_app/src/features/core/itinerary/screens/note_add_screen.dart';
import 'package:login_app/src/features/core/itinerary/screens/note_edit_screen.dart';
import 'package:login_app/src/features/core/itinerary/screens/note_view_screen.dart';
import 'package:login_app/src/features/core/models/dashboard_header_widgets/dashboard_profile/dashboard_profile.dart';
import 'package:login_app/src/features/core/models/map_widgets/comments.dart';
import 'package:login_app/src/features/core/models/map_widgets/nearby_hotels.dart';
import 'package:login_app/src/features/core/models/map_widgets/nearby_restaurants.dart';
import 'package:login_app/src/features/core/models/map_widgets/nearby_shop.dart';
import 'package:login_app/src/features/core/models/map_widgets/travel_guide.dart';
import 'package:login_app/src/features/core/models/map_widgets/weather_info.dart';
import 'package:login_app/src/features/core/screens/attraction_sites/attraction_detail_screen.dart';
import '/src/features/core/screens/attraction_sites/attraction_screen.dart';
import '/src/features/core/screens/main_screen.dart';
import '/src/repository/authentication_repository/authentication_repository.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import '../src/utils/themes/themes.dart';
import 'src/features/authentication/screens/on_boarding_screen/on_boarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  // Get.put(AttractionList());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: VAAppTheme.lightTheme,
      darkTheme: VAAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      getPages: [
        GetPage(
          name: '/',
          page: () => OnBoardingScreen(),
        ),
        GetPage(
          name: '/attraction-detail',
          page: () => AttractionDetailScreen(),
        ),
        GetPage(name: '/travel-guide-screen', page: () => TravelGuide()),
        GetPage(
          name: '/nearby-hotel-screen',
          page: () => NearbyHotels(),
        ),
        GetPage(
          name: '/nearby-restaurant-screen',
          page: () => NearbyRestaurants(),
        ),
        GetPage(
          name: '/comment-screen',
          page: () => Comments(),
        ),
        GetPage(
          name: '/nearby-shops-screen',
          page: () => NearbyShops(),
        ),
        GetPage(
          name: '/weather-forecast-screen',
          page: () => WeatherScreen(),
        ),
        GetPage(
          name: '/note-view',
          page: () => NoteViewScreen(),
        ),
        GetPage(
          name: '/note-add',
          page: () => NoteAddScreen(),
        ),
        GetPage(
          name: '/note-edit',
          page: () => NoteEditScreen(),
        )
      ],
    );
  }
}
