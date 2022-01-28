import 'package:campus_meet_test/screens/member_formation_screen.dart';
import 'package:flutter/material.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({Key? key}) : super(key: key);

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {

  @override
  Widget build(BuildContext context) {
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

          // actions 버튼 패딩 어쩔꺼?
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Text("등록"),
              style: ElevatedButton.styleFrom(primary: Colors.pink),
            ),
            Padding(padding: EdgeInsets.only(right: 20))
          ],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      // controller: studuntIDController1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        // border: OutlineInputBorder(),
                        // labelText: '제한 없음',
                        hintText: '미팅 제목을 입력하세요',
                      ),
                    ),
                  ],
                ),
              ),

              // 지역
              Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Text("지역"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          // 텍스트필드를 쓸 게 아닌데 ?? 뭐 쓰지 ??
                          child: TextFormField(
                            // controller: studuntIDController1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              // border: OutlineInputBorder(),
                              // labelText: '제한 없음',
                              hintText: '지역 선택',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // 참가자
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("참가자"),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.pink,
                              backgroundImage:
                              AssetImage("images/user1_profile.jpg"),
                              child: Text("나",style: TextStyle(color: Colors.white),),
                            ),
                          ),

                          Container(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey,
                              child: CircleAvatar(
                                radius: 23,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                  icon: Icon(Icons.add, color: Colors.grey),
                                  padding: EdgeInsets.zero,
                                  onPressed: () async {
                                    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => MemberFomationScreen()));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // 키워드
              Container(
                padding: EdgeInsets.only(top: 10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text("키워드"),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text("미팅 상대에게 멤버들의 특징이나 장점으로 어필해보세요!"),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("(최대 7개까지 선택 가능)"),
                    ),

                    // 키워드 나열할 곳!

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
