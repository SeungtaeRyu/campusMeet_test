import 'package:campus_meet_test/controller/location_controller.dart';
import 'package:campus_meet_test/models/Location/location_model.dart';
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
    allLocations = getAllLocation() as Future<List<Location>>;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
