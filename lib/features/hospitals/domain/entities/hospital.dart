import 'package:hospitales_meddi/core/abstractions/entity.dart';
import 'package:hospitales_meddi/features/hospitals/data/models/hospital.dart';

import '../../data/models/distance.dart';
import '../../data/models/location.dart';

class HospitalEntity extends CoreEntity<Hospital> {
  final String id;
  final String name;
  final String photo;
  final String logo;
  final String address;
  final String urlGoogleMaps;
  final bool enabled;
  final String telephone;
  final String schedule;
  final String stateCode;
  final String municipality;
  final String observations;
  final Location location;
  final List<int> insurance;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Distance dist;

  HospitalEntity(
      {required this.id,
      required this.name,
      required this.photo,
      required this.logo,
      required this.address,
      required this.urlGoogleMaps,
      required this.enabled,
      required this.stateCode,
      required this.municipality,
      required this.observations,
      required this.schedule,
      required this.telephone,
      required this.location,
      required this.insurance,
      required this.createdAt,
      required this.dist,
      required this.updatedAt});

  @override
  Hospital toModel() {
    return Hospital(
        id: id,
        name: name,
        photo: photo,
        logo: logo,
        address: address,
        urlGoogleMaps: urlGoogleMaps,
        enabled: enabled,
        telephone: telephone,
        schedule: schedule,
        stateCode: stateCode,
        municipality: municipality,
        observations: observations,
        location: location,
        insurance: insurance,
        createdAt: createdAt,
        updatedAt: updatedAt,
        dist: dist);
  }
}
