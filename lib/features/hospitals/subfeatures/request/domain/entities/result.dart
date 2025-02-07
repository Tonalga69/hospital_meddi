import 'package:hospitales_meddi/core/abstractions/entity.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/data/models/result.dart';

class CreateHospitalRequestResultEntity
    extends CoreEntity<CreateHospitalRequestResult> {
  final String id;
  final DateTime createdAt;

  CreateHospitalRequestResultEntity(
      {required this.id, required this.createdAt});

  @override
  CreateHospitalRequestResult toModel() {
    return CreateHospitalRequestResult(
      id: id,
      createdAt: createdAt.toIso8601String(),
    );
  }
}
