import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/settings/presentation/bloc/settings_bloc.dart';

class LocationSettings extends StatefulWidget {
  const LocationSettings({super.key});

  @override
  State<LocationSettings> createState() => _LocationSettingsState();
}

class _LocationSettingsState extends State<LocationSettings> {
  late TextEditingController latitudeController;
  late TextEditingController longitudeController;

  @override
  void initState() {
    latitudeController = TextEditingController();
    longitudeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    latitudeController.dispose();
    longitudeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsLoadedState) {
          isLoading = false;
          latitudeController.text = state.settings.latitude.toString();
          longitudeController.text = state.settings.longitude.toString();
        }
        if (state is SettingsLoadingState) {
          isLoading = true;
        }
        return;
      },
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Latitude')),
              keyboardType: TextInputType.number,
              controller: latitudeController,
              enabled: !isLoading,
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Longitude')),
              keyboardType: TextInputType.number,
              controller: longitudeController,
              enabled: !isLoading,
            ),
          ],
        ),
    );
  }
}
