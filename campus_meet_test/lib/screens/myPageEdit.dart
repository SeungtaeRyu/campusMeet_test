import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class MyPageEditScreen extends StatefulWidget {
  const MyPageEditScreen({Key? key}) : super(key: key);

  @override
  _MyPageEditScreenState createState() => _MyPageEditScreenState();
}

class _MyPageEditScreenState extends State<MyPageEditScreen> {
  TextEditingController selfIntroduction = TextEditingController();

  @override
  void initState() {
    super.initState();
    selfIntroduction.text = "저는 인간이 된 댕댕이입니다.";
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
              onPressed: () {},
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
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.pink,
                            child: Icon(CustomIcons.my_page, size: 15, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text("나이", style: TextStyle(height: 1))
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.pink,
                            child: Icon(CustomIcons.my_page, size: 15, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text("사는 지역", style: TextStyle(height: 1)),
                          IconButton(
                            padding: EdgeInsets.zero, // 아이콘 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.pink),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.pink,
                            child: Icon(CustomIcons.my_page, size: 15, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text("학과 미입력", style: TextStyle(height: 1))
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
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
                      Padding(padding: EdgeInsets.only(bottom: 10)),

                      _renderQustion("쉬는날 주로 무얼 하나요?"),
                      Padding(padding: EdgeInsets.only(bottom: 10)),

                      _renderQustion("어떤 상대에게 호감을 느끼나요?"),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
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
