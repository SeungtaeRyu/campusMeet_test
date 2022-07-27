import 'package:campus_meet_test/screens/login/check_univ_email.dart';
import 'package:flutter/cupertino.dart';

class Routes{
  Routes._();

  static const String checkUnivEmailScreen = '/checkUnivEmailScreen';

  static final routes = <String, WidgetBuilder>{
    checkUnivEmailScreen: (BuildContext context) => CheckUnivPage()
  };
}
