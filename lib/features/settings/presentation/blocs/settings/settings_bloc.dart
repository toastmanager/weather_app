import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/settings/domain/entities/settings.dart';
import 'package:weather_app/features/settings/domain/usecases/get_settings.dart';
import 'package:weather_app/features/settings/domain/usecases/reset_settings.dart';
import 'package:weather_app/features/settings/domain/usecases/save_settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetSettings getSettings;
  final SaveSettings saveSettings;
  final ResetSettings resetSettings;

  Settings? _currentSettings;

  SettingsBloc({
    required this.getSettings,
    required this.saveSettings,
    required this.resetSettings,
  }) : super(SettingsInitial()) {
    on<SettingsLoadEvent>(_onLoadSettings);
    on<UpdateLongitude>(_onUpdateLongitude);
    on<UpdateLatitude>(_onUpdateLatitude);
    on<SettingsSaveEvent>(_onSaveSettings);
    on<SettingsResetEvent>(_onResetSettings);
  }

  void _onLoadSettings(SettingsLoadEvent event, Emitter<SettingsState> emit) {
    emit(SettingsLoading());
    try {
      _currentSettings = getSettings.execute();
      emit(SettingsLoaded(settings: _currentSettings!));
    } catch (e) {
      emit(const SettingsError(message: 'Failed to load settings'));
      rethrow;
    }
  }

  void _onUpdateLongitude(UpdateLongitude event, Emitter<SettingsState> emit) {
    if (_currentSettings != null) {
      _currentSettings = _currentSettings!.copyWith(longitude: event.longitude);
      // emit(SettingsLoaded(settings: _currentSettings!));
    }
  }

  void _onUpdateLatitude(UpdateLatitude event, Emitter<SettingsState> emit) {
    if (_currentSettings != null) {
      _currentSettings = _currentSettings!.copyWith(latitude: event.latitude);
      // emit(SettingsLoaded(settings: _currentSettings!));
    }
  }

  Future<void> _onSaveSettings(
      SettingsSaveEvent event, Emitter<SettingsState> emit) async {
    emit(SettingsLoading());
    try {
      saveSettings.execute(_currentSettings!);
      emit(SettingsLoaded(settings: _currentSettings!));
    } catch (e) {
      emit(const SettingsError(message: 'Failed to save settings'));
      rethrow;
    }
  }

  Future<void> _onResetSettings(
      SettingsResetEvent event, Emitter<SettingsState> emit) async {
    emit(SettingsLoading());
    try {
      resetSettings.execute();
      _currentSettings = getSettings.execute();
      emit(SettingsLoaded(settings: _currentSettings!));
    } catch (e) {
      emit(const SettingsError(message: 'Failed to reset settings'));
      rethrow;
    }
  }
}
