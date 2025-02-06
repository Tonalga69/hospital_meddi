import 'package:hospitales_meddi/features/hospitals/data/models/location.dart';

class Distance {
  final double calculated;
  final Location location;

  Distance({
    required this.calculated,
    required this.location,
  });

  factory Distance.fromJson(Map<String, dynamic> json) {
    return Distance(
      calculated: json['calculated'],
      location: Location.fromJson(json['location']),
    );
  }
}