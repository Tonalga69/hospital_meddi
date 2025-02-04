import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/entities/sign_up.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/blocs/sign_up/sign_up_event.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/blocs/sign_up/sign_up_state.dart';

import '../../../domain/usecases/sign_up.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  late final SignUpUseCase signUpUseCase;

  SignUpBloc({SignUpUseCase? signUpUseCase}) : super(SignUpStateInitial()) {
    this.signUpUseCase = signUpUseCase ?? GetIt.I.get<SignUpUseCase>();
    on<SignUpButtonPressed>((event, emit) async {
      emit(SignUpStateLoading());
      final SignUpDtoEntity signUpDtoEntity = SignUpDtoEntity(
        username: event.username,
        password: event.password,
        cellphone: event.phone,
        name: event.name,
      );
      final result = await this.signUpUseCase.signUp(signUpDtoEntity);
      result.fold(
        (failure) => emit(SignUpStateFailure(message: failure.message)),
        (success) => emit(SignUpStateSuccess()),
      );
    });
  }
}
