import 'package:weather_app/features/settings/data/models/settings_model.dart';

abstract class SettingsLocalDatasources {
  void updateLanguageCode();
  void updateLongitude();
  void updateLatitude();
  // TODO: Add primary color in repository
  // void updatePrimaryColor();

  Future<SettingsModel> get();
}