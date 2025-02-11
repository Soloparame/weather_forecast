import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_state.dart';
import '../bloc/weather_event.dart';
import 'weather_details_screen.dart';  

class WeatherScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast 🌤️', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        elevation: 8,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Stylish TextField for location input
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter Location 📍',
                hintText: 'e.g., London',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.location_city, color: Colors.deepPurple),
                filled: true,
                fillColor: Colors.white.withOpacity(0.8),
                labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            // Get Weather Button
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  BlocProvider.of<WeatherBloc>(context).add(FetchWeather(_controller.text));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a location')),
                  );
                }
              },
              child: Text('Get Weather 📅'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 177, 146, 232),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 8,
              ),
            ),
            SizedBox(height: 30),
            // BlocBuilder to listen to weather state
            Expanded( // Wrap this part in Expanded to avoid overflow issues
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is WeatherLoaded) {
                    final weatherModel = state.weatherModel;
                    return GestureDetector(
                      onTap: () {
                        // Navigate to WeatherDetailsScreen when tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherDetailsScreen(weatherModel: weatherModel),
                          ),
                        );
                      },
                      child: ListView(
                        shrinkWrap: true, 
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            leading: Icon(Icons.location_on, color: Colors.deepPurple, size: 30),
                            title: Text(
                              '${weatherModel.cityName}, ${weatherModel.country}',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.thermostat_outlined, color: Colors.deepPurple),
                            title: Text(
                              'Temperature: ${weatherModel.temperature}°C',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.cloud, color: Colors.deepPurple),
                            title: Text(
                              'Weather: ${weatherModel.description}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.air, color: Colors.deepPurple),
                            title: Text(
                              'Wind Speed: ${weatherModel.windSpeed} m/s',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Navigate to WeatherDetailsScreen when tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WeatherDetailsScreen(weatherModel: weatherModel),
                                ),
                              );
                            },
                            child: Text('See More Details 🧐'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 176, 145, 230),
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 8,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is WeatherError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return Container(); // Default state (initial)
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

