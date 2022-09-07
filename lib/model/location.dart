import 'package:wheather_app/model/wheather.dart';

class Location {
  final String? cityName;
  final String? status;
  final int? gradus;
  final int? velocity;
  final int? humidity;
  final List<Weather>? weather;
  final String? id;
  bool? isFavorite;

  Location(
      {this.weather,
      this.velocity,
      this.humidity,
      this.cityName,
      this.status,
      this.gradus,
      this.id,
      this.isFavorite = false});

  factory Location.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Location();
    final wheather = json['wheather'] as List<dynamic>;
    return Location(
        cityName: json["cityName"],
        status: json["status"],
        gradus: json["gradus"],
        id: json["id"],
        velocity: json["velocity"],
        humidity: json["humidity"],
        weather: wheather.map((e) => Weather.fromJson(e)).toList());
  }
}
