part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsGetEvent extends SettingsEvent {}

class SettingsResetEvent extends SettingsEvent {}

class SettingsSaveEvent extends SettingsEvent {
  final Settings settings;

  const SettingsSaveEvent({required this.settings});
}