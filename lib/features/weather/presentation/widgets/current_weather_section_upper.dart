import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/core/utils/weather_icon_mapper.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

class CurrentWeatherSectionUpper extends StatelessWidget {
  const CurrentWeatherSectionUpper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          final currentWeather = state.weather.current;
          final date = currentWeather.time;
          final temperature = currentWeather.temp.round();
          final weatherCode = currentWeather.weatherCode;
          return _currentWeatherSectionUpper(
              date, context, temperature, weatherCode);
        }

        if (state is WeatherLoadingState) {
          return Skeletonizer(
              child:
                  _currentWeatherSectionUpper(DateTime.now(), context, 21, 0));
        }

        return const Text('Unexpected Error');
      },
    );
  }

  Column _currentWeatherSectionUpper(
      DateTime date, BuildContext context, int temperature, int weatherCode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _actions(date, context),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: Center(
            child: SvgPicture.asset(
              WeatherIconMapper.getSvgFilePath(weatherCode),
              height: 200,
            ),
          ),
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

  Row _actions(DateTime date, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {}, icon: const Icon(TablerIcons.settings, size: 40)),
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
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: '${DateFormat.EEEE().format(date)} ',
                  style: Theme.of(context).textTheme.bodyMedium),
              TextSpan(
                  text: DateFormat.jm().format(date),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)
                  )),
            ])),
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
    );
  }
}
