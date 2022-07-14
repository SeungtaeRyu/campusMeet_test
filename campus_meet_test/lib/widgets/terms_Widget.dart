import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class TermText extends StatelessWidget {
  const TermText(String s, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      margin: EdgeInsets.only(top: 5),
      height: MediaQuery.of(context).size.width * 0.07,
      width: MediaQuery.of(context).size.width * 0.38,
      child: Text(
        "이용약관 동의",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15),
      ),
    );
  }
}
