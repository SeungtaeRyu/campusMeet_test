import 'oneLocation_model.dart';

class Locations {
  Locations({
    required this.locations,
  });

  List<Location> locations;

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
    locations: List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
  };
}