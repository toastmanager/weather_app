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
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationSettings(),
              SizedBox(height: 24),
              LanguageSettings(),
              SizedBox(height: 24),
              PrimaryColorSettings(),
            ],
          ),
        ),
      ),
    );
  }
}
