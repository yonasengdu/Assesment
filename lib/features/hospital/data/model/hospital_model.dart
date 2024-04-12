import 'package:assesment/core/utils/type_def.dart';
import 'package:assesment/features/hospital/data/model/location_model.dart';
import 'package:assesment/features/hospital/domain/entity/hospital_entity.dart';

class HospitalModel extends HospitalEntity {
  HospitalModel({
    required super.id,
    required super.name,
    required super.location,
    required super.address,
    required super.imageUrl,
    required super.rating,
  });

  factory HospitalModel.fromMap(DataMap map) {
    return HospitalModel(
      id: map["id"],
      name: map["name"],
      location: LocationModel.fromMap(map),
      address: map["address"],
      imageUrl: map["imageUrl"],
      rating: map["rating"],
    );
  }
}
