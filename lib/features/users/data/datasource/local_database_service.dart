import 'package:encrypt_shared_preferences/provider.dart';

class LocalDatabaseService {
  late EncryptedSharedPreferencesAsync databaseInstance;
  late String _currentKey;

  LocalDatabaseService({required String currentKey}){
    _currentKey = currentKey;
  }

  init() async {
    await EncryptedSharedPreferencesAsync.initialize(_currentKey);
      databaseInstance = EncryptedSharedPreferencesAsync.getInstance();
  }


}