import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class TermText extends StatelessWidget {
  const TermText( {Key? key, required this.content}) : super(key: key);
  final String content ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: MediaQuery.of(context).size.width * 0.07,
      width: MediaQuery.of(context).size.width * 0.38,
      child: Text(
        this.content,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15),
      ),
    );
  }
}
