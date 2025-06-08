import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const _apiKey = '';
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  static Future<Map<String, dynamic>?> fetchWeather(String city) async {
    final url = Uri.parse('$_baseUrl?q=$city&units=metric&appid=$_apiKey');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
