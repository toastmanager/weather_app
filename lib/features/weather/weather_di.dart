import 'package:weather_app/features/weather/data/datasources/remote/weather_remote_datasource.dart';
import 'package:weather_app/features/weather/data/datasources/remote/weather_rest_client.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/weather_usecases.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/injection.dart';

Future<void> weatherDIInit() async {
  locator.registerFactory(() => WeatherBloc(locator<FetchWeather>()));

  locator.registerLazySingleton(() => FetchWeather(repository: locator()));

  locator.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(
      weatherRemoteDataSource: locator()));

  locator.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(client: locator())
  );

  locator.registerLazySingleton<WeatherRestClient>(
    () => WeatherRestClient(locator()),
  );
}
