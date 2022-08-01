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
    stateName: json["stateName"],
    cityName: json["cityName"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "stateName": stateName,
    "cityName": cityName,
  };
}
