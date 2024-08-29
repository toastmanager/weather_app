import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/settings/data/datasources/local/settings_local_datasource.dart';
import 'package:weather_app/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:weather_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:weather_app/features/settings/domain/usecases/get_settings.dart';
import 'package:weather_app/features/settings/domain/usecases/reset_settings.dart';
import 'package:weather_app/features/settings/domain/usecases/save_settings.dart';
import 'package:weather_app/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:weather_app/injection.dart';

Future<void> settingsDIInit() async {
  locator.registerFactory<SettingsBloc>(
      () => SettingsBloc(locator<GetSettings>(), locator<SaveSettings>(), locator<ResetSettings>()));

  locator.registerLazySingleton<GetSettings>(
      () => GetSettings(repository: locator<SettingsRepository>()));
  locator.registerLazySingleton<ResetSettings>(
      () => ResetSettings(repository: locator<SettingsRepository>()));
  locator.registerLazySingleton<SaveSettings>(
      () => SaveSettings(repository: locator<SettingsRepository>()));

  locator.registerLazySingleton<SettingsRepository>(() =>
      SettingsRepositoryImpl(
          settingsLocalDataSource: locator<SettingsLocalDataSource>()));

  locator.registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDatasourceImpl(prefs: locator<SharedPreferences>()));
}
