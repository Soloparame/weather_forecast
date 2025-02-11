import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'bloc/weather_bloc.dart';
import 'services/weather_api_service.dart';
import 'screens/landing_page.dart';  

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => WeatherApiService(apiKey: 'ef593a55e0e58d00f4fa04a498e42116'),  // Replace with your actual API key
        ),
        BlocProvider(
          create: (context) => WeatherBloc(weatherApiService: context.read<WeatherApiService>()),
        ),
      ],
      child: MaterialApp(
        title: 'Weather Forecast App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LandingPage(),  // Set the LandingPage as the initial screen
      ),
    );
  }
}
