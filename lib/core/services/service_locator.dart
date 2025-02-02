import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/core/services/api_service.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  static ServiceLocator get instance => _instance;
  final _getIt = GetIt.instance;

  ServiceLocator._internal(){
    _getIt.registerLazySingleton(() => ApiService());
  }
}