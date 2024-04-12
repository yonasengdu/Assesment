import 'package:assesment/core/usecase/usecase.dart';
import 'package:assesment/core/utils/type_def.dart';
import 'package:assesment/features/hospital/domain/entity/hospital_entity.dart';
import 'package:assesment/features/hospital/domain/repository/hospital_respository.dart';

class GetHospitalsUseCase
    implements UseCaseWithoutParams<List<HospitalEntity>> {
  final HospitalRepository hospitalRepository;

  GetHospitalsUseCase({required this.hospitalRepository});

  @override
  ResultFuture<List<HospitalEntity>> call() async {
    final result = await hospitalRepository.getHospitals();
    return result;
  }
}
