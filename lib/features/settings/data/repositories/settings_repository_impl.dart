import 'package:weather_app/features/settings/data/datasources/local/settings_local_datasource.dart';
import 'package:weather_app/features/settings/domain/entities/settings.dart';
import 'package:weather_app/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  final SettingsLocalDataSource settingsLocalDataSource;

  SettingsRepositoryImpl({required this.settingsLocalDataSource});

  @override
  Settings getSettings() {
    return settingsLocalDataSource.get().toEntity();
  }
  
  @override
  Future<void> resetSettings() {
    return settingsLocalDataSource.reset();
  }
  
  @override
  Future<void> saveSettigns() {
    throw UnimplementedError();
  }
}