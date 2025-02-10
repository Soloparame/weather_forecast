import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherApiService {
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherApiService({required this.apiKey});

  Future<WeatherModel?> getWeather(String location) async {
    final url = Uri.parse('$_baseUrl?q=$location&appid=$apiKey&units=metric');
    
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
