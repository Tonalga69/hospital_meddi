import 'package:dio/dio.dart';
import 'package:hospitales_meddi/core/services/api_service.dart';

class RemoteUserDataSource {
  late final Dio _dio;
  final ApiService _apiService;

  RemoteUserDataSource({Dio? dio, required ApiService apiService})
      : _apiService = apiService {
    _dio = dio ?? Dio();
  }

  Future<void> login(String email, String password) async {
    try {
      await _dio.post('${_apiService.baseUrl}/user/login', data: {
        'username': email,
        'password': password,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signUp(
      String email, String password, String name, String cellphone) async {
    try {
      await _dio.post('${_apiService.baseUrl}/user/signup', data: {
        'username': email,
        'password': password,
        "name": name,
        "cellphone": cellphone,
      });
    } catch (e) {
      rethrow;
    }
  }
}
