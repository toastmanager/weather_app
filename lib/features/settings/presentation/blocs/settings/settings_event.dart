part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class SettingsLoadEvent extends SettingsEvent {}

class SettingsSaveEvent extends SettingsEvent {}

class SettingsResetEvent extends SettingsEvent {}

class UpdateLongitude extends SettingsEvent {
  final double longitude;

  const UpdateLongitude({required this.longitude});

  @override
  List<Object?> get props => [longitude];
}

class UpdateLatitude extends SettingsEvent {
  final double latitude;

  const UpdateLatitude({required this.latitude});

  @override
  List<Object?> get props => [latitude];
}