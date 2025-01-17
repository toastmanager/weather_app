import 'package:weather_app/features/settings/domain/repositories/settings_repository.dart';

class ResetSettings {
  final SettingsRepository repository;

  ResetSettings({required this.repository});

  void execute() => repository.resetSettings();
}