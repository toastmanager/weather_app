import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Weather extends Equatable {
  final CurrentWeather current;
  final HourlyWeather hourly;
  final DailyWeather daily;

  const Weather(
      {required this.current, required this.hourly, required this.daily});

  @override
  List<Object?> get props => [current, hourly, daily];
}

@immutable
class CurrentWeather extends Equatable {
  final DateTime time;
  final double temp;
  final double relativeHumidity;
  final double apparentTemp;
  final int weatherCode;
  final double windSpeed;

  const CurrentWeather(
      {required this.time,
      required this.temp,
      required this.relativeHumidity,
      required this.apparentTemp,
      required this.weatherCode,
      required this.windSpeed});

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
class HourlyWeather extends Equatable {
  final List<DateTime> time;
  final List<double> temp;
  final List<int> weatherCode;

  const HourlyWeather(
      {required this.time, required this.temp, required this.weatherCode});

  @override
  List<Object?> get props => [time, temp, weatherCode];
}

@immutable
class DailyWeather extends Equatable {
  final List<DateTime> time;
  final List<int> weatherCode;
  final List<double> tempMax;
  final List<double> tempMin;
  final List<int> precipitationProbability;

  const DailyWeather(
      {required this.time,
      required this.weatherCode,
      required this.tempMax,
      required this.tempMin,
      required this.precipitationProbability});

  @override
  List<Object?> get props => [
        time,
        weatherCode,
        tempMax,
        tempMin,
        precipitationProbability,
      ];
}
