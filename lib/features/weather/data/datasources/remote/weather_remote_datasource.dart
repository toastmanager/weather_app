import 'package:objectbox/objectbox.dart';
import 'package:weather_app/features/settings/data/datasources/local/default_settings.dart';
import 'package:weather_app/features/settings/data/models/settings_model.dart';
import 'package:weather_app/features/weather/data/datasources/remote/weather_rest_client.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/injection.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> get();
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final WeatherRestClient client;

  const WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> get() async {
    try {
      final SettingsModel settings = locator<Box<SettingsModel>>().get(1) ?? defaultSettings;
      return await client.getWeather(settings.latitude, settings.longitude);
    } catch (e) {
      rethrow;
    }
  }
}
