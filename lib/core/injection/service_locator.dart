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
    _getIt.registerLazySingleton(() => LocalDatabaseService());
  }

  static Future<void> instanceLocalDatabaseService(String key, token) async {
    if(!_instance._getIt.isRegistered<LocalUserDataSource>()){
      _instance._getIt.registerLazySingleton(() => LocalUserDataSource());
    }
    await _instance._getIt<LocalDatabaseService>().init(key);
    _instance._getIt<LocalUserDataSource>().databaseInstance = _instance._getIt<LocalDatabaseService>().databaseInstance;
    _instance._getIt<LocalUserDataSource>().saveUserToken(token);
  }
}