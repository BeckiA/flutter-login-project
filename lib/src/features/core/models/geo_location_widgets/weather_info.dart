import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../constants/colors.dart';
import '../../controllers/geo_location_controllers/weather_controller.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Map<String, dynamic> weatherData = {};

  @override
  void initState() {
    super.initState();
    // Get the arguments that were passed to this screen
    final args = Get.arguments as Map<String, dynamic>;

    // Access the values of the arguments using their keys
    final latitude = args['latitude'];
    final longitude = args['longitude'];

    _fetchWeatherData(latitude: latitude, longitude: longitude);
  }

  Future<void> _fetchWeatherData(
      {required double latitude, required double longitude}) async {
    final data = await WeatherController().fetchWeather(latitude, longitude);
    setState(() {
      weatherData = data;
    });
  }

  Widget build(BuildContext context) {
    Get.put(WeatherController());
    final args = Get.arguments as Map<String, dynamic>;
    final title = args['title'];
    final picture = args['picture'];
    final id = args['id'].toString();
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Center(
        child: Scaffold(
          body: weatherData.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(picture),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(25)),
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        title,
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${weatherData['main']['temp']} °C',
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${weatherData['weather'][0]['description']}',
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    LineAwesomeIcons.thermometer_1_2_full,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Temperature",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${weatherData['main']['temp']}°C',
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    LineAwesomeIcons.cloud_with_sun_and_rain,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Weather",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${weatherData['weather'][0]['description']}',
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.water_drop_outlined,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Humidity",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${weatherData['main']['humidity']}',
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    LineAwesomeIcons.wind,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Speed",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${weatherData['wind']['speed']}',
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
