import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherDetailsScreen extends StatelessWidget {
  final WeatherModel weatherModel;

  WeatherDetailsScreen({required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details 📋', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white.withOpacity(0.9),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location: ${weatherModel.cityName}, ${weatherModel.country}',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.thermostat_outlined, color: Colors.deepPurple),
                        SizedBox(width: 10),
                        Text(
                          'Temperature: ${weatherModel.temperature}°C',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.cloud, color: Colors.deepPurple),
                        SizedBox(width: 10),
                        Text(
                          'Weather: ${weatherModel.description}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.air, color: Colors.deepPurple),
                        SizedBox(width: 10),
                        Text(
                          'Wind Speed: ${weatherModel.windSpeed} m/s',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.water_drop, color: Colors.deepPurple),
                        SizedBox(width: 10),
                        Text(
                          'Humidity: ${weatherModel.humidity}%',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);  // Go back to previous screen
                      },
                      child: Text('Go Back ⬅️'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 166, 136, 218),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
