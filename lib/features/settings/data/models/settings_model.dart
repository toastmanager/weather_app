import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/settings/domain/entities/settings.dart';

@immutable
class SettingsModel extends Equatable {
  final double longitude;
  final double latitude;
  final String languageCode;
  // TODO: add primary color variable
  // final ? primaryColor;

  const SettingsModel(
      {required this.longitude,
      required this.latitude,
      required this.languageCode});

  Settings toEntity() {
    return Settings(
        longitude: longitude, latitude: latitude, languageCode: languageCode);
  }

  factory SettingsModel.fromEntity(Settings entity) {
    return SettingsModel(
        longitude: entity.longitude,
        latitude: entity.latitude,
        languageCode: entity.languageCode);
  }

  @override
  List<Object?> get props => [
        longitude, latitude, languageCode, // primaryColor
      ];
}
