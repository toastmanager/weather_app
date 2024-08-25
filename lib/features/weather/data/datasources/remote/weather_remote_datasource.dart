import 'package:weather_app/features/weather/data/datasources/remote/weather_rest_client.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> get(double latitude, double longitude);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final WeatherRestClient client;

  const WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> get(double latitude, double longitude) async {
    try {
      return await client.getWeather(latitude, longitude);
    } catch (e) {
      rethrow;
    }
  }
}
