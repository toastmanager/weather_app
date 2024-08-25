import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class FetchWeather {
  final WeatherRepository repository;

  FetchWeather({required this.repository});

  Future<Weather> execute() => repository.fetchWeather();
}