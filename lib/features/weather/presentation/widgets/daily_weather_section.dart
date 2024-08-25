import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

class DailyWeatherSection extends StatelessWidget {
  const DailyWeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          final daily = state.weather.daily;
          return _dailyWeatherSection(daily);
        }
        if (state is WeatherLoadingState) {
          return Skeletonizer(
            child: _dailyWeatherSection(DailyWeather(
                time: List.generate(7, (index) => DateTime(2024)),
                tempMax: List.generate(7, (index) => 1),
                tempMin: List.generate(7, (index) => 1),
                precipitationProbability: List.generate(7, (index) => 1),
                weatherCode: List.generate(7, (index) => 1))),
          );
        }
        return const Text('Unexpected error');
      },
    );
  }

  SizedBox _dailyWeatherSection(DailyWeather daily) {
    return SizedBox(
      height: 145,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: daily.time.length,
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12)),
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(DateFormat.E().format(daily.time[index]),
                      style: Theme.of(context).textTheme.bodyMedium),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: '${daily.tempMax[index].round()}°C ',
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextSpan(
                          text: '${daily.tempMin[index].round()}°C',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.6)))
                    ]),
                  ),
                  Text('Code: ${daily.weatherCode[index]}')
                ],
              ),
            );
          }),
    );
  }
}
