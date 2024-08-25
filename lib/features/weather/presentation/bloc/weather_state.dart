part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadedState extends WeatherState {
  final Weather weather;

  const WeatherLoadedState({required this.weather});
}

final class WeatherLoadingState extends WeatherState {}

final class WeatherFailedState extends WeatherState {
  final String message;

  const WeatherFailedState({required this.message});
}
