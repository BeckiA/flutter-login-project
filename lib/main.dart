import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/features/core/controllers/atrractions_list.dart';
import 'package:login_app/src/features/core/itinerary/screens/note_add_screen.dart';
import 'package:login_app/src/features/core/itinerary/screens/note_edit_screen.dart';
import 'package:login_app/src/features/core/itinerary/screens/note_view_screen.dart';
import 'package:login_app/src/features/core/models/geo_location_widgets/comments.dart';
import 'package:login_app/src/features/core/models/geo_location_widgets/nearby_hotels.dart';
import 'package:login_app/src/features/core/models/geo_location_widgets/nearby_restaurants.dart';
import 'package:login_app/src/features/core/models/geo_location_widgets/nearby_shop.dart';
import 'package:login_app/src/features/core/models/geo_location_widgets/travel_guide.dart';
import 'package:login_app/src/features/core/models/geo_location_widgets/weather_info.dart';
import 'package:login_app/src/features/core/screens/attraction_sites/attraction_detail_screen.dart';
import 'package:login_app/src/utils/themes/app_theme_controller.dart';
import '/src/repository/authentication_repository/authentication_repository.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import '../src/utils/themes/themes.dart';
import 'src/features/authentication/screens/on_boarding_screen/on_boarding_screen.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', 'High Importance Notifications',
    description: "This channel is used for important notifications",
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }

  print("A message just showed up: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  // Get.put(AttractionList());
  // Initalizing theme
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Initalizing Fetch Attractions
    Get.put(AttractionList());
    AttractionList.instance.fetchAttractions();

    // Firebase Messgaing
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    color: VALTextColor,
                    playSound: true,
                    icon: '@drawable/splash')));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpendApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title as String),
                content: SingleChildScrollView(
                  child: Column(),
                ),
              );
            });
      }
    });
  }

  void showNotification() {
    flutterLocalNotificationsPlugin.show(
        0,
        'Test',
        'Sup everybody',
        NotificationDetails(
            android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: Importance.high,
          color: VAPrimaryColor,
          playSound: true,
          icon: '@drawable/splash',
        )));
  }

  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: VAAppTheme.lightTheme,
      darkTheme: VAAppTheme.darkTheme,
      themeMode:
          themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
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
