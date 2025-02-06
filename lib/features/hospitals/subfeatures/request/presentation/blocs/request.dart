import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/presentation/blocs/event.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/presentation/blocs/state.dart';

import '../../domain/usecases/request_hospital.dart';

class RequestBloc extends Bloc<RequestHospitalEvent, RequestState> {
  final RequestHospitalUseCase _requestHospitalUseCase;

  RequestBloc(this._requestHospitalUseCase) : super(RequestInitialState()) {
    on<RequestHospitalEventRequested>((event, emit) async {
      emit(RequestLoadingState());
      final result = await _requestHospitalUseCase.call(event.id);
      result.fold((l) => emit(RequestErrorState(l.message)),
          (r) => emit(RequestSuccessState(r)));
    });
  }
}
