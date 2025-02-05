import 'package:encrypt_shared_preferences/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/core/services/local_database_service.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/login_dto.dart';

///This class is responsible for storing the user's authentication data locally.
class LocalAuthDataStore {
  late EncryptedSharedPreferencesAsync databaseInstance;

  LocalAuthDataStore({EncryptedSharedPreferencesAsync? dataBaseInstance}) {
    databaseInstance=dataBaseInstance?? GetIt.I.get<LocalDatabaseService>().databaseInstance;
  }



  /// Since the server doesn't provide a refresh token, I store the user's credentials locally.
  Future<List<LoginDto>> getAllAccounts() async {
    final List<String> accountNames =
        (await databaseInstance.getKeys()).toList();
    List<LoginDto> accounts = [];
    for (var account in accountNames) {
      final password =
          (await databaseInstance.getString(account))!;
      accounts.add(LoginDto(username: account, password: password));
    }
    return accounts;
  }

  Future<void> saveAccount(LoginDto loginDto) async {
    await databaseInstance
        .setString(loginDto.username, loginDto.password);
  }
}
