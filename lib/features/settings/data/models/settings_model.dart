import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/settings/domain/entities/settings.dart';

part 'settings_model.g.dart';

@immutable
@JsonSerializable()
class SettingsModel extends Equatable {
  final double longitude;
  final double latitude;
  @JsonKey(name: 'language_code')
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

  // Json
  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);

  @override
  List<Object?> get props => [
        longitude, latitude, languageCode, // primaryColor
      ];
}
