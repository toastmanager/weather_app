// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      current:
          CurrentWeatherModel.fromJson(json['current'] as Map<String, dynamic>),
      hourly:
          HourlyWeatherModel.fromJson(json['hourly'] as Map<String, dynamic>),
      daily: DailyWeatherModel.fromJson(json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'current': instance.current.toJson(),
      'hourly': instance.hourly.toJson(),
      'daily': instance.daily.toJson(),
    };

CurrentWeatherModel _$CurrentWeatherModelFromJson(Map<String, dynamic> json) =>
    CurrentWeatherModel(
      time: DateSerialization.fromJson((json['time'] as num).toInt()),
      temp: (json['temperature_2m'] as num).toDouble(),
      relativeHumidity: (json['relative_humidity_2m'] as num).toDouble(),
      apparentTemp: (json['apparent_temperature'] as num).toDouble(),
      weatherCode: (json['weather_code'] as num).toInt(),
      windSpeed: (json['wind_speed_10m'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentWeatherModelToJson(
        CurrentWeatherModel instance) =>
    <String, dynamic>{
      'time': DateSerialization.toJson(instance.time),
      'temperature_2m': instance.temp,
      'relative_humidity_2m': instance.relativeHumidity,
      'apparent_temperature': instance.apparentTemp,
      'weather_code': instance.weatherCode,
      'wind_speed_10m': instance.windSpeed,
    };

HourlyWeatherModel _$HourlyWeatherModelFromJson(Map<String, dynamic> json) =>
    HourlyWeatherModel(
      time: DateSerialization.listFromJson(json['time'] as List),
      temp: (json['temperature_2m'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      weatherCode: (json['weather_code'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$HourlyWeatherModelToJson(HourlyWeatherModel instance) =>
    <String, dynamic>{
      'time': DateSerialization.listToJson(instance.time),
      'temperature_2m': instance.temp,
      'weather_code': instance.weatherCode,
    };

DailyWeatherModel _$DailyWeatherModelFromJson(Map<String, dynamic> json) =>
    DailyWeatherModel(
      time: DateSerialization.listFromJson(json['time'] as List),
      weatherCode: (json['weather_code'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      tempMax: (json['temperature_2m_max'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      tempMin: (json['temperature_2m_min'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      precipitationProbability:
          (json['precipitation_probability_max'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
    );

Map<String, dynamic> _$DailyWeatherModelToJson(DailyWeatherModel instance) =>
    <String, dynamic>{
      'time': DateSerialization.listToJson(instance.time),
      'weather_code': instance.weatherCode,
      'temperature_2m_max': instance.tempMax,
      'temperature_2m_min': instance.tempMin,
      'precipitation_probability_max': instance.precipitationProbability,
    };
