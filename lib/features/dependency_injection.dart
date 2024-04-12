import 'package:assesment/features/hospital/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:assesment/features/hospital/data/data_source/remote_data_source/remote_data_source_impl.dart';
import 'package:assesment/features/hospital/data/repository/hospital_repositoy_impl.dart';
import 'package:assesment/features/hospital/domain/repository/hospital_respository.dart';
import 'package:assesment/features/hospital/domain/usecase/get_hospital_usecase.dart';
import 'package:assesment/features/hospital/domain/usecase/get_hospitals_usecase.dart';
import 'package:assesment/features/hospital/domain/usecase/search_hospital_usecase.dart';
import 'package:assesment/features/hospital/presentation/bloc/hospital_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Product
  sl.registerFactory(() => HospitalBloc(
      getHospitalUseCase: sl(),
      getHospitalsUseCase: sl(),
      searchHospitalUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetHospitalUseCase(hospitalRepository: sl()));
  sl.registerLazySingleton(() => GetHospitalsUseCase(hospitalRepository: sl()));
  sl.registerLazySingleton(
      () => SearchHospitalUseCase(hospitalRepository: sl()));

  //  Repository
  sl.registerLazySingleton<HospitalRepository>(() => HospitalRepositoryImpl(
        remoteDataSource: sl(),
      ));

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton(() => http.Client());
}
