
abstract class RequestHospitalEvent {}


class RequestHospitalEventRequested extends RequestHospitalEvent {
  final String id;

  RequestHospitalEventRequested(this.id);
}



