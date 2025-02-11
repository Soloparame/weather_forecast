import 'package:flutter/material.dart';
import 'dart:async'; 

import 'weather_screen.dart';  

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Start a 3 second timer to navigate to WeatherScreen
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WeatherScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Weather icon
            Icon(
              Icons.wb_sunny,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            // App name
            Text(
              'Weather Forecast',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
