import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/settings/data/datasources/local/default_settings.dart';
import 'package:weather_app/features/settings/data/datasources/local/settings_preference_keys.dart';
import 'package:weather_app/features/settings/data/models/settings_model.dart';

abstract class SettingsLocalDataSource {
  Future<void> saveLanguageCode();
  Future<void> saveLongitude();
  Future<void> saveLatitude();
  // TODO: Add primary color in repository
  // void savePrimaryColor();
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
  Future<void> saveLanguageCode() async {
    // TODO: implement updateLanguageCode
  }

  @override
  Future<void> saveLatitude() async {
    // TODO: implement updateLatitude
  }

  @override
  Future<void> saveLongitude() async {
    // TODO: implement updateLongitude
  }

  @override
  Future<void> reset() {
    // TODO: implement reset
    throw UnimplementedError();
  }
}
