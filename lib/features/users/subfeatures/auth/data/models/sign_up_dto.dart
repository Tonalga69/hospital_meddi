import 'package:hospitales_meddi/core/abstractions/model.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/entities/sign_up.dart';

class SignUpDto extends CoreModel<SignUpDtoEntity>{
  final String username;
  final String password;
  final String name;
  final String cellphone;

  SignUpDto({
    required this.username,
    required this.password,
    required this.name,
    required this.cellphone,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      "name": name,
      "cellphone": cellphone,
    };
  }

  @override
  SignUpDtoEntity toEntity() {
    return SignUpDtoEntity(
      username: username,
      password: password,
      name: name,
      cellphone: cellphone,
    );
  }
}