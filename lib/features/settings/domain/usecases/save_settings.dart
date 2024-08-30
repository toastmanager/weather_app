import 'package:weather_app/features/settings/domain/entities/settings.dart';
import 'package:weather_app/features/settings/domain/repositories/settings_repository.dart';

class SaveSettings {
  final SettingsRepository repository;

  SaveSettings({required this.repository});

  Future<void> execute(Settings settings) => repository.saveSettigns(settings);
}
