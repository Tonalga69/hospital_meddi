import 'package:hospitales_meddi/features/hospitals/subfeatures/request/domain/entities/result.dart';

abstract class RequestState {}

class RequestLoadingState extends RequestState{}

class RequestInitialState extends RequestState{}

class RequestSuccessState extends RequestState{
  final CreateHospitalRequestResultEntity result;

  RequestSuccessState(this.result);
}

class RequestErrorState extends RequestState{
  final String message;

  RequestErrorState(this.message);

}