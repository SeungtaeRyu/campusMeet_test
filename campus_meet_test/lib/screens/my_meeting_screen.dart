import 'package:campus_meet_test/models/metting_post_model.dart';
import 'package:flutter/material.dart';

// 페이지 2분할
class MyMeetingScreen extends StatefulWidget {

  const MyMeetingScreen({Key? key}) : super(key: key);
 // final List<String> data;

  @override
  _MyMeetingScreenState createState() => _MyMeetingScreenState();
}

class _MyMeetingScreenState extends State<MyMeetingScreen> {
  bool myMeeting = true;
  bool BrequestToMe = true;
 //bool confirm = true;
  List<double> position = [];
  List<List<String>> requestToMe = [['1','1','어필문구','202202201754','202202201756','','N','' ],['2','2','어필문구2','202202201654','202202201656','','Y',''],['3','3','어필문구3','202202201654','202202201656','','Y','']];

  @override
  Widget build(BuildContext context) {
    // Color colorPink = Color(0xffe7eb);
    print(requestToMe.length);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        //autovalidateMode: AutovalidateMode.always,
        child: Column(
            //   mainAxisSize: MainAxisSize.max,
            //  mainAxisAlignment: MainAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.grey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        //  color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Container(
                                // color: Colors.red,
                                width: 52,
                                height: 350,
                                alignment: Alignment(-1.0, -0.6),
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  '샛별',
                                  //textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xffff375c),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                )),
                            Container(
                                height: 350,
                                alignment: Alignment(-1.0, -0.6),
                                child: Text(
                                  '님의 미팅',
                                  //textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                )),
                          ],
                        ),
                      ),
                      //홈화면에 있는 미팅들 중 내가 신청한 미팅
                    ],
                  ),
                ),
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: myMeeting
                      ? BrequestToMe
                          ? existRequestMeeting()
                          : noMeetingPropose()
                      : noMeetingPost()),
            ]),
      ),
    );
  }

  Widget noMeetingPropose() {
    return Column(
      children: [
        Container(
            //color: Colors.red,
            alignment: Alignment(-1.0, -1.0),
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '받은 미팅 신청',
              //textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            )),
        Container(
          margin: EdgeInsets.only(bottom: 40),
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: Container(
                  width: 63,
                  height: 63,
                  child: Image.asset('images/나의미팅신청기다림.png')),
            ), //캠퍼스밋이미지가져와
          ),
        ),
        Container(
            //  color: Colors.red,
            //  alignment: Alignment(-1.0, 0.0),
            child: Text(
          '미팅 신청을 기다리는 중이에요',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 13),
        )),
        Container(
            // color:const Color(0xffffe7eb),
            width: 229,
            height: 38,
            decoration: BoxDecoration(
                color: Color(0xffffe7eb),
                borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment(0.0, 0.0),
            child: Text(
              '내가 쓴 미팅 글 확인하기',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xffff375c), fontSize: 13),
            )),
      ],
    );
  }

  Widget noMeetingPost() {
    return Column(
      children: [
        Container(
            //color: Colors.red,
            alignment: Alignment(-1.0, -1.0),
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '받은 미팅 신청',
              //textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            )),
        Container(
          margin: EdgeInsets.only(bottom: 40),
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: Container(
                  width: 63,
                  height: 63,
                  color: Colors.grey,
                  child: Image.asset('images/글쓰기아이콘.png')),
            ), //캠퍼스밋이미지가져와
          ),
        ),
        Container(
            child: Text(
          '아직 아무것도 작성하지 않았어요',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xff7C7C7C), fontSize: 13),
        )),
        Container(
            // margin: EdgeInsets.only(top: 3),
            child: Text(
          '두근두근 첫 미팅글을 작성해보세요!',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 14),
        )),
        Container(
          // color:const Color(0xffffe7eb),
          width: 229,
          height: 38,
          decoration: BoxDecoration(
              color: Color(0xffffe7eb), borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment(0.0, 0.0),
          child: Text(
            '미팅 글 작성하러 가기',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xffff375c), fontSize: 13),
          ),
        )
      ],
    );
  }

  Widget existRequestMeeting() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  //color: Colors.red,
                  //   alignment: Alignment(-1.0, -1.0),
                  //   margin: EdgeInsets.only(top: 20),
                  child: Text(
                '받은 미팅 신청',
                //textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              )),
              Container(
                child: Row(
                  children: [
                    Container(
                        child: Text(
                      '내가 쓴 미팅 글 확인하기',
                      style: TextStyle(
                          color: Color(0xffff375c),
                          fontWeight: FontWeight.w700,
                          fontSize: 13),
                    )),
                    SizedBox(
                        child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xffff375c),
                        size: 17,
                      ),
                      onPressed: () {},
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
       // 요청묶음 보이기
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: 330,
            child: ListView.builder( //
              padding: const EdgeInsets.all(8),
              itemCount: requestToMe.length,

              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Column(children: [
                    // Text(requestToMe[index]
                    Row(children: [
//
                      Visibility(
                        visible:requestToMe[index][6] == 'Y',
                        child: Container(
                          width: 39,
                          child: Text(
                            '새 글',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 10),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffff375c),
                              borderRadius: BorderRadius.circular(3)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          requestToMe[index][2] ,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          'n분 전',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff7C7C7C),
                          ),
                        ),
                      ),
                    ]),

                    Container(
                      alignment: Alignment(-1.0, -0.6),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.pink, //프로필 사진
                        radius: 25,
                      ),
                      decoration: BoxDecoration(
                        // color:Colors.grey ,
                          border: Border(
                              bottom: BorderSide(
                                  color: index + 1 == requestToMe.length
                                      ? Colors.white
                                      : Colors.grey.shade300))),
                    ),
                  ]),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
