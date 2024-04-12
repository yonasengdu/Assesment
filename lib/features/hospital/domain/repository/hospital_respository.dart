import 'package:assesment/core/utils/type_def.dart';
import 'package:assesment/features/hospital/domain/entity/hospital_entity.dart';

abstract class HospitalRepository {
  ResultFuture<List<HospitalEntity>> getHospitals();
  ResultFuture<HospitalEntity> getHospital(
    String id,
  );
  ResultFuture<List<HospitalEntity>> searchHospital(
    String query,
  );
}
