import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

class CurrentWeatherBottomSectionBuilder extends StatelessWidget {
  const CurrentWeatherBottomSectionBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          final currentWeather = state.weather.current;
          final dailyWeather = state.weather.daily;
          return _currentWeatherSectionBottom(
            apparentTemp: currentWeather.apparentTemp,
            relativeHumidity: currentWeather.relativeHumidity,
            windSpeed: currentWeather.windSpeed,
            precipitationProbability: dailyWeather.precipitationProbability[0],
            context: context,
          );
        }

        if (state is WeatherLoadingState) {
          return Skeletonizer(
            child: _currentWeatherSectionBottom(
              apparentTemp: 20.0,
              relativeHumidity: 65.0,
              windSpeed: 5.61,
              precipitationProbability: 71,
              context: context,
            ),
          );
        }

        if (state is WeatherFailedState) {
          return Text(state.message);
        }

        return const Text('Unexpected error');
      },
    );
  }

  Widget _currentWeatherSectionBottom(
      {required BuildContext context,
      required double apparentTemp,
      required double relativeHumidity,
      required double windSpeed,
      required int precipitationProbability}) {
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
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(TablerIcons.cloud_rain,
                color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 4),
            Text('Relative Humidity: $relativeHumidity mm',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(TablerIcons.wind,
                color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 4),
            Text('Wind speed: $windSpeed m/s',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 8),
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
