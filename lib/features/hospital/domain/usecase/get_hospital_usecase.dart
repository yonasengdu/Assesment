import 'package:assesment/core/usecase/usecase.dart';
import 'package:assesment/core/utils/type_def.dart';
import 'package:assesment/features/hospital/domain/entity/hospital_entity.dart';
import 'package:assesment/features/hospital/domain/repository/hospital_respository.dart';

class GetHospitalUseCase implements UseCase<HospitalEntity, String> {
  final HospitalRepository hospitalRepository;

  GetHospitalUseCase({required this.hospitalRepository});

  @override
  ResultFuture<HospitalEntity> call(String id) async {
    final result = await hospitalRepository.getHospital(id);
    return result;
  }
}
