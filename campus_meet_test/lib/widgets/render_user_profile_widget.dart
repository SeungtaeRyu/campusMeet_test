import 'package:campus_meet_test/models/user_model.dart';
import 'package:flutter/material.dart';

class RenderUserProfileInfo extends StatelessWidget {
  const RenderUserProfileInfo({Key? key, required this.user,}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderTextType1('학교'),
                _renderTextType2('${user.university} ${user.studentId}학번'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderTextType1('생일'),
                _renderTextType2(user.birthday),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _renderTextType1('한줄 자기소개'),
                    _renderTextType2(user.introduction),
                  ],
                ),
                _renderArrowIcon(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _renderTextType2('내가 쓴 글'),
                _renderArrowIcon(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey.shade300))), // 컨테이너 밑줄 지정
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _renderTextType2('내가 참여한 미팅'),
                _renderArrowIcon(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  _renderTextType1(String title) {
    return
        Text(
          title,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        );
  }
  _renderTextType2(String value) {
    return
        Text(
          value,
          style: TextStyle(fontSize: 14, color: Colors.black),
        );

  }
  _renderArrowIcon() {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      onPressed: () {},
      icon: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14,
      ),
    );
  }
}
