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
  final int primaryColor;

  const SettingsModel(
      {required this.longitude,
      required this.latitude,
      required this.languageCode,
      required this.primaryColor});

  Settings toEntity() {
    return Settings(
        longitude: longitude, latitude: latitude, languageCode: languageCode, primaryColor: primaryColor);
  }

  factory SettingsModel.fromEntity(Settings entity) {
    return SettingsModel(
        longitude: entity.longitude,
        latitude: entity.latitude,
        languageCode: entity.languageCode,
        primaryColor: entity.primaryColor);
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
