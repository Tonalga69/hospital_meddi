import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/core/services/api_service.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/login_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/sign_up_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/exceptions/auth_exception.dart';

class RemoteAuthDataSource {
  late final Dio _dio;
  late final ApiService _apiService;

  RemoteAuthDataSource({Dio? dio,  ApiService? apiService})
       {
    _apiService = apiService ?? GetIt.I.get<ApiService>();
    _dio = dio ?? Dio();
  }

  Future<Either<AuthException, String>> login(LoginDto loginDto) async {
    try {
      final result = await _dio.post('${_apiService.baseUrl}/user/login',
          data: loginDto.toJson());
      return Right(result.data['token']);
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<AuthException, SignUpDto>> signUp(SignUpDto dto) async {
    try {
      final result = await _dio.post('${_apiService.baseUrl}/user/create',
          data: dto.toJson());
      if (result.statusCode == 400) {
        return Left(AuthException(result.data['data']['message'].toString()));
      }
      if (result.statusCode == 500) {
        return Left(AuthException("Server error"));
      }
      if (result.statusCode == 200 || result.statusCode==201) {
        return Right(dto);
      }
      return Left(AuthException("Unknown error"));
    } catch (e) {
      debugPrint(e.toString());
      return Left(AuthException("Unknown error"));
    }
  }
}
