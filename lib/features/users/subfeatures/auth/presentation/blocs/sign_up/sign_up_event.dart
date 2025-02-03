

abstract class SignUpEvent  {}

class SignUpButtonPressed extends SignUpEvent {
  final String username;
  final String password;
  final String phone;
  final String name;

  SignUpButtonPressed({
    required this.username,
    required this.password,
    required this.phone,
    required this.name,
  });
}

class SignUpEventInitial extends SignUpEvent {}

class SignUpEventLoading extends SignUpEvent {}

