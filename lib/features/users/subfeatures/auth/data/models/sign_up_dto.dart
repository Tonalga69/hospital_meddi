import 'package:hospitales_meddi/core/abstractions/model.dart';

class SignUpDto extends CoreModel{
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
  SignUpDto toEntity() {
    return SignUpDto(
      username: username,
      password: password,
      name: name,
      cellphone: cellphone,
    );
  }
}