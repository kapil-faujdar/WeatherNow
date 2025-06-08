import 'package:flutter/material.dart';
import '../services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  final String city;
  const WeatherScreen({super.key, required this.city});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Map<String, dynamic>? weatherData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWeather(widget.city);
  }

  void fetchWeather(String city) async {
    final data = await WeatherService.fetchWeather(city);
    setState(() {
      weatherData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.city)),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : weatherData == null
              ? const Center(child: Text('Failed to fetch weather'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Temperature: ${weatherData!['main']['temp']} °C', style: const TextStyle(fontSize: 24)),
                      Text('Condition: ${weatherData!['weather'][0]['main']}', style: const TextStyle(fontSize: 24)),
                      Text('Humidity: ${weatherData!['main']['humidity']}%', style: const TextStyle(fontSize: 24)),
                      Text('Wind Speed: ${weatherData!['wind']['speed']} m/s', style: const TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
    );
  }
}
