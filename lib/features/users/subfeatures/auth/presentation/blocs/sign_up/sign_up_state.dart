
abstract class SignUpState {
}

class SignUpStateInitial extends SignUpState {}

class SignUpStateLoading extends SignUpState {}

class SignUpStateSuccess extends SignUpState {

}

class SignUpStateFailure extends SignUpState {
  final String message;

  SignUpStateFailure({required this.message});
}