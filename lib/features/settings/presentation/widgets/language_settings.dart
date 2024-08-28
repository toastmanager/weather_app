import 'package:flutter/material.dart';

class LanguageSettings extends StatefulWidget {
  const LanguageSettings({super.key});

  @override
  State<LanguageSettings> createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
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
            border: OutlineInputBorder(),
            label: Text('Latitude')
          ),
          keyboardType: TextInputType.number,
          controller: latitudeController,
        ),
        const SizedBox(
          height: 12,
        ),
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Longitude')
          ),
          keyboardType: TextInputType.number,
          controller: longitudeController,
        ),
      ],
    );
  }
}
