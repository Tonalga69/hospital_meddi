import 'package:encrypt_shared_preferences/provider.dart';
import 'package:hospitales_meddi/features/users/data/datasource/local_user.dart';

class LocalDatabaseService {
  late EncryptedSharedPreferencesAsync _databaseInstance;
   EncryptedSharedPreferencesAsync get databaseInstance => _databaseInstance;
  final String _currentKey = "database initial";

  /// Inject the instance of EncryptedSharedPreferencesAsync for testing purposes
  /// This Method shouldn't be used before registering [LocalUserDataSource] in the service locator
  init({EncryptedSharedPreferencesAsync? instance}) async {
    if(instance != null){
      _databaseInstance = instance;
      return;
    }
    await EncryptedSharedPreferencesAsync.initialize(_currentKey);
      _databaseInstance = EncryptedSharedPreferencesAsync.getInstance();
  }








}