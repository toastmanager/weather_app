import 'package:weather_app/features/settings/domain/entities/settings.dart';

abstract class SettingsRepository {
  Future<void> saveSettigns(Settings settings);
  Future<void> resetSettings();
  Settings getSettings();
}