import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/core/services/api_service.dart';
import 'package:hospitales_meddi/core/services/local_database_service.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  static ServiceLocator get instance => _instance;
  final _getIt = GetIt.instance;

  ServiceLocator._internal(){
    _getIt.registerLazySingleton(() => ApiService());
    _getIt.registerLazySingleton(() => LocalDatabaseService());
  }
}