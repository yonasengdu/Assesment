import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final num? longitude;
  final num? latitude;

  LocationEntity({required this.longitude, required this.latitude});

  @override
  List<Object?> get props => [longitude, latitude];
}
