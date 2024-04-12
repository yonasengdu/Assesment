import 'package:assesment/core/utils/type_def.dart';
import 'package:assesment/features/hospital/domain/entity/hospital_entity.dart';
import 'package:assesment/features/hospital/domain/repository/hospital_respository.dart';

class SearchHospitalUseCase {
  final HospitalRepository hospitalRepository;

  SearchHospitalUseCase({required this.hospitalRepository});

  ResultFuture<List<HospitalEntity>> call(String query) async {
    final result = await hospitalRepository.searchHospital(query);
    return result;
  }
}
