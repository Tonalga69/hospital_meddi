import 'package:encrypt_shared_preferences/provider.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/login_dto.dart';

///This class is responsible for storing the user's authentication data locally.
class LocalAuthDataStore {

  late EncryptedSharedPreferencesAsync databaseInstance;
  late String _currentKey="default";

  LocalAuthDataStore({String? currentKey}){
  _currentKey = currentKey ?? _currentKey;
  }

  init() async {
  await EncryptedSharedPreferencesAsync.initialize(_currentKey);
  databaseInstance = EncryptedSharedPreferencesAsync.getInstance();
  }

  /// Since the server doesn't provide a refresh token, I store the user's credentials locally.
  Future<List<LoginDto>> getAllAccounts() async {
    final List<String> accountNames =( await databaseInstance.getKeys()).toList();
    List<LoginDto> accounts = [];
    for (var account in accountNames) {
      final String password = (await databaseInstance.getString(account))!;
      accounts.add(LoginDto(username: account, password: password));
    }
    return accounts;
  }
}