import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherController {
  Future<Map<String, dynamic>> fetchWeather(
      double latitude, double longitude) async {
    final apiKey = 'b5f06a9cb49661c1596444568c2007e6';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("I can't");
      throw Exception('Failed to fetch weather data');
    }
  }
}
