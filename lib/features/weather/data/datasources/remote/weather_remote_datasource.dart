import 'package:weather_app/features/settings/data/datasources/local/settings_local_datasource.dart';
import 'package:weather_app/features/settings/data/models/settings_model.dart';
import 'package:weather_app/features/weather/data/datasources/remote/weather_rest_client.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> get();
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final WeatherRestClient client;
  final SettingsLocalDataSource settingsLocalDataSource;

  const WeatherRemoteDataSourceImpl(
      {required this.client, required this.settingsLocalDataSource});

  @override
  Future<WeatherModel> get() async {
    try {
      final SettingsModel settings = settingsLocalDataSource.get();
      return await client.getWeather(settings.latitude, settings.longitude);
    } catch (e) {
      rethrow;
    }
  }
}
