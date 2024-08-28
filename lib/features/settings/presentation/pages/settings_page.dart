import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/settings/presentation/widgets/language_settings.dart';
import 'package:weather_app/features/settings/presentation/widgets/location_settings.dart';
import 'package:weather_app/features/settings/presentation/widgets/primary_color_settings.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            LocationSettings(),
            LanguageSettings(),
            PrimaryColorSettings(),
          ],
        ),
      ),
    );
  }
}
