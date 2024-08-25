import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';
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
                final dailyWeather = state.weather.daily;
                return CurrentWeatherSection(
                  apparentTemp: currentWeather.apparentTemp,
                  relativeHumidity: currentWeather.relativeHumidity,
                  windSpeed: currentWeather.windSpeed,
                  precipitationProbability:
                      dailyWeather.precipitationProbability[0],
                );
              }

              if (state is WeatherLoadingState) {
                return const Skeletonizer(
                  child: CurrentWeatherSection(
                    apparentTemp: 20.0,
                    relativeHumidity: 65.0,
                    windSpeed: 5.61,
                    precipitationProbability: 71,
                  ),
                );
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

class CurrentWeatherSection extends StatelessWidget {
  final double apparentTemp;
  final double relativeHumidity;
  final double windSpeed;
  final int precipitationProbability;

  const CurrentWeatherSection(
      {super.key,
      required this.apparentTemp,
      required this.relativeHumidity,
      required this.windSpeed,
      required this.precipitationProbability});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(TablerIcons.thermometer,
                color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 4),
            Text('Apparent Temp: $apparentTemp °C',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(TablerIcons.cloud_rain,
                color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 4),
            Text('Relative Humidity: $relativeHumidity mm',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(TablerIcons.wind,
                color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 4),
            Text('Wind speed: $windSpeed m/s',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(TablerIcons.droplet,
                color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 4),
            Text('Precipitation Probability: $precipitationProbability %',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}
