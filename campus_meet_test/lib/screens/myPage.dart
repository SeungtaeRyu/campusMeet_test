import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:campus_meet_test/screens/myMeetingHistory.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'myPageEdit.dart';
import 'myPageFriend.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            // 프로필 정보
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("이름", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Text("ㅇㅇ대학교ㅣ00학번ㅣ00살", style: TextStyle(fontSize: 17)),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: [4, 4],
                      radius: Radius.circular(20),
                      padding: EdgeInsets.zero,
                      color: Colors.grey.shade500,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageEditScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
                          child: Row(
                            children: [Icon(Icons.edit, size: 15, color: Colors.grey.shade500), Text(' 프로필 수정하기', style: TextStyle(fontSize: 13, color: Colors.grey.shade500))],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.pink,
                  child: CircleAvatar(
                    radius: 58,
                    backgroundImage: AssetImage('images/user1_profile.jpg'),
                  ),
                )
              ],
            ),

            // 친구 초대
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.pink.shade50),
              child: Row(
                children: [
                  Icon(Icons.image, color: Colors.pink),
                  Expanded(child: Text("  캠퍼스밋으로 친구 초대하기", style: TextStyle(color: Colors.pink, fontSize: 14))),
                  IconButton(
                    padding: EdgeInsets.zero, // 아이콘 패딩 설정
                    constraints: BoxConstraints(), // constraints
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.pink),
                  ),
                ],
              ),
            ),

            // 나의 미팅 히스토리
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyMeetingHistoryScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                child: Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.pink),
                    Expanded(child: Text("  나의 미팅 히스토리", style: TextStyle(fontSize: 14))),
                  ],
                ),
              ),
            ),

            // 나의 친구 관리
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageFriendScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                child: Row(
                  children: [
                    Icon(CustomIcons.my_page, color: Colors.pink),
                    Expanded(child: Text("  나의 친구 관리", style: TextStyle(fontSize: 14))),
                  ],
                ),
              ),
            ),

            // 자주 묻는 질문
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageFriendScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                child: Row(
                  children: [
                    Icon(Icons.close, color: Colors.grey.shade500),
                    Expanded(child: Text("  자주 묻는 질문", style: TextStyle(fontSize: 14))),
                  ],
                ),
              ),
            ),

            // 문의하기
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageFriendScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                child: Row(
                  children: [
                    Icon(Icons.close, color: Colors.grey.shade500),
                    Expanded(child: Text("  문의하기", style: TextStyle(fontSize: 14))),
                  ],
                ),
              ),
            ),

            // 공지사항
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageFriendScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                child: Row(
                  children: [
                    Icon(Icons.close, color: Colors.grey.shade500),
                    Expanded(child: Text("  공지사항", style: TextStyle(fontSize: 14))),
                  ],
                ),
              ),
            ),

            // 이용약관
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageFriendScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                child: Row(
                  children: [
                    Icon(Icons.close, color: Colors.grey.shade500),
                    Expanded(child: Text("  이용약관", style: TextStyle(fontSize: 14))),
                  ],
                ),
              ),
            ),
            
            // 설정
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageFriendScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                child: Row(
                  children: [
                    Icon(Icons.close, color: Colors.grey.shade500),
                    Expanded(child: Text("  설정", style: TextStyle(fontSize: 14))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

