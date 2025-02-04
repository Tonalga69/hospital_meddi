import 'package:encrypt_shared_preferences/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/core/services/local_database_service.dart';
import 'package:hospitales_meddi/features/users/data/models/user.dart';

class LocalUserDataSource {
  late EncryptedSharedPreferencesAsync _databaseInstance;

  LocalUserDataSource(
      {EncryptedSharedPreferencesAsync? encryptedSharedPreferences}) {
    _databaseInstance = encryptedSharedPreferences ??
        GetIt.instance<LocalDatabaseService>().databaseInstance;
  }

  set databaseInstance(EncryptedSharedPreferencesAsync instance) {
    _databaseInstance = instance;
  }

  Future<String> getUserToken() async {
    return (await _databaseInstance.getString('token'))!;
  }

  Future<void> saveUserToken(String token) async {
    await _databaseInstance.setString('token', token);
  }

  Future<User> getUser() async {
    final name = (await _databaseInstance.getString('name')) ?? '';
    final username = (await _databaseInstance.getString('username')) ?? '';
    final phone = (await _databaseInstance.getString('phone')) ?? '';
    return User(name: name, username: username, phone: phone);
  }

  Future<void> saveUser(User user) async {
    await _databaseInstance.setString('name', user.name);
    await _databaseInstance.setString('username', user.username);
    await _databaseInstance.setString('phone', user.phone);
  }
}
