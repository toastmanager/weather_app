import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/routes/router.dart';
import 'package:weather_app/features/settings/settings_di.dart';
import 'package:weather_app/features/weather/weather_di.dart';

final locator = GetIt.instance;

Future<void> initDI() async {
  locator.registerLazySingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());
  await locator.isReady<SharedPreferences>();
  
  await settingsDIInit();

  locator.registerLazySingleton<AppRouter>(() => AppRouter());

  locator.registerLazySingleton<Dio>(() => Dio());

  await weatherDIInit();
}
