import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/pages/forecast_page.dart';
import 'package:weather_app/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.initDI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: Theme.of(context).textTheme.apply(
          fontSizeDelta: 2,
        )
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.locator<WeatherBloc>())
        ],
        child: const Scaffold(
          body: SafeArea(
            child: ForecastPage(),
          ),
        )
      )
    );
  }
}