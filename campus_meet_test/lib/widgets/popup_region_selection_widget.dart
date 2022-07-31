import 'package:campus_meet_test/controller/location_controller.dart';
import 'package:campus_meet_test/controller/meetingPost_controller.dart';
import 'package:campus_meet_test/models/Location/location_model.dart';
import 'package:campus_meet_test/models/MeetingPost/meeting_member_model.dart';
import 'package:flutter/material.dart';

class RegionSelectionPopupScreen extends StatefulWidget {
  const RegionSelectionPopupScreen({Key? key}) : super(key: key);

  @override
  _RegionSelectionPopupScreenState createState() => _RegionSelectionPopupScreenState();
}

class _RegionSelectionPopupScreenState extends State<RegionSelectionPopupScreen> {
  late Future<List<Location>> allLocations;

  @override
  void initState() {
    super.initState();
    int id = 0;
    allLocations = getAllLocations() as Future<List<Location>>;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      child: FutureBuilder(
        future: allLocations,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text("성공");
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
