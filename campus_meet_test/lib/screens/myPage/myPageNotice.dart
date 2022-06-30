import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'myPageNoticeDetail.dart';

class MyPageNoticeScreen extends StatefulWidget {
  const MyPageNoticeScreen({Key? key}) : super(key: key);

  @override
  _MyPageNoticeScreenState createState() => _MyPageNoticeScreenState();
}

class _MyPageNoticeScreenState extends State<MyPageNoticeScreen> {
  String category = "이용약관";
  String title = "어쩌구저쩌구 약관 안내";
  String contents = "약관내용 약관내용 약관내용 약관내용 약관내용 약관내용 약관내용 약관내용 ";
  DateTime createAt = DateTime.now();
  bool isRead = false;

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
        title: Text('공지사항', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.fromLTRB(20, 30, 10, 30),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                color: isRead ? Colors.white : Colors.pink.shade50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("[${category}] ${title}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Padding(padding: EdgeInsets.only(bottom: 5)),
                      Text("${DateFormat("yyyy년 MM월 dd일").format(createAt)}")
                    ],
                  ),
                  IconButton(
                    padding: EdgeInsets.zero, // 아이콘 패딩 설정
                    constraints: BoxConstraints(), // constraints
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageNoticeDetailScreen(content: contents)));
                      setState(() {
                        isRead = true;
                      });
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: isRead ? Colors.grey : Colors.pink),
                  ),
                ],
              )
          );
        },
      ),
    );
  }
}
