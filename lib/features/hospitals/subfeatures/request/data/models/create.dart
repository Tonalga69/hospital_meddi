

class CreateHospitalRequest {
  final String token;
  final String hospitalId;

  CreateHospitalRequest({required this.token, required this.hospitalId});

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'hospitalId': hospitalId,
    };
  }
}