
import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_event.dart';
import 'weather_state.dart';
import '../services/weather_api_service.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherApiService weatherApiService;

  WeatherBloc({required this.weatherApiService}) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather = await weatherApiService.getWeather(event.location);
        if (weather != null) {
          emit(WeatherLoaded(weather));
        } else {
          emit(WeatherError('No data found'));
        }
      } catch (e) {
        emit(WeatherError('Error fetching weather data'));
      }
    });
  }
}
