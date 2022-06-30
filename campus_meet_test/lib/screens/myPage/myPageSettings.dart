import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageSettinsScreen extends StatefulWidget {
  const MyPageSettinsScreen({Key? key}) : super(key: key);

  @override
  _MyPageSettinsScreenState createState() => _MyPageSettinsScreenState();
}

class _MyPageSettinsScreenState extends State<MyPageSettinsScreen> {
  bool _application = false;
  bool _completion = true;
  bool _cancellation = true;
  bool _refuse = true;
  bool _addFriend = true;

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 알림
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("알림", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

                    // 미팅 신청 알림
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("미팅 신청 알림", style: TextStyle(fontSize: 16)),
                                Padding(padding: EdgeInsets.only(bottom: 5)),
                                Text("새로운 미팅 신청을 받으셨을 때 알려드려요", style: TextStyle(color: Colors.grey))
                              ],
                            ),
                          ),
                          CupertinoSwitch(
                            value: _application,
                            onChanged: (bool newValue) {
                              setState(() {
                                _application = newValue;
                              });
                            },
                            activeColor: Colors.pink,
                          )
                        ],
                      ),
                    ),

                    // 미팅 성사 알림
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("미팅 성사 알림", style: TextStyle(fontSize: 16)),
                                Padding(padding: EdgeInsets.only(bottom: 5)),
                                Text("새로운 미팅이 성사되었을 때 알려드려요", style: TextStyle(color: Colors.grey))
                              ],
                            ),
                          ),
                          CupertinoSwitch(
                            value: _completion,
                            onChanged: (bool newValue) {
                              setState(() {
                                _completion = newValue;
                              });
                            },
                            activeColor: Colors.pink,
                          )
                        ],
                      ),
                    ),

                    // 미팅 취소 알림
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("미팅 취소 알림", style: TextStyle(fontSize: 16)),
                                Padding(padding: EdgeInsets.only(bottom: 5)),
                                Text("성사되었던 미팅이 취소되었을 때 알려드려요", style: TextStyle(color: Colors.grey))
                              ],
                            ),
                          ),
                          CupertinoSwitch(
                            value: _cancellation,
                            onChanged: (bool newValue) {
                              setState(() {
                                _cancellation = newValue;
                              });
                            },
                            activeColor: Colors.pink,
                          )
                        ],
                      ),
                    ),

                    // 미팅 거절 알림
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("미팅 거절 알림", style: TextStyle(fontSize: 16)),
                                Padding(padding: EdgeInsets.only(bottom: 5)),
                                Text("상대 팀이 나의 미팅 신청을 거절했을 때 알려드려요", style: TextStyle(color: Colors.grey))
                              ],
                            ),
                          ),
                          CupertinoSwitch(
                            value: _refuse,
                            onChanged: (bool newValue) {
                              setState(() {
                                _refuse = newValue;
                              });
                            },
                            activeColor: Colors.pink,
                          )
                        ],
                      ),
                    ),

                    // 친구 추가 알림
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("친구 추가 알림", style: TextStyle(fontSize: 16)),
                                Padding(padding: EdgeInsets.only(bottom: 5)),
                                Text("상대방이 나를 친구로 추가했을 때 알려드려요", style: TextStyle(color: Colors.grey))
                              ],
                            ),
                          ),
                          CupertinoSwitch(
                            value: _addFriend,
                            onChanged: (bool newValue) {
                              setState(() {
                                _addFriend = newValue;
                              });
                            },
                            activeColor: Colors.pink,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 7,
                color: Colors.grey.shade200,
              ),

              // 계정
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("계정", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

                    // 비밀번호 변경
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text("비밀번호 변경", style: TextStyle(fontSize: 16)),
                      ),
                      onTap: () {},
                    ),
                    Container(
                      height: 1,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.grey.shade300,
                    ),

                    // 로그아웃
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text("로그아웃", style: TextStyle(fontSize: 16)),
                      ),
                      onTap: () {},
                    ),
                    Container(
                      height: 1,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.grey.shade300,
                    ),

                    // 서비스 탈퇴
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text("서비스 탈퇴", style: TextStyle(fontSize: 16)),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
