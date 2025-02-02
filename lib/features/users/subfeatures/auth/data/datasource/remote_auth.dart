import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hospitales_meddi/core/services/api_service.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/login_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/sign_up_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/exceptions/auth_exception.dart';

class RemoteAuthDataSource {
  late final Dio _dio;
  final ApiService _apiService;

  RemoteAuthDataSource({Dio? dio, required ApiService apiService})
      : _apiService = apiService {
    _dio = dio ?? Dio();
  }

  Future<Either<String, AuthException>> login(LoginDto loginDto) async {
    try {
      final result = await _dio.post('${_apiService.baseUrl}/user/login',
          data: loginDto.toJson());
      return Left(result.data['token']);
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<SignUpDto, AuthException>> signUp(SignUpDto dto) async {
    try {
      final result = await _dio.post('${_apiService.baseUrl}/user/signup',
          data: dto.toJson());
      if (result.statusCode == 400) {
        return Right(AuthException(result.data['data']['message'].toString()));
      }
      if (result.statusCode == 500) {
        return Right(AuthException("Server error"));
      }
      if (result.statusCode == 200) {
        return Left(dto);
      }
      return Right(AuthException("Unknown error"));
    } catch (e) {
      return Right(AuthException("Unknown error"));
    }
  }
}
