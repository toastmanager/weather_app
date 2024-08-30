import 'package:weather_app/features/weather/data/datasources/remote/weather_remote_datasource.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;

  const WeatherRepositoryImpl(
      {required this.weatherRemoteDataSource});

  @override
  Future<Weather> fetchWeather() async {
    try {
      final WeatherModel weatherModel =
          await weatherRemoteDataSource.get();
      return weatherModel.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
