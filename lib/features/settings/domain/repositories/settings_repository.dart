import 'package:weather_app/features/settings/domain/entities/settings.dart';

abstract class SettingsRepository {
  Future<void> saveSettigns();
  Future<void> resetSettings();
  Settings getSettings();
}