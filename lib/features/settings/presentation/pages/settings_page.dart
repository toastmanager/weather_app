import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:weather_app/features/settings/presentation/widgets/language_settings.dart';
import 'package:weather_app/features/settings/presentation/widgets/location_settings.dart';
import 'package:weather_app/features/settings/presentation/widgets/primary_color_settings.dart';
import 'package:weather_app/injection.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<SettingsBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: SettingsPageActions(),
        ),
        // floatingActionButton: const Expanded(child: ),
        body: Builder(builder: (context) {
          context.read<SettingsBloc>().add(SettingsGetEvent());
          return const Padding(
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
          );
        }),
      ),
    );
  }
}

class SettingsPageActions extends StatelessWidget {
  const SettingsPageActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: FilledButton(
                onPressed: () =>
                    locator<SettingsBloc>().add(SettingsResetEvent()),
                child: const Text('Save'))),
        const SizedBox(width: 24),
        Expanded(
            child:
                OutlinedButton(onPressed: () {}, child: const Text('Reset'))),
      ],
    );
  }
}
