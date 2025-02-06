import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/core/services/api_service.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/data/models/create.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/data/models/result.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/domain/exceptions/hospital_request.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/exceptions/auth_exception.dart';

class HospitalRequestRemoteDatasource {
  late final Dio _dio;
  late final ApiService _apiService;

  HospitalRequestRemoteDatasource({Dio? dio, ApiService? apiService}) {
    _dio = dio ?? Dio();
    _apiService = apiService ?? GetIt.I.get<ApiService>();
  }

  Future<Either<HospitalRequestException, CreateHospitalRequestResult>> createHospitalRequest(
      CreateHospitalRequest request) async {
    try {
      final result = await _dio.post(
        "${_apiService.baseUrl}/solicitud/create",
        data: request.toJson(),
        options: Options(headers: {"Authorization": "Bearer ${request.token}"}),
      );
      if (result.statusCode != 200) {
        return Left(
            HospitalRequestException("Algo fue mal", result.data.toString()));
      }
      return Right(CreateHospitalRequestResult.fromJson(result.data));
    } on DioException catch (e) {
      if (e.response == null) {
        return Left(HospitalRequestException("Algo fue mal", e.message));
      }
      if (e.response!.statusCode == 401) {
        throw UnauthorizedException("Es necesario iniciar sesión de nuevo",debugMessage: e.message);
      }
      if (e.response!.statusCode == 404) {
        return Left(HospitalRequestException("No encontrado", e.message));
      }
      return Left(HospitalRequestException("Error desconocido", e.message));
    } catch (e) {
      return Left(HospitalRequestException("Algo fue mal", e.toString()));
    }
  }
}
