import 'package:objectbox/objectbox.dart';
import 'package:weather_app/features/settings/data/datasources/local/settings_local_datasource.dart';
import 'package:weather_app/features/settings/data/models/settings_model.dart';
import 'package:weather_app/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:weather_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:weather_app/features/settings/domain/usecases/get_settings.dart';
import 'package:weather_app/features/settings/domain/usecases/reset_settings.dart';
import 'package:weather_app/features/settings/domain/usecases/save_settings.dart';
import 'package:weather_app/features/settings/presentation/blocs/settings/settings_bloc.dart';
import 'package:weather_app/injection.dart';
import 'package:weather_app/objectbox.dart';

Future<void> settingsDIInit() async {
  locator.registerFactory<SettingsBloc>(() => SettingsBloc(
      getSettings: locator<GetSettings>(),
      saveSettings: locator<SaveSettings>(),
      resetSettings: locator<ResetSettings>()));

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
      () => SettingsLocalDatasourceImpl(objectBox: locator<ObjectBox>(), settingsBox: locator<Box<SettingsModel>>()));

  locator.registerLazySingleton(() => locator<ObjectBox>().store.box<SettingsModel>());
}
