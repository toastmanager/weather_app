import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/settings/data/datasources/local/default_settings.dart';
import 'package:weather_app/features/settings/data/datasources/local/settings_preference_keys.dart';
import 'package:weather_app/features/settings/data/models/settings_model.dart';

abstract class SettingsLocalDataSource {
  Future<void> save(SettingsModel settings);
  Future<void> reset();
  SettingsModel get();
}

class SettingsLocalDatasourceImpl implements SettingsLocalDataSource {
  final SharedPreferences prefs;

  const SettingsLocalDatasourceImpl({required this.prefs});

  @override
  SettingsModel get() {
    final String? longitude = prefs.getString(SettingsPreferenceKeys.longitude);
    final String? latitude = prefs.getString(SettingsPreferenceKeys.latitude);
    final String? languageCode = prefs.getString(SettingsPreferenceKeys.languageCode);

    if (longitude == null || latitude == null || languageCode == null) {
      return defaultSettings;
    }

    return SettingsModel(
        longitude: double.parse(longitude),
        latitude: double.parse(latitude),
        languageCode: languageCode);
  }

  @override
  Future<void> reset() async {
    _save(defaultSettings);
  }
  
  @override
  Future<void> save(SettingsModel settings) async {
    _save(settings);
  }

  Future<void> _save(SettingsModel settings) async {
    await prefs.setString(SettingsPreferenceKeys.longitude, settings.longitude.toString());
    await prefs.setString(SettingsPreferenceKeys.latitude, settings.latitude.toString());
    await prefs.setString(SettingsPreferenceKeys.languageCode, settings.languageCode);
  }
}
