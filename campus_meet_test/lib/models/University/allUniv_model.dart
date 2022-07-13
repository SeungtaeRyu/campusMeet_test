import 'package:campus_meet_test/models/University/oneUniv_model.dart';

class Universities {
  Universities({
    required this.universities,
  });

  List<University> universities;

  factory Universities.fromJson(Map<String, dynamic> json) => Universities(
    universities: List<University>.from(json["universities"].map((x) => University.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "universities": List<dynamic>.from(universities.map((x) => x.toJson())),
  };
}