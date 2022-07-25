import 'package:campus_meet_test/models/address_model.dart';
import 'package:campus_meet_test/screens/home/homeWritingAddMember.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:http/http.dart' as http;
import 'edit_my_writing.dart';

class checkMyWritingScreen extends StatefulWidget {
  const checkMyWritingScreen({Key? key}) : super(key: key);

  @override
  State<checkMyWritingScreen> createState() => _checkMyWritingScreenState();
}

class _checkMyWritingScreenState extends State<checkMyWritingScreen> {
  List<String> memberData = []; // 멤버결성창에서 리턴될 데이터
  String addressData = ""; // 지역선택창에서 리턴될 데이터
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // List<bool> selectedKeywords = [];
  List<String> selectedKeywords = ["인간 댕댕이", "회색 아기 고양이", "매력쟁이"];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
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
          toolbarHeight: MediaQuery.of(context).size.width * 0.1,
          elevation: 0.0,
          actions: [
            SizedBox(
                // width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                alignment:
                                    Alignment(-0.8, -1.0), //x축이 안먹히는 이유는?!?!?
                                // // insetPadding: EdgeInsets.only(bottom: 1520),
                                insetPadding: EdgeInsets.symmetric(
                                    horizontal: width * 0.3),
                                // actionsPadding: EdgeInsets.only(bottom: 10),
                                contentPadding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                content: Wrap(children: [
                                  Column(
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 20),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ReviseScreen()),
                                          );
                                        },
                                        child: const Text('수정'),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 20),
                                        ),
                                        onPressed: () {
                                          //삭제api
                                        },
                                        child: const Text('삭제'),
                                      ),
                                    ],
                                  )
                                ]));
                          });
                    })
              ],
            )),
            Padding(padding: EdgeInsets.only(right: 20))
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Builder(builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height -
                  Scaffold.of(context).appBarMaxHeight!,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      // 제목
                      inputTitle(),

                      // 지역
                      inputAddress(),

                      // 참가자
                      addMember(),

                      // 오픈채팅 링크
                      inputOpenChatLink(),

                      // 키워드
                      addKeywords(),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  // 제목 입력
  Widget inputTitle() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "개강 싫은 사람 모여",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // 지역 입력
  Widget inputAddress() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              "지역",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Text('서울 강서구'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 멤버 추가
  Widget addMember() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "참가자",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.only(bottom: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: memberData.length + 2,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("images/user1_profile.jpg"),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black.withOpacity(0.3),
                      child: Text(
                        "나",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 오픈채팅 링크 입력
  Widget inputOpenChatLink() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "채팅 링크",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200),
            child: Row(
              children: [
                Icon(Icons.link, color: Colors.grey.shade500),
                Padding(padding: EdgeInsets.only(right: 10)),
                Expanded(
                  child: Text(
                    '오픈 채팅방 링크',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20))
        ],
      ),
    );
  }

  // 키워드 추가
  Widget addKeywords() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "키워드",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),

          // keywords 나열하자!
          Wrap(
            runSpacing: 10,
            spacing: 10,
            children: List<Widget>.generate(
              selectedKeywords.length,
              (index) => Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                    primary: Colors.pink,
                    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {},
                  child: Text(
                    "# ${selectedKeywords[index]}",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20))
        ],
      ),
    );
  }
}
