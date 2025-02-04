import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/entities/login_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/usecases/login.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/blocs/login/login_event.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/blocs/login/login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final LoginUseCase loginUseCase;

  LoginBloc({LoginUseCase? loginUseCase}) : super(LoginInitial()){
    this.loginUseCase= loginUseCase ?? GetIt.I.get<LoginUseCase>();

    on<LoginButtonPressed>((event, emit) async{
      emit(LoginLoading());
      final loginDto= LoginDtoEntity(username: event.email, password: event.password);
      final result= await this.loginUseCase.call(loginDto);
      result.fold(
            (failure) => emit(LoginFailure(message: failure.message)),
            (success) => emit(LoginSuccess()),
      );
    });
  }



}