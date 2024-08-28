import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
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
            dropdownMenuEntries: LanguageLabel.values
                .map<DropdownMenuEntry<LanguageLabel>>(
                    (LanguageLabel language) => DropdownMenuEntry(
                        value: language, label: language.label))
                .toList())
      ],
    );
  }
}
