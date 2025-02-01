import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  ///Dotenv must be initialized before using this class
  late final String _baseUrl;

  String get baseUrl => _baseUrl;
  /// Set the base url for the api service for testing purposes only
  ApiService({String? baseUrl}) {
    _baseUrl = baseUrl ?? dotenv.env['BASE_URL']!;
  }
}
