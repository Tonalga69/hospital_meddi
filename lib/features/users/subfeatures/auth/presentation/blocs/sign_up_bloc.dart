
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/entities/sign_up.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/blocs/sign_up_event.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/blocs/sign_up_state.dart';

import '../../domain/usecases/sign_up.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpBloc({required this.signUpUseCase}) : super(SignUpStateInitial());

  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield SignUpStateLoading();
      final SignUpButtonPressed buttonPressed = event;
      final SignUpDtoEntity signUpDtoEntity = SignUpDtoEntity(
        username: buttonPressed.username,
        password: buttonPressed.password,
        cellphone: buttonPressed.phone,
        name: buttonPressed.name,
      );
      final result = await signUpUseCase.signUp(signUpDtoEntity);
      yield result.fold(
        (failure) => SignUpStateFailure(message:failure.message),
        (success) => SignUpStateSuccess(),
      );
    }
  }
}