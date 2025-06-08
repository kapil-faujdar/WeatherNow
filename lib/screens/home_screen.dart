import 'package:flutter/material.dart';
import 'weather_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> cities = const ['Delhi', 'Mumbai', 'Bengaluru', 'Kolkata', 'Chennai'];

  @override
  Widget build(BuildContext context) {
    TextEditingController cityController = TextEditingController();
    String dropdownCity = cities.first;

    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: cityController,
              decoration: const InputDecoration(labelText: 'Enter City Name'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherScreen(city: cityController.text),
                  ),
                );
              },
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: dropdownCity,
              onChanged: (value) {
                if (value != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherScreen(city: value),
                    ),
                  );
                }
              },
              items: cities.map((city) => DropdownMenuItem(value: city, child: Text(city))).toList(),
            ),
            const SizedBox(height: 20),
            const Text('Tap on a city:'),
            Wrap(
              spacing: 10,
              children: cities.map((city) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeatherScreen(city: city),
                      ),
                    );
                  },
                  child: Text(city),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}