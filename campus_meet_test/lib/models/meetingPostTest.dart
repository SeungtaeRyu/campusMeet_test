import 'package:campus_meet_test/models/Location/location_model.dart';

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

// class Location {
//   final String city;
//   final String street;
//
//   Location({required this.city, required this.street});
//
//   factory Location.fromJson(Map<String, dynamic> json) {
//     return Location(
//       city: json['city'],
//       street: json['street'],
//     );
//   }
// }
