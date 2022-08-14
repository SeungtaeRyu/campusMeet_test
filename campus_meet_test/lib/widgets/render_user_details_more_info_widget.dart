import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:campus_meet_test/models/User/find_user_by_id_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RenderUserDetailsMoreInfo extends StatelessWidget {
  const RenderUserDetailsMoreInfo({Key? key, required this.searchedUser}) : super(key: key);
  final FindUserById searchedUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top) * 0.5,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.grey.shade200,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.pink,
                          ),
                          Text(
                            ' 당신을 한마디로 표현하자면?',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text('${this.searchedUser.introText}', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "기본 정보",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.pink,
                          child: Icon(CustomIcons.my_page, size: 14, color: Colors.white,),
                        ),
                        Padding(padding: EdgeInsets.only(right: 10)),
                        Text("${int.parse(DateFormat('yyyy').format(DateTime.now())) - int.parse(DateFormat('yyyy').format(this.searchedUser.birthDate)) + 1}세")
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.pink,
                          child: Icon(CustomIcons.my_page, size: 14, color: Colors.white,),
                        ),
                        Padding(padding: EdgeInsets.only(right: 10)),
                        Text("학과")
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                  ],
                ),
              ),
              Visibility(
                visible: true,
                child: Column(
                  children: [
                    Divider(
                      thickness: 5,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 추가정보 질문 1
                          _renderQustion("당신은 어떤 사람인가요?"),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          _renderAnswer(this.searchedUser.character.split(',')),
                          Padding(padding: EdgeInsets.only(bottom: 20)),

                          // 추가정보 질문 2
                          _renderQustion("쉬는날 주로 무얼 하나요?"),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          _renderAnswer(this.searchedUser.hobby.split(',')),
                          Padding(padding: EdgeInsets.only(bottom: 20)),

                          // 추가정보 질문 3
                          _renderQustion("어떤 상대에게 호감을 느끼나요?"),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          _renderAnswer(this.searchedUser.ideal.split(',')),
                          Padding(padding: EdgeInsets.only(bottom: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _renderQustion(String title) {
    return Row(
      children: [
        Text("Q. ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
        Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ],
    );
  }

  _renderAnswer(List<String> keyword) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: List.generate(keyword.length, (index) {
        return Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            margin: EdgeInsets.only(right: 0),
            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
            child: Container(
              child: Text(keyword[index], style: TextStyle(color: Colors.grey.shade500, fontSize: 14, height: 1)),
            ));
      }),
    );
  }
}
