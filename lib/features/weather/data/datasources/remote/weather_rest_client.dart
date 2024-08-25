import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

part 'weather_rest_client.g.dart';

@RestApi(baseUrl: 'https://api.open-meteo.com/v1/')
abstract class WeatherRestClient {
  factory WeatherRestClient(Dio dio, {String baseUrl}) = _WeatherRestClient;

  @GET('/forecast?latitude={latitude}&longitude={longitude}&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m&hourly=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_probability_max&timeformat=unixtime')
  Future<WeatherModel> getWeather(
    @Path() double latitude,
    @Path() double longitude,
  );
}