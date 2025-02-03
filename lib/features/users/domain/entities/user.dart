import 'package:hospitales_meddi/core/abstractions/entity.dart';
import 'package:hospitales_meddi/features/users/data/models/user.dart';

class UserEntity extends CoreEntity<User> {
  final String name;
  final String username;
  final String phone;

  UserEntity({
    required this.name,
    required this.username,
    required this.phone,
  });
  @override
  User toModel() {
    return User(
      name: name,
      phone: phone,
      username: username,
    );
  }
}