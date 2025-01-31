import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiService {
  ///Dotenv must be initialized before using this class
  final baseUrl = dotenv.env['BASE_URL'];
}