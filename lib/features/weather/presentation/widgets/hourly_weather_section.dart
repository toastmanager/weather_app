import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

class HourlyWeatherSection extends StatelessWidget {
  const HourlyWeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          final hourly = state.weather.hourly;
          return SizedBox(
            height: 145,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 25,
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
                        Text(DateFormat.jm().format(hourly.time[index])),
                        Text('${hourly.temp[index]} °C'),
                        Text('Code: ${hourly.weatherCode[index]}')
                      ],
                    ),
                  );
                }),
          );
        }
        return const Text('Unexpected error');
      },
    );
  }
}
