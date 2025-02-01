import 'package:dio/dio.dart';
import 'package:hospitales_meddi/core/services/api_service.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/login_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/sign_up_dto.dart';

class RemoteUserDataSource {
  late final Dio _dio;
  final ApiService _apiService;

  RemoteUserDataSource({Dio? dio, required ApiService apiService})
      : _apiService = apiService {
    _dio = dio ?? Dio();
  }

  Future<String> login(LoginDto loginDto) async {
    try {
      final result = await _dio.post('${_apiService.baseUrl}/user/login',
          data: loginDto.toJson());
      return result.data['token'];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signUp(SignUpDto dto) async {
    try {
      final result = await _dio.post('${_apiService.baseUrl}/user/signup',
          data: dto.toJson());
      return result.statusCode == 200 || result.statusCode == 201;
    } catch (e) {
      return false;
    }
  }
}
