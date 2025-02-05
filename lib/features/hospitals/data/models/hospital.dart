import 'package:hospitales_meddi/core/abstractions/model.dart';
import 'package:hospitales_meddi/features/hospitals/data/models/distance.dart';
import 'package:hospitales_meddi/features/hospitals/data/models/location.dart';
import 'package:hospitales_meddi/features/hospitals/domain/entities/hospital.dart';

class Hospital extends CoreModel<HospitalEntity>{
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

  Hospital({
    required this.id,
    required this.name,
    required this.photo,
    required this.logo,
    required this.address,
    required this.urlGoogleMaps,
    required this.enabled,
    required this.telephone,
    required this.schedule,
    required this.stateCode,
    required this.municipality,
    required this.observations,
    required this.location,
    required this.insurance,
    required this.createdAt,
    required this.updatedAt,
    required this.dist,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      id: json['_id'],
      name: json['name'],
      photo: json['foto'],
      logo: json['logo'],
      address: json['direccion'],
      urlGoogleMaps: json['urlGoogleMaps'],
      enabled: json['enabled'],
      telephone: json['telefono'],
      schedule: json['horario'],
      stateCode: json['estadoCode'],
      municipality: json['municipio'],
      observations: json['observaciones'] ?? '',
      location: Location.fromJson(json['location']),
      insurance: List<int>.from(json['aseguradora']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      dist: Distance.fromJson(json['dist']),
    );
  }

  @override
  HospitalEntity toEntity() {
    // TODO: implement toEntity
    throw UnimplementedError();
  }
}

