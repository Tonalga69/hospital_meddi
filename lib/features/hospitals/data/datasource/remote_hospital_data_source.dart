import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/core/services/api_service.dart';
import 'package:hospitales_meddi/features/hospitals/data/models/get_hospital_params.dart';
import 'package:hospitales_meddi/features/hospitals/domain/exceptions/hospital.dart';

import '../../../users/subfeatures/auth/domain/exceptions/auth_exception.dart';

class RemoteHospitalDataSource {
  late final Dio _dio;
  late final ApiService _apiService;

  RemoteHospitalDataSource({Dio? dio, ApiService? apiService}) {
    _dio = dio ?? Dio();
    _apiService = apiService ?? GetIt.I.get<ApiService>();
  }

  Future<Either<Exception, List<dynamic>>> getHospitals(
      GetHospitalParams params, String token) async {
    try {
      final result = await _dio.get("${_apiService.baseUrl}/hospital/get/all",
          options: Options(
            headers: {
              "Authorization": "Bearer $token"
            }
          ),
          queryParameters: params.toJson());
      if (result.statusCode == 400) {
        return Left(HospitalException(
            message: "Error desconocido",
            debugMessage: "${result.statusCode}"));
      }
      if (result.statusCode == 500) {
        return Left(HospitalException(
            message: "Algo salio mal",
            debugMessage: result.statusCode.toString()));
      }
      if (result.statusCode == 401) {
        return Left(UnauthorizedException(
            "Parece que necesitas iniciar sesión de nuevo"));
      }
      return Right(result.data["data"]);
    } on Exception catch (e) {
      return Left(HospitalException(
          message: "Error desconocido", debugMessage: e.toString()));
    }
  }
}
