import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/settings/presentation/bloc/settings_bloc.dart';

enum LanguageLabel {
  english('English', 'en'),
  russian('Русский', 'ru');

  const LanguageLabel(this.label, this.languageCode);
  final String label;
  final String languageCode;
}

class LanguageSettings extends StatefulWidget {
  const LanguageSettings({super.key});

  @override
  State<LanguageSettings> createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsGetSuccessState) {
          _controller.text = state.settings.languageCode;
        }
        return;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 24,
          ),
          DropdownMenu<LanguageLabel>(
            controller: _controller,
              dropdownMenuEntries: LanguageLabel.values
                  .map<DropdownMenuEntry<LanguageLabel>>(
                      (LanguageLabel language) => DropdownMenuEntry(
                          value: language, label: language.label))
                  .toList())
        ],
      ),
    );
  }
}
