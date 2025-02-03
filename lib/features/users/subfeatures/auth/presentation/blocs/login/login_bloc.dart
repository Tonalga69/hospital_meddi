import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/entities/login_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/usecases/login.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/blocs/login/login_event.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/blocs/login/login_state.dart';

import '../../../data/models/login_dto.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()){
    on<LoginButtonPressed>((event, emit) async{
      emit(LoginLoading());
      final loginDto= LoginDtoEntity(username: event.email, password: event.password);
      final result= await loginUseCase.call(loginDto);
      result.fold(
            (failure) => emit(LoginFailure(message: failure.message)),
            (success) => emit(LoginSuccess()),
      );
    });
  }



}