import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/settings/data/datasources/local/default_settings.dart';
import 'package:weather_app/features/settings/data/datasources/local/preference_keys.dart';
import 'package:weather_app/features/settings/data/models/settings_model.dart';

abstract class SettingsLocalDatasources {
  Future<void> updateLanguageCode();
  Future<void> updateLongitude();
  Future<void> updateLatitude();
  // TODO: Add primary color in repository
  // void updatePrimaryColor();
  Future<void> reset();

  Future<SettingsModel> get();
}

class SettingsLocalDatasourcesImpl implements SettingsLocalDatasources {
  final SharedPreferences prefs;

  const SettingsLocalDatasourcesImpl({required this.prefs});

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
  Future<void> updateLanguageCode() async {
    // TODO: implement updateLanguageCode
  }

  @override
  Future<void> updateLatitude() async {
    // TODO: implement updateLatitude
  }

  @override
  Future<void> updateLongitude() async {
    // TODO: implement updateLongitude
  }

  @override
  Future<void> reset() {
    // TODO: implement reset
    throw UnimplementedError();
  }
}
