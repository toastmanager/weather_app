import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Settings extends Equatable {
  final double longitude;
  final double latitude;
  final String languageCode;
  // TODO: add primary color variable
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