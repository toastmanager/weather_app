import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/settings/presentation/blocs/settings/settings_bloc.dart';
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
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: SettingsPageActions(),
      ),
      // floatingActionButton: const Expanded(child: ),
      body: Builder(builder: (context) {
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
    );
  }
}

class SettingsPageActions extends StatelessWidget {
  const SettingsPageActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SettingsBloc>();
    return Row(
      children: [
        Expanded(
            child: FilledButton(
                onPressed: () =>
                    bloc.add(SettingsSaveEvent()),
                child: const Text('Save'))),
        const SizedBox(width: 24),
        Expanded(
            child: OutlinedButton(
                onPressed: () => bloc.add(SettingsResetEvent()),
                child: const Text('Reset'))),
      ],
    );
  }
}
