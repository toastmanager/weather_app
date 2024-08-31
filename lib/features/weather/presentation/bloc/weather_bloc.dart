import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/usecases/weather_usecases.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final FetchWeather fetchWeather;

  WeatherBloc(this.fetchWeather) : super(WeatherInitial()) {
    on<WeatherFetchEvent>(_fetchWeather);
  }

  Future<void> _fetchWeather(WeatherFetchEvent event, Emitter emit) async {
    emit(WeatherLoadingState());
    try {
      final weather = await fetchWeather.execute();
      emit(WeatherLoadedState(weather: weather));
    } catch (e) {
      emit(const WeatherFailedState(message: 'Failed to fetch weather'));
      rethrow;
    }
  }
}
