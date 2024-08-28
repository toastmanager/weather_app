part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();
  
  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

class SettingsGetFailedState extends SettingsState {
  final String message;

  const SettingsGetFailedState({required this.message});
}

class SettingsUpdatingState extends SettingsState {}

class SettingsGetSuccessState extends SettingsState {
  final Settings settings;

  const SettingsGetSuccessState({required this.settings});
}