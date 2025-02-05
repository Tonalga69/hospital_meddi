import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/core/services/api_service.dart';
import 'package:hospitales_meddi/core/services/local_database_service.dart';
import 'package:hospitales_meddi/features/users/data/datasource/local_user.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();

  static ServiceLocator get instance => _instance;
  final _getIt = GetIt.instance;

  ServiceLocator._internal(){
    _getIt.registerLazySingleton(() => ApiService());
    _getIt.registerSingletonAsync(() async {
      final service =LocalDatabaseService();
      await service.init();
      return service;
    });
    _getIt.registerLazySingleton(() => LocalUserDataSource());
  }
}