import 'package:assesment/features/hospital/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:assesment/features/hospital/domain/entity/hospital_entity.dart';
import 'package:assesment/features/hospital/domain/repository/hospital_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:assesment/core/error/exception.dart';
import 'package:assesment/core/error/failure.dart';
import 'package:assesment/core/utils/type_def.dart';

class HospitalRepositoryImpl implements HospitalRepository {
  final RemoteDataSource remoteDataSource;

  HospitalRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<HospitalEntity> getHospital(String id) async {
    try {
      final hospital = await remoteDataSource.getHospital(id);
      return Right(hospital);
    } on ServerException {
      return Left(ServerFailure(message: "server Error"));
    }
  }

  @override
  ResultFuture<List<HospitalEntity>> getHospitals() async {
    try {
      final hospital = await remoteDataSource.getHospitals();

      return Right(hospital);
    } on ServerException {
      return Left(ServerFailure(message: "server Error"));
    }
  }

  @override
  ResultFuture<List<HospitalEntity>> searchHospital(String query) async {
    try {
      final products = await remoteDataSource.searchHospitals(query);
      return Right(products);
    } on ServerException {
      return Left(ServerFailure(message: "server Error"));
    }
  }
}
