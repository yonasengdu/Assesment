import 'package:assesment/features/hospital/domain/entity/location_entity.dart';
import 'package:equatable/equatable.dart';

class HospitalEntity extends Equatable {
  final String id;
  final String name;
  final LocationEntity location;
  final String address;
  final String imageUrl;
  final num rating;

  HospitalEntity(
      {required this.id,
      required this.name,
      required this.location,
      required this.address,
      required this.imageUrl,
      required this.rating});

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        address,
        imageUrl,
        rating,
      ];
}
