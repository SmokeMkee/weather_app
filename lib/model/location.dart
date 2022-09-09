import 'package:wheather_app/model/wheather.dart';

class Location {
  final String? cityName;
  final String? status;
  final int? degree;
  final int? velocity;
  final int? humidity;
  final List<Weather>? weather;
  final String? id;
  bool? isFavorite;
  final String? timeToday;
  final int? averageDegree;

  Location(
      {
        this.averageDegree,
        this.timeToday,
      this.weather,
      this.velocity,
      this.humidity,
      this.cityName,
      this.status,
      this.degree,
      this.id,
      this.isFavorite = false});

  factory Location.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Location();
    final wheather = json['wheather'] as List<dynamic>;
    return Location(
      averageDegree: json["averageDegree"],
        cityName: json["cityName"],
        status: json["status"],
        degree: json["degree"],
        id: json["id"],
        velocity: json["velocity"],
        humidity: json["humidity"],
        timeToday: json["today"],
        weather: wheather.map((e) => Weather.fromJson(e)).toList());
  }
}
