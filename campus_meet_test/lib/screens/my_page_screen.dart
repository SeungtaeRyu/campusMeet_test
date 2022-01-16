import 'package:campus_meet_test/models/user_model.dart';
import 'package:campus_meet_test/widgets/profile_picture_widget.dart';
import 'package:flutter/material.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  User user = User.fromMap({
    'name': '아이유',
    'university': '명지대학교',
    'studentId': 12,
    'age': 30,
    'gender': 'female',
    'profileImage': 'user1_profile.jpg',
    'birthday': '1993년 5월 16일'
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ProfilePicture(user: user),
      ],
    );
  }
}
