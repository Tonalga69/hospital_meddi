import 'package:encrypt_shared_preferences/provider.dart';
import 'package:hospitales_meddi/features/users/data/datasource/local_user.dart';

import '../config/encription.dart';

class LocalDatabaseService {
  late EncryptedSharedPreferencesAsync _databaseInstance;
   EncryptedSharedPreferencesAsync get databaseInstance => _databaseInstance;

  /// Inject the instance of EncryptedSharedPreferencesAsync for testing purposes
  /// This Method shouldn't be used before registering [LocalUserDataSource] in the service locator
  init(String key, {EncryptedSharedPreferencesAsync? instance}) async {
    if(instance != null){
      _databaseInstance = instance;
      return;
    }
    await EncryptedSharedPreferencesAsync.initialize(key, encryptor: CustomSalsa20Encryptor());
      _databaseInstance = EncryptedSharedPreferencesAsync.getInstance();
  }








}