import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/utils/date_serialization.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

part 'weather_model.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class WeatherModel extends Equatable {
  final CurrentWeatherModel current;
  final HourlyWeatherModel hourly;
  final DailyWeatherModel daily;

  const WeatherModel(
      {required this.current, required this.hourly, required this.daily});

  // Entity
  Weather toEntity() {
    return Weather(
        current: current.toEntity(),
        hourly: hourly.toEntity(),
        daily: daily.toEntity());
  }

  factory WeatherModel.fromEntity(Weather entity) {
    return WeatherModel(
        current: CurrentWeatherModel.fromEntity(entity.current),
        hourly: HourlyWeatherModel.fromEntity(entity.hourly),
        daily: DailyWeatherModel.fromEntity(entity.daily));
  }

  // Json
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}

@immutable
@JsonSerializable()
class CurrentWeatherModel extends Equatable {
  @JsonKey(
    toJson: DateSerialization.toJson,
    fromJson: DateSerialization.fromJson,
  )
  final DateTime time;
  @JsonKey(name: 'temperature_2m')
  final double temp;
  @JsonKey(name: 'relative_humidity_2m')
  final double relativeHumidity;
  @JsonKey(name: 'apparent_temperature')
  final double apparentTemp;
  @JsonKey(name: 'weather_code')
  final int weatherCode;
  @JsonKey(name: 'wind_speed_10m')
  final double windSpeed;

  const CurrentWeatherModel(
      {required this.time,
      required this.temp,
      required this.relativeHumidity,
      required this.apparentTemp,
      required this.weatherCode,
      required this.windSpeed});

  // Entity
  CurrentWeather toEntity() {
    return CurrentWeather(
        time: time,
        temp: temp,
        relativeHumidity: relativeHumidity,
        apparentTemp: apparentTemp,
        weatherCode: weatherCode,
        windSpeed: windSpeed);
  }

  factory CurrentWeatherModel.fromEntity(CurrentWeather entity) {
    return CurrentWeatherModel(
        time: entity.time,
        temp: entity.temp,
        relativeHumidity: entity.relativeHumidity,
        apparentTemp: entity.apparentTemp,
        weatherCode: entity.weatherCode,
        windSpeed: entity.windSpeed);
  }

  // Json
  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);

  @override
  List<Object?> get props => [
        time,
        temp,
        relativeHumidity,
        apparentTemp,
        weatherCode,
        windSpeed,
      ];
}

@immutable
@JsonSerializable()
class HourlyWeatherModel extends Equatable {
  @JsonKey(
    toJson: DateSerialization.listToJson,
    fromJson: DateSerialization.listFromJson,
  )
  final List<DateTime> time;
  @JsonKey(name: 'temperature_2m')
  final List<double> temp;
  @JsonKey(name: 'weather_code')
  final List<int> weatherCode;

  const HourlyWeatherModel(
      {required this.time, required this.temp, required this.weatherCode});

  // Entity
  HourlyWeather toEntity() {
    return HourlyWeather(time: time, temp: temp, weatherCode: weatherCode);
  }

  factory HourlyWeatherModel.fromEntity(HourlyWeather entity) {
    return HourlyWeatherModel(
        time: entity.time, temp: entity.temp, weatherCode: entity.weatherCode);
  }

  // Json
  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$HourlyWeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyWeatherModelToJson(this);

  @override
  List<Object?> get props => [time, temp, weatherCode];
}

@immutable
@JsonSerializable()
class DailyWeatherModel extends Equatable {
  @JsonKey(
    toJson: DateSerialization.listToJson,
    fromJson: DateSerialization.listFromJson,
  )
  final List<DateTime> time;
  @JsonKey(name: 'weather_code')
  final List<int> weatherCode;
  @JsonKey(name: 'temperature_2m_max')
  final List<double> tempMax;
  @JsonKey(name: 'temperature_2m_min')
  final List<double> tempMin;
  @JsonKey(name: 'precipitation_probability_max')
  final List<int> precipitationProbability;

  const DailyWeatherModel(
      {required this.time,
      required this.weatherCode,
      required this.tempMax,
      required this.tempMin,
      required this.precipitationProbability});

  // Entity
  DailyWeather toEntity() {
    return DailyWeather(
      time: time,
      weatherCode: weatherCode,
      tempMax: tempMax,
      tempMin: tempMin,
      precipitationProbability: precipitationProbability,
    );
  }

  factory DailyWeatherModel.fromEntity(DailyWeather entity) {
    return DailyWeatherModel(
      time: entity.time,
      weatherCode: entity.weatherCode,
      tempMax: entity.tempMax,
      tempMin: entity.tempMin,
      precipitationProbability: entity.precipitationProbability,
    );
  }

  // Json
  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$DailyWeatherModelToJson(this);

  @override
  List<Object?> get props => [
        time,
        weatherCode,
        tempMax,
        tempMin,
        precipitationProbability,
      ];
}
