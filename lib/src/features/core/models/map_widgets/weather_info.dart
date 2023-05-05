import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/map_controllers/weather_controller.dart';

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
    final args = Get.arguments;

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

    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Center(
        child: weatherData.isEmpty
            ? const CircularProgressIndicator()
            : Text('${weatherData['main']['temp']}°F'),
      ),
    );
  }
}
