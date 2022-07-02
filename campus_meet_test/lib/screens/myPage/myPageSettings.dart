import 'package:campus_meet_test/screens/myPage/myPageSettingsResign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageSettinsScreen extends StatefulWidget {
  const MyPageSettinsScreen({Key? key}) : super(key: key);

  @override
  _MyPageSettinsScreenState createState() => _MyPageSettinsScreenState();
}

class _MyPageSettinsScreenState extends State<MyPageSettinsScreen> {
  // 알림 기능 활성화 변수
  bool _application = false;
  bool _completion = true;
  bool _cancellation = true;
  bool _refuse = true;
  bool _addFriend = true;

  // 비밀번호 변경 컨트롤러
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordCheckController = TextEditingController();

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
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (BuildContext context, StateSetter mystate) {
                              return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                content: Wrap(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                                      width: MediaQuery.of(context).size.width * 0.9,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // 닫기 버튼
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              // 패딩 설정
                                              constraints: BoxConstraints(),
                                              // constraints
                                              onPressed: () {
                                                // nickNameController.text = nickName;
                                                // tempNickName = nickName;
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.close),
                                              color: Colors.grey,
                                            ),
                                          ),

                                          // 비밀번호 변경 문구
                                          Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "비밀번호 변경",
                                              style: TextStyle(color: Colors.pink, fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.only(bottom: 20)),

                                          // 비밀번호 변경 인풋박스
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            child: TextFormField(
                                              controller: currentPasswordController,
                                              onChanged: (value) {
                                                mystate(() {
                                                  // tempNickName = value;
                                                });
                                              },
                                              style: TextStyle(fontSize: 15, color: Colors.black),
                                              decoration: InputDecoration(
                                                fillColor: Colors.grey.shade200,
                                                filled: true,
                                                contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey.shade200),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey.shade200),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                hintText: "기존 비밀번호 입력",
                                                hintStyle: TextStyle(color: Colors.grey),
                                              ),
                                              obscureText: true,
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.only(bottom: 20)),

                                          // 새로운 비밀번호
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            child: TextFormField(
                                              controller: newPasswordController,
                                              onChanged: (value) {
                                                mystate(() {
                                                  // tempNickName = value;
                                                });
                                              },
                                              style: TextStyle(fontSize: 15, color: Colors.black),
                                              decoration: InputDecoration(
                                                fillColor: Colors.grey.shade200,
                                                filled: true,
                                                contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey.shade200),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey.shade200),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                hintText: "새로운 비밀번호 입력",
                                                hintStyle: TextStyle(color: Colors.grey),
                                              ),
                                              obscureText: true,
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.only(bottom: 20)),

                                          // 새로운 비밀번호 확인
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            child: TextFormField(
                                              controller: newPasswordCheckController,
                                              onChanged: (value) {
                                                mystate(() {
                                                  // tempNickName = value;
                                                });
                                              },
                                              style: TextStyle(fontSize: 15, color: Colors.black),
                                              decoration: InputDecoration(
                                                fillColor: Colors.grey.shade200,
                                                filled: true,
                                                contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey.shade200),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey.shade200),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                hintText: "새로운 비밀번호 확인",
                                                hintStyle: TextStyle(color: Colors.grey),
                                              ),
                                              obscureText: true,
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.only(bottom: 10)),
                                          Text("    ㆍ8자 이상 입력", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                          Text("    ㆍ영문/숫자/특수문자만 허용하며, 2개 이상 조합", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                          Padding(padding: EdgeInsets.only(bottom: 20)),

                                          // 확인 버튼
                                          Container(
                                            alignment: Alignment.center,
                                            height: MediaQuery.of(context).size.width * 0.1,
                                            child: OutlinedButton(
                                              child: Text(
                                                "확인",
                                                style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                                              ),
                                              style: OutlinedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  side: BorderSide(color: Colors.pink)),
                                              onPressed: () {
                                                setState(() {
                                                  // nickNameController.text = tempNickName;
                                                  // nickName = tempNickName;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
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
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              content: Wrap(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "정말 로그아웃 하시겠어요?",
                                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.only(bottom: 30)),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                child: Text(
                                                  "취소",
                                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.grey.shade300,
                                                  elevation: 0, //elevation of button
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.only(left: 10)),
                                            Expanded(
                                              child: ElevatedButton(
                                                child: Text(
                                                  "로그아웃",
                                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.pink,
                                                  elevation: 0, //elevation of button
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 30)),
                                ],
                              ),
                            );
                          });
                    },
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
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageSettingsResignScreen()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
