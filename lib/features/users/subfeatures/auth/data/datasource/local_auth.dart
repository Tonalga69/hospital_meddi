import 'package:encrypt_shared_preferences/provider.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/login_dto.dart';

///This class is responsible for storing the user's authentication data locally.
class LocalAuthDataStore {
  late EncryptedSharedPreferencesAsync databaseInstance;
  late String _currentKey = "default";

  LocalAuthDataStore(
      {String? currentKey, EncryptedSharedPreferencesAsync? databaseInstance}) {
    this.databaseInstance = databaseInstance ?? this.databaseInstance;
    _currentKey = currentKey ?? _currentKey;
  }

  /// There's no need to call this method if testing
  Future<void> init() async {
    await EncryptedSharedPreferencesAsync.initialize(_currentKey);
    databaseInstance = EncryptedSharedPreferencesAsync.getInstance();
  }

  /// Since the server doesn't provide a refresh token, I store the user's credentials locally.
  Future<List<LoginDto>> getAllAccounts() async {
    final List<String> accountNames =
        (await databaseInstance.getKeys()).toList();
    List<LoginDto> accounts = [];
    for (var account in accountNames) {
      final List<String> accountsData =
          (await databaseInstance.getStringList(account))!;
      accounts.add(LoginDto(username: account, password: accountsData.first));
    }
    return accounts;
  }

  Future<void> saveAccount(LoginDto loginDto, String token) async {
    await databaseInstance
        .setStringList(loginDto.username, [loginDto.password, token]);
  }
}
