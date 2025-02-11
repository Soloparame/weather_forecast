
class WeatherModel {
  final String cityName;
  final String country;
  final String description;
  final double temperature;
  final int humidity;
  final double windSpeed;

  WeatherModel({
    required this.cityName,
    required this.country,
    required this.description,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'], // Name of the city
      country: json['sys']['country'], // Country code
      description: json['weather'][0]['description'], // Weather description
      temperature: json['main']['temp'].toDouble(), // Temperature
      humidity: json['main']['humidity'], // Humidity
      windSpeed: json['wind']['speed'].toDouble(), // Wind speed
    );
  }
}
