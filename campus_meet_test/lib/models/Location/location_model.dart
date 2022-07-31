class Location {
  Location({
    required this.id,
    required this.stateName,
    required this.cityName,
  });

  int id;
  String stateName;
  String cityName;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    stateName: json["state_name"],
    cityName: json["city_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "state_name": stateName,
    "city_name": cityName,
  };
}
