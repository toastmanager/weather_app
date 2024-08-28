import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/settings/domain/entities/settings.dart';
import 'package:weather_app/features/settings/domain/usecases/get_settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetSettings getSettings;

  SettingsBloc(this.getSettings) : super(SettingsInitial()) {
    on<SettingsGetEvent>(_getSettings);
  }

  void _getSettings(SettingsGetEvent event, Emitter<SettingsState> emit) {
    try {
      final settings = getSettings.execute();
      emit(SettingsGetSuccessState(settings: settings));
    } catch (e) {
      rethrow;
    }
  }
}
