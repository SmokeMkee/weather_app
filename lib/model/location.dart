import 'package:weather_app/model/weather.dart';

class Location {
  final String cityName;
  final String status;
  final int degree;
  final int velocity;
  final int humidity;
  final List<Weather> weather;
  final String id;
  bool isFavorite;
  final String timeToday;
  final int averageDegree;

  Location(
      {required this.averageDegree,
      required this.timeToday,
      required this.weather,
      required this.velocity,
      required this.humidity,
      required this.cityName,
      required this.status,
      required this.degree,
      required this.id,
      this.isFavorite = false});

  factory Location.fromJson(Map<String, dynamic> json) {
    final weather = json['wheather'] as List<dynamic>;
    return Location(
        averageDegree: json["averageDegree"],
        cityName: json["cityName"],
        status: json["status"],
        degree: json["degree"],
        id: json["id"],
        velocity: json["velocity"],
        humidity: json["humidity"],
        timeToday: json["today"],
        weather: weather.map((e) => Weather.fromJson(e)).toList());
  }
}
