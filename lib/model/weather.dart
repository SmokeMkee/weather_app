class Weather {
  String status;
  final int degree;
  final String hour;
  final String id;

  Weather({
    required this.status,
    required this.degree,
    required this.id,
    required this.hour,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      status: json["status"],
      degree: json["gradus"],
      id: json["id"],
      hour: json["hour"],
    );
  }
}
