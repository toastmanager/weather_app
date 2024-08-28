import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/settings/data/datasources/local/default_settings.dart';
import 'package:weather_app/features/settings/data/datasources/local/preference_keys.dart';
import 'package:weather_app/features/settings/data/models/settings_model.dart';

abstract class SettingsLocalDatasource {
  Future<void> saveLanguageCode();
  Future<void> saveLongitude();
  Future<void> saveLatitude();
  // TODO: Add primary color in repository
  // void savePrimaryColor();
  Future<void> reset();

  Future<SettingsModel> get();
}

class SettingsLocalDatasourceImpl implements SettingsLocalDatasource {
  final SharedPreferences prefs;

  const SettingsLocalDatasourceImpl({required this.prefs});

  @override
  Future<SettingsModel> get() async {
    final String? longitude = prefs.getString(PreferenceKeys.longitude);
    final String? latitude = prefs.getString(PreferenceKeys.latitude);
    final String? languageCode = prefs.getString(PreferenceKeys.languageCode);

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
