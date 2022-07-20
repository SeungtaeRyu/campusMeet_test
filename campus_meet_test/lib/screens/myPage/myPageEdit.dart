import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:campus_meet_test/models/address_model.dart';
import 'package:flutter/material.dart';
import 'myPageEditKeyword.dart';
import 'myPageEditMajor.dart';

class MyPageEditScreen extends StatefulWidget {
  const MyPageEditScreen({Key? key}) : super(key: key);

  @override
  _MyPageEditScreenState createState() => _MyPageEditScreenState();
}

class _MyPageEditScreenState extends State<MyPageEditScreen> {
  TextEditingController selfIntroduction = TextEditingController();
  String majorData = "";

  TextEditingController nickNameController = TextEditingController();
  String nickName = "닉네임";
  String tempNickName = "";

  List<String> images = ['사진1', '사진2', '사진3', '사진4', '사진5'];

  String addressData = ""; // 지역선택창에서 리턴될 데이터
  List<String> keywordsData = [];

  @override
  void initState() {
    super.initState();
    selfIntroduction.text = "저는 인간이 된 댕댕이입니다.";
    nickNameController.text = nickName;
    tempNickName = nickName;
  }

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
        toolbarHeight: MediaQuery.of(context).size.width * 0.1,
        elevation: 0.0,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 5),
            child: TextButton(
              onPressed: () {
                print("addressData: ${addressData}");
                print("majorData: ${majorData}");
                print("한줄 자기소개: ${selfIntroduction.text}");
                print("keywordsData: ${keywordsData}");
              },
              child: Text(
                "완료",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                // 프로필 사진
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("프로필 사진", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.only(bottom: 8)),
                      Text("다양한 사진들을 추가하여 매칭 성공률을 높여보세요!", style: TextStyle(fontSize: 15)),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      Container(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 9,
                          itemBuilder: (BuildContext context, int index) {
                            if (index < images.length) {
                              return Container(
                                margin: EdgeInsets.only(right: index == 8 ? 0 : 20),
                                child: InkWell(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 68,
                                      backgroundImage: AssetImage('images/user1_profile.jpg'),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(right: index == 8 ? 0 : 20),
                                  child: CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.grey,
                                    child: CircleAvatar(
                                      radius: 68,
                                      backgroundColor: Colors.white,
                                      child: Text('+'),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // 기본 정보
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("기본 정보", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.only(bottom: 10)),

                      // 닉네임
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.pink,
                            child: Icon(CustomIcons.my_page, size: 15, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Container(
                            height: 30,
                            alignment: Alignment.center,
                            child: Text(nickName, style: TextStyle(height: 1, color: Colors.pink)),
                          ),

                          // 닉네임 변경 팝업창
                          IconButton(
                            padding: EdgeInsets.zero, // 아이콘 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            icon: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.pink),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
                                      return AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                        content: Wrap(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                                              width: MediaQuery.of(context).size.width * 0.9,
                                              child: Column(
                                                children: [
                                                  // 닫기 버튼
                                                  Container(
                                                    alignment: Alignment.topRight,
                                                    child: IconButton(
                                                      padding: EdgeInsets.zero, // 패딩 설정
                                                      constraints: BoxConstraints(), // constraints
                                                      onPressed: (){
                                                        nickNameController.text = nickName;
                                                        tempNickName = nickName;
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Icon(Icons.close),
                                                      color: Colors.grey,),
                                                  ),

                                                  // 닉네임 변경 문구
                                                  Container(
                                                    child: Text("닉네임 변경", style: TextStyle(color: Colors.pink, fontSize: 18, fontWeight: FontWeight.bold),),),
                                                  Padding(padding: EdgeInsets.only(bottom: 20)),

                                                  // 닉네임 변경 인풋박스
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    child: TextFormField(
                                                      controller: nickNameController,
                                                      onChanged: (value) {
                                                        mystate(() {
                                                          tempNickName = value;
                                                        });
                                                      },
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: tempNickName == nickName ? Colors.grey : Colors.black
                                                      ),
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
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(padding: EdgeInsets.only(bottom: 20)),

                                                  // 확인 버튼
                                                  Container(
                                                    height: MediaQuery.of(context).size.width * 0.1,
                                                    child: OutlinedButton(
                                                      child: Text(
                                                        "확인",
                                                        style: TextStyle(color: tempNickName == nickName ? Colors.grey : Colors.pink, fontWeight: FontWeight.bold),
                                                      ),
                                                      style: OutlinedButton.styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          side: BorderSide(color: tempNickName == nickName ? Colors.grey : Colors.pink)),
                                                      onPressed: () {
                                                        setState(() {
                                                          nickNameController.text = tempNickName;
                                                          nickName = tempNickName;
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
                                    });

                                  });
                            },
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),

                      // 나이
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.pink,
                            child: Icon(CustomIcons.my_page, size: 15, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Container(
                            height: 30,
                            alignment: Alignment.center,
                            child: Text("나이", style: TextStyle(height: 1)),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),


                      // 학과
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: majorData == '' ? Colors.grey.shade200 : Colors.pink,
                            child: Icon(CustomIcons.my_page, size: 15, color: majorData == '' ? Colors.grey.shade500 : Colors.white),
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          InkWell(
                            onTap: () async {
                              String data = await Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageEditMajorScreen()));
                              if(data != "") {
                                setState(() {
                                  majorData = data;
                                });
                              }
                            },
                            child: Container(
                              height: 30,
                              alignment: Alignment.center,
                              child: Text(
                                majorData == '' ? "학과 미입력" : majorData,
                                style: TextStyle(height: 1, color: majorData == ''? Colors.grey.shade500 : Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 자기소개
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // 자기소개 설명
                      Text("자기 소개", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.only(bottom: 8)),
                      Text("상대방이 당신을 더 잘 파악하게 하기 위해 아래 질문들에 답변해 주세요!", style: TextStyle(fontSize: 15)),
                      Padding(padding: EdgeInsets.only(bottom: 20)),

                      // 한마디 표현
                      Row(
                        children: [
                          Icon(Icons.check_circle_rounded, color: Colors.pink),
                          Text(' 당신을 한마디로 표현하자면?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Container(
                        child: TextFormField(
                          controller: selfIntroduction,
                          onChanged: (value) {
                            // setState(() {
                            //   textValue = value;
                            // });
                          },
                          style: TextStyle(fontSize: 15),
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
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20)),

                      // 키워드 질문
                      _renderQustion("당신은 어떤 사람인가요?"),
                      Padding(padding: EdgeInsets.only(bottom: 15)),
                      Wrap(
                          spacing: 10,
                          runSpacing: 15,
                          children: List.generate(keywordsData.length + 1, (index) {
                            if (index == keywordsData.length) {
                              return InkWell(
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.pink),
                                    child: Text('+', style: TextStyle(color: Colors.white, height: 1))),
                                onTap: () async {
                                  List<String> data = await Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageEditKeywordScreen(keywordsData: keywordsData)));
                                  if(data != []){
                                    setState(() {
                                      keywordsData = data;
                                    });
                                  }
                                },
                              );
                            } else {
                              return Container(
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
                                  child: Text(keywordsData[index], style: TextStyle(color: Colors.grey.shade500, height: 1)));
                            }
                          })),
                      Padding(padding: EdgeInsets.only(bottom: 30)),

                      _renderQustion("쉬는날 주로 무얼 하나요?"),
                      Padding(padding: EdgeInsets.only(bottom: 30)),

                      _renderQustion("어떤 상대에게 호감을 느끼나요?"),
                      Padding(padding: EdgeInsets.only(bottom: 30)),
                    ],
                  ),
                ),
              ],
            ),
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
}
