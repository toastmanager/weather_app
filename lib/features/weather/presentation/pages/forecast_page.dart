import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/widgets/hourly_weather_section.dart';
import '../widgets/current_weather_section_bottom.dart';
import '../widgets/current_weather_section_upper.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(WeatherFetchEvent());
    return const Padding(
      padding: EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrentWeatherSectionUpper(),
            SizedBox(height: 24),
            Divider(),
            SizedBox(height: 24),
            CurrentWeatherSectionBottom(),
            SizedBox(height: 24),
            HourlyWeatherSection()
          ],
        ),
      ),
    );
  }
}
