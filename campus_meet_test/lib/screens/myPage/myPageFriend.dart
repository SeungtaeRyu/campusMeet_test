import 'package:flutter/material.dart';
import 'myPageFriendAdd.dart';
import 'myPageFriendEdit.dart';

class MyPageFriendScreen extends StatefulWidget {
  const MyPageFriendScreen({Key? key}) : super(key: key);

  @override
  State<MyPageFriendScreen> createState() => _MyPageFriendScreenState();
}

class _MyPageFriendScreenState extends State<MyPageFriendScreen> {
  List<String> friendName = [
    "도진",
    "해수",
    "해수2",
    "해수3",
    "해수4",
    "승태",
    "현재",
    "준우",
    "한비",
    "경민",
    "경진",
    "현민",
    "수진"
  ];

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
        title: Text('친구', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
        actions: [
          IconButton(
              icon: Icon(Icons.add, color: Colors.black),
              padding: EdgeInsets.zero, constraints: BoxConstraints(),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageFriendAddScreen()));
              }),
          IconButton(
              icon: Icon(Icons.settings, color: Colors.black),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageFriendEditScreen()));
              })
        ],
      ),
      body: Builder(
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height- Scaffold.of(context).appBarMaxHeight!,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: friendName.length, // 추후 친구목록 DB.length 로 수정
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.pink,
                        radius: 20,
                      ),
                    ),
                    Text("${friendName[index]}"),
                  ],
                );
              },
            ),
          );
        }
      ),
    );
  }
}
