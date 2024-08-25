import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather/weather_di.dart';

final locator = GetIt.instance;

Future<void> initDI() async {
  locator.registerLazySingleton<Dio>(
    () => Dio(),
  );

  await weatherDIInit();
}