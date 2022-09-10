class Weather {
  String? status;
  final int? gradus;
  final String? hour;
  final String? id;

  Weather({this.status, this.gradus, this.id, this.hour});

  factory Weather.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Weather();
    return Weather(
      status: json["status"],
      gradus: json["gradus"],
      id: json["id"],
      hour: json["hour"],
    );
  }
}
