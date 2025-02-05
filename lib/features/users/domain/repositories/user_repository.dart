import 'package:hospitales_meddi/features/users/data/models/user.dart';

abstract class UserRepository {
  Future<User> getCurrentUser();
  Future<void> saveUser(User user);
  Future<String> getToken();
  Future<void> saveToken(String token);
}