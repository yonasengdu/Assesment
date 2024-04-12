import 'dart:convert';
import 'package:assesment/core/error/exception.dart';
import 'package:assesment/core/utils/type_def.dart';
import 'package:assesment/features/hospital/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:assesment/features/hospital/data/model/hospital_model.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  ResultFutureDataSource<HospitalModel> getHospital(String id) async {
    final response = await client.get(
        Uri.parse("https://hakimhub-backend.onrender.com/api/hospital/${id}"));

    if (response.statusCode == 200) {
      return HospitalModel.fromMap(json.decode(response.body)["data"]["data"]);
    } else {
      throw ServerException(message: "server Failure");
    }
  }

  @override
  ResultFutureDataSource<List<HospitalModel>> getHospitals() async {
    final response = await client.get(
        Uri.parse("https://hakimhub-backend.onrender.com/api/hospital/all"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)["data"]["data"];
      return jsonData.map((e) => HospitalModel.fromMap(e)).toList();
    } else {
      throw ServerException(message: "server Failure");
    }
  }

  @override
  ResultFutureDataSource<List<HospitalModel>> searchHospitals(
      String query) async {
    DataMap queryParameters = {"name": query};
    final response = await client.get(
        Uri.parse("https://hakimhub-backend.onrender.com/api/hospital/all")
            .replace(
      queryParameters: queryParameters,
    ));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)["data"]["data"];
      return jsonData.map((e) => HospitalModel.fromMap(e)).toList();
    } else {
      throw ServerException(message: "server Failure");
    }
  }
}
