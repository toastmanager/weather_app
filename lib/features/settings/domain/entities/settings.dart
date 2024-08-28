import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Settings extends Equatable {
  final String longitude;
  final String latitude;
  final String languageCode;
  // final ? primaryColor;

  const Settings(
      {required this.longitude,
      required this.latitude,
      required this.languageCode});

  @override
  List<Object?> get props => [
        longitude, latitude, languageCode, // primaryColor
      ];
}
