import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Settings extends Equatable {
  final double longitude;
  final double latitude;
  final String languageCode;
  final int primaryColor;

  const Settings(
      {required this.longitude,
      required this.latitude,
      required this.languageCode,
      required this.primaryColor});

  Settings copyWith({
    int? id,
    double? longitude,
    double? latitude,
    String? languageCode,
    int? primaryColor,
  }) {
    return Settings(
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        languageCode: languageCode ?? this.languageCode,
        primaryColor: primaryColor ?? this.primaryColor,
        );
  }

  @override
  List<Object?> get props => [
        longitude, latitude, languageCode, // primaryColor
      ];
}
