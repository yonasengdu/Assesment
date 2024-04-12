import 'package:assesment/core/utils/type_def.dart';
import 'package:assesment/features/hospital/domain/entity/location_entity.dart';


class LocationModel extends LocationEntity {
  LocationModel({
    required super.longitude,
    required super.latitude,
  });

  factory LocationModel.fromMap(DataMap map) {
    return LocationModel(
      longitude: map["longitude"],
      latitude: map["latitude"],
    );
  }
}
