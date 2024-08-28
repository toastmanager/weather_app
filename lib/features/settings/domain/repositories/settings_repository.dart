import 'package:weather_app/features/settings/domain/entities/settings.dart';

abstract class SettingsRepository {
  void updateLanguageCode();
  void updateLongitude();
  void updateLatitude();
  // TODO: Add primary color in repository
  // void updatePrimaryColor();

  Future<Settings> getSettings();
}