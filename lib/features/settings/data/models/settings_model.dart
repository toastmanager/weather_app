import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';
import 'package:weather_app/features/settings/domain/entities/settings.dart';

@Entity()
// ignore: must_be_immutable
class SettingsModel extends Equatable {
  @Id()
  int id;
  final double longitude;
  final double latitude;
  final String languageCode;
  // TODO: add primary color variable
  // final ? primaryColor;

  SettingsModel(
      {this.id = 0,
      required this.longitude,
      required this.latitude,
      required this.languageCode});

  Settings toEntity() {
    return Settings(
        id: id,
        longitude: longitude,
        latitude: latitude,
        languageCode: languageCode);
  }

  factory SettingsModel.fromEntity(Settings entity) {
    return SettingsModel(
      id: entity.id,
        longitude: entity.longitude,
        latitude: entity.latitude,
        languageCode: entity.languageCode);
  }

  @override
  List<Object?> get props => [
        id, longitude, latitude, languageCode, // primaryColor
      ];
}
