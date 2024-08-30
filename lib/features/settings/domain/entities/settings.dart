import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Settings extends Equatable {
  final int id;
  final double longitude;
  final double latitude;
  final String languageCode;
  // TODO: add primary color variable
  // final ? primaryColor;

  const Settings(
      {required this.id,
      required this.longitude,
      required this.latitude,
      required this.languageCode});

  Settings copyWith({
    int? id,
    double? longitude,
    double? latitude,
    String? languageCode,
  }) {
    return Settings(
        id: id ?? this.id,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        languageCode: languageCode ?? this.languageCode);
  }

  @override
  List<Object?> get props => [
        longitude, latitude, languageCode, // primaryColor
      ];
}
