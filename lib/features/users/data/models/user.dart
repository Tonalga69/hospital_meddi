import 'package:hospitales_meddi/core/abstractions/model.dart';
import 'package:hospitales_meddi/features/users/domain/entities/user.dart';

class User extends CoreModel<UserEntity> {
  final String name;
  final String username;
  final String phone;

  User({
    required this.name,
    required this.username,
    required this.phone,
  });

  @override
  UserEntity toEntity() {
    return UserEntity(
      name: name,
      phone: phone,
      username: username,
    );
  }
}
