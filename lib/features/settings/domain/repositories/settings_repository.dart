import 'package:weather_app/features/settings/domain/entities/settings.dart';

abstract class SettingsRepository {
  void saveSettigns(Settings settings);
  void resetSettings();
  Settings getSettings();
}