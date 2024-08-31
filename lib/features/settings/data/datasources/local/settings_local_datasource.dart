import 'dart:convert';
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
    String? settingsJson = prefs.getString(SettingsPreferenceKeys.settings);
    if (settingsJson == null) {
      reset();
      settingsJson = jsonEncode(defaultSettings);
    }
    return SettingsModel.fromJson(jsonDecode(settingsJson));
  }

  @override
  Future<void> reset() async {
    await save(defaultSettings);
  }

  @override
  Future<void> save(SettingsModel settings) async {
    await prefs.setString(
        SettingsPreferenceKeys.settings, jsonEncode(settings.toJson()));
  }
}
