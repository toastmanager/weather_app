import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/settings/presentation/blocs/settings/settings_bloc.dart';

class PrimaryColorChooseButton extends StatelessWidget {
  const PrimaryColorChooseButton(
      {super.key, required this.colorHex});

  final int colorHex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoaded) {
          final bool isPrimary = state.settings.primaryColor == colorHex;
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: Color(colorHex),
                    shape: BoxShape.circle,
                    border: isPrimary ? Border.all(width: 3, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4)) : null),
              ),
            ),
          );
        }
        return const Text('Error');
      },
    );
  }
}
