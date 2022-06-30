import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class MyMeetingHistoryScreen extends StatelessWidget {
  const MyMeetingHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Builder(
        builder: (context) {
          return Container(
            color: Colors.grey.shade200,
            height: MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight!,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  renderMeetingPost(),
                  renderMeetingPost(),
                  renderMeetingPost(),
                  renderMeetingPost(),
                  renderMeetingPost(),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  // 게시글 불러오기
  Widget renderMeetingPost() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          offset: const Offset(5, 5),
          blurRadius: 5.0,
          // spreadRadius: 4,
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "방학 3일 남은 한량들입니다",
            style: TextStyle(fontSize: 16),
          ),
          Padding(padding: EdgeInsets.only(bottom: 5)),
          Text(
            "location · n분전",
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
                child: Text("# keywords[index]", style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
                child: Text("# keywords[index]", style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
                child: Text("# keywords[index]", style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Row(
            children: [
              Text("명지대학교 20학번 박선호 ", style: TextStyle(fontSize: 14),),
              Icon(CustomIcons.my_page, size: 14, color: Colors.pink,),
              Text("3", style: TextStyle(color: Colors.pink),)
            ],
          )
        ],
      ),
    );
  }
}
