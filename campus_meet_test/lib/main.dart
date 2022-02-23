import 'package:campus_meet_test/screens/home_screen.dart';
import 'package:campus_meet_test/screens/my_meeting_screen.dart';
import 'package:campus_meet_test/screens/myPage.dart';
import 'package:campus_meet_test/screens/requestMeetingAcceptRefusal.dart';
import 'package:campus_meet_test/widgets/bottom_bar_widget.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    MaterialColor createMaterialColor(Color color) {
      List strengths = <double>[.05];
      final swatch = <int, Color>{};
      final int r = color.red, g = color.green, b = color.blue;

      for (int i = 1; i < 10; i++) {
        strengths.add(0.1 * i);
      }
      strengths.forEach((strength) {
        final double ds = 0.5 - strength;
        swatch[(strength * 1000).round()] = Color.fromRGBO(
          r + ((ds < 0 ? r : (255 - r)) * ds).round(),
          g + ((ds < 0 ? g : (255 - g)) * ds).round(),
          b + ((ds < 0 ? b : (255 - b)) * ds).round(),
          1,
        );
      });
      return MaterialColor(color.value, swatch);
    }

    return MaterialApp(
      title: 'Campus Meet',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xffff375c)),
        scaffoldBackgroundColor: Color(0xFFFFFFFF)
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              MyMeetingScreen(),
              MyPageScreen(),
            ],
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
