import 'package:encrypt_shared_preferences/provider.dart';

class LocalDatabaseService {
  late EncryptedSharedPreferencesAsync databaseInstance;
  late String _currentKey;

  LocalDatabaseService({String currentKey = "default"}){
    _currentKey = currentKey;
  }

  _init() async {
    await EncryptedSharedPreferencesAsync.initialize(_currentKey);
    if(_currentKey == "default"){
      databaseInstance = EncryptedSharedPreferencesAsync.getInstance();
    }
  }

  set currentKey(String key){
    _currentKey = key;
    _init();
  }

}