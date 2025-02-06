class Location {
  final String? type;
  final List<double>? coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic>? json) {
    return Location(
      type: json?['type'],
      coordinates: json!=null? (json['coordinates'] as List)
        .map((e) => (e as num).toDouble()) // Convert all numbers to double
        .toList(): null
    );
  }
}