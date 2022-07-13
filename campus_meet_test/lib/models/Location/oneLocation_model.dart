class Location {
  Location({
    required this.id,
    required this.cityStateName,
    required this.cityCountryName,
  });

  int id;
  String cityStateName;
  String cityCountryName;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    cityStateName: json["cityStateName"],
    cityCountryName: json["cityCountryName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cityStateName": cityStateName,
    "cityCountryName": cityCountryName,
  };
}
