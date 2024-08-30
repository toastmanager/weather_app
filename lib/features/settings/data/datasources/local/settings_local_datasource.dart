import 'package:objectbox/objectbox.dart';
import 'package:weather_app/features/settings/data/datasources/local/default_settings.dart';
import 'package:weather_app/features/settings/data/models/settings_model.dart';
import 'package:weather_app/objectbox.dart';

abstract class SettingsLocalDataSource {
  void save(SettingsModel settings);
  void reset();
  SettingsModel get();
}

class SettingsLocalDatasourceImpl implements SettingsLocalDataSource {
  final ObjectBox objectBox;
  final Box<SettingsModel> settingsBox;

  const SettingsLocalDatasourceImpl({required this.objectBox, required this.settingsBox});

  @override
  SettingsModel get() {
    SettingsModel? settings = settingsBox.get(1);
    settings ??= settingsBox.get(settingsBox.put(defaultSettings));

    return settings!;
  }

  @override
  void reset() async {
    settingsBox.put(defaultSettings);
  }
  
  @override
  void save(SettingsModel settings) async {
    settingsBox.put(settings);
  }
}
