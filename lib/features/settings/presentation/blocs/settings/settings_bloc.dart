import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/settings/domain/entities/settings.dart';
import 'package:weather_app/features/settings/domain/usecases/get_settings.dart';
import 'package:weather_app/features/settings/domain/usecases/reset_settings.dart';
import 'package:weather_app/features/settings/domain/usecases/save_settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  // Usecases
  final GetSettings getSettings;
  final SaveSettings saveSettings;
  final ResetSettings resetSettings;

  SettingsBloc(this.getSettings, this.saveSettings, this.resetSettings)
      : super(const SettingsState()) {
    on<SettingsGetEvent>(_getSettings);
    on<SettingsResetEvent>(_resetSettings);
    on<SettingsSaveEvent>(_saveSettings);
  }

  void _getSettings(SettingsGetEvent event, Emitter<SettingsState> emit) {
    try {
      final settings = getSettings.execute();
      emit(state.copyWith(settings: settings));
    } catch (e) {
      rethrow;
    }
  }

  void _resetSettings(
      SettingsResetEvent event, Emitter<SettingsState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      await resetSettings.execute();
      final settings = getSettings.execute();
      emit(state.copyWith(settings: settings));
    } catch (e) {
      rethrow;
    }
  }

  void _saveSettings(SettingsSaveEvent event, Emitter<SettingsState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      await saveSettings.execute(event.settings);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      rethrow;
    }
  }
}
