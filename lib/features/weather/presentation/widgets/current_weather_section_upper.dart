import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

class CurrentWeatherSectionUpper extends StatelessWidget {
  const CurrentWeatherSectionUpper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          final date = state.weather.current.time;
          final temperature = state.weather.current.temp.round();
          return _currentWeatherSectionUpper(date, context, temperature);
        }

        if (state is WeatherLoadingState) {
          return Skeletonizer(
              child: _currentWeatherSectionUpper(DateTime.now(), context, 21));
        }

        return const Text('Unexpected Error');
      },
    );
  }

  Column _currentWeatherSectionUpper(
      DateTime date, BuildContext context, int temperature) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMd().format(date),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(DateFormat.EEEE().add_jm().format(date)),
              ],
            ),
            IconButton(
                onPressed: () =>
                    context.read<WeatherBloc>().add(WeatherFetchEvent()),
                icon: const Icon(
                  TablerIcons.reload,
                  size: 40,
                ))
          ],
        ),
        const SizedBox(height: 16),
        const SizedBox(
          height: 200,
        ),
        const SizedBox(height: 16),
        Text('$temperature°C',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
