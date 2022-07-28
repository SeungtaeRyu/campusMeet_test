class MeetingPostTest {
  final int id;
  final String userName;
  final String name;
  final Location location;

  MeetingPostTest(
      {required this.id,
      required this.userName,
      required this.name,
      required this.location});

  factory MeetingPostTest.fromJson(Map<String, dynamic> json) {
    return MeetingPostTest(
      id: json['id'],
      userName: json['username'],
      name: json['name'],
      location: Location.fromJson(json['address']),
    );
  }
}

class Location {
  final String cityStateName;
  final String cityCountryName;

  Location({required this.cityStateName, required this.cityCountryName});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      cityStateName: json['city'],
      cityCountryName: json['street'],
    );
  }
}
