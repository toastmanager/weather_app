import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/settings/presentation/blocs/settings/settings_bloc.dart';

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

  void _updateLatitude(String value, SettingsBloc bloc) {
    final latitude = double.tryParse(latitudeController.text) ?? 0.0;
    bloc.add(UpdateLatitude(latitude: latitude));
  }

  void _updateLongitude(String value, SettingsBloc bloc) {
    final longitude = double.tryParse(longitudeController.text) ?? 0.0;
    bloc.add(UpdateLongitude(longitude: longitude));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {
      if (state is SettingsLoaded) {
        longitudeController.text = state.settings.longitude.toString();
        latitudeController.text = state.settings.latitude.toString();
      }
      return;
    }, builder: (context, state) {
      final bloc = context.read<SettingsBloc>();
      if (state is SettingsLoading) {
        return const CircularProgressIndicator();
      }
      return Column(
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
              onChanged: (value) => _updateLatitude(value, bloc),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d*)'))
              ]),
          const SizedBox(
            height: 12,
          ),
          TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Longitude')),
              keyboardType: TextInputType.number,
              controller: longitudeController,
              onChanged: (value) => _updateLongitude(value, bloc),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d*)'))
              ]),
        ],
      );
    });
  }
}
