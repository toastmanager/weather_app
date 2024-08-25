import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(WeatherFetchEvent());
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoadedState) {
                final currentWeather = state.weather.current;
                // final hourlyWeather = state.weather.hourly;
                // final dailyWeather = state.weather.daily;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Temperature: ${currentWeather.temp} °C'),
                    Text('Relative Humidity: ${currentWeather.relativeHumidity} mm'),
                    Text('Apparent Temp: ${currentWeather.apparentTemp} °C'),
                    Text('Last check: ${DateFormat.yMMMMEEEEd().add_jm().format(currentWeather.time)}'),
                    Text('Weather code: ${currentWeather.weatherCode}'),
                    Text('Wind speed: ${currentWeather.windSpeed} m/s'),
                  ],
                );
              }
              if (state is WeatherLoadingState) {
                return const CircularProgressIndicator();
              }
              if (state is WeatherFailedState) {
                return Text(state.message);
              }
              return const Text('Unexpected error');
            },
          )
        ],
      ),
    );
  }
}