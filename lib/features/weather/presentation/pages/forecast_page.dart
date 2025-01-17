import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/widgets/daily_hourly_section.dart';
import 'package:weather_app/injection.dart';
import '../widgets/current_weather_section_bottom.dart';
import '../widgets/current_weather_section_upper.dart';

@RoutePage()
class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<WeatherBloc>(),
      child: Builder(builder: (context) {
        context.read<WeatherBloc>().add(WeatherFetchEvent());
        return const Scaffold(
          body: Padding(
            padding: EdgeInsets.all(24),
            child: Center(
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
                    DailyHourlySection()
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
