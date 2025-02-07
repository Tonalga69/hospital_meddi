import 'package:hospitales_meddi/core/abstractions/model.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/domain/entities/result.dart';

class CreateHospitalRequestResult
    extends CoreModel<CreateHospitalRequestResultEntity> {
  final String id;
  final String createdAt;

  CreateHospitalRequestResult({required this.id, required this.createdAt});

  @override
  CreateHospitalRequestResultEntity toEntity() {
    return CreateHospitalRequestResultEntity(
      createdAt: DateTime.parse(createdAt),
      id: id
    );
  }

  factory CreateHospitalRequestResult.fromJson(Map<String, dynamic> json) {
    return CreateHospitalRequestResult(
      id: json['id'],
      createdAt: json['createdAt'],
    );
  }
}
