part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();
  
  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

class SettingsFailedState extends SettingsState {
  final String message;

  const SettingsFailedState({required this.message});
}

class SettingsLoadingState extends SettingsState {}

class SettingsLoadedState extends SettingsState {
  final Settings settings;

  const SettingsLoadedState({required this.settings});
}