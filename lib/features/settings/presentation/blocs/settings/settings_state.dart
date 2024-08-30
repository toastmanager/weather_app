part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final Settings? settings;
  final bool isFailed;
  final bool isLoading;
  final String? errorMessage;

  const SettingsState(
      {this.settings,
      this.isFailed = false,
      this.isLoading = false,
      this.errorMessage});

  SettingsState copyWith({
    Settings? settings,
    bool isFailed = false,
    bool isLoading = false,
    String? errorMessage,
  }) {
    return SettingsState(
      settings: settings ?? this.settings,
      isFailed: isFailed,
      isLoading: isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [settings, isFailed, isLoading, errorMessage];
}
