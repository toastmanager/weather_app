import 'package:weather_app/features/settings/domain/entities/settings.dart';
import 'package:weather_app/features/settings/domain/repositories/settings_repository.dart';

class GetSettings {
  final SettingsRepository repository;

  GetSettings({required this.repository});

  Settings execute() => repository.getSettings();
}