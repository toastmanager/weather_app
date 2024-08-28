import 'package:weather_app/features/settings/domain/entities/settings.dart';

abstract class SettingsRepository {
  Future<void> updateLanguageCode();
  Future<void> updateLongitude();
  Future<void> updateLatitude();
  // TODO: Add primary color in repository
  // void updatePrimaryColor();

  Settings getSettings();
}