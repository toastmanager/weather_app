import 'package:flutter/material.dart';
import 'package:weather_app/features/settings/presentation/widgets/primary_color_choose_button.dart';

class PrimaryColorSettings extends StatelessWidget {
  const PrimaryColorSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Primary color',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 24,
        ),
        Wrap(
          children: [
            PrimaryColorChooseButton(
              colorHex: 0xffE71492,
            ),
            const SizedBox(width: 16),
            PrimaryColorChooseButton(
              colorHex: 0xff3E7DC8,
            ),
            const SizedBox(width: 16),
            PrimaryColorChooseButton(
              colorHex: 0xff653EC8,
            ),
            const SizedBox(width: 16),
            PrimaryColorChooseButton(
              colorHex: 0xff3EC85C,
            ),
          ],
        )
      ],
    );
  }
}
