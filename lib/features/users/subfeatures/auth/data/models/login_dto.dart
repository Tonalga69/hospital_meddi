import 'package:hospitales_meddi/core/abstractions/model.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/entities/login_dto.dart';

class LoginDto extends CoreModel<LoginDtoEntity> {
  final String username;
  final String password;

  LoginDto({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

  @override
  LoginDtoEntity toEntity() {
    return LoginDtoEntity(
      username: username,
      password: password,
    );
  }

}