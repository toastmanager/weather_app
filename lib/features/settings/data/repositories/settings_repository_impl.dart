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
  Future<void> updateLanguageCode() {
    // TODO: implement updateLanguageCode
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateLatitude() {
    // TODO: implement updateLatitude
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateLongitude() {
    // TODO: implement updateLongitude
    throw UnimplementedError();
  }
}