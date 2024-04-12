import 'package:assesment/core/utils/type_def.dart';
import 'package:assesment/features/hospital/data/model/hospital_model.dart';
import 'package:assesment/features/hospital/domain/entity/hospital_entity.dart';

abstract class RemoteDataSource {
  ResultFutureDataSource<List<HospitalEntity>> getHospitals();
  ResultFutureDataSource<HospitalEntity> getHospital(
    String id,
  );
  ResultFutureDataSource<List<HospitalModel>> searchHospitals(
    String query,
  );
}
