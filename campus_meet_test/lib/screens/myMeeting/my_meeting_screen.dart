import 'package:campus_meet_test/models/metting_post_model.dart';
import 'package:campus_meet_test/screens/home/homeWriting.dart';
import 'package:campus_meet_test/screens/myMeeting/requestMeetingAcceptRefusal.dart';
import 'package:flutter/material.dart';
import 'package:campus_meet_test/screens/home/home.dart';
import 'check_my_writing.dart';

// 페이지 2분할
class MyMeetingScreen extends StatefulWidget {
  const MyMeetingScreen({Key? key}) : super(key: key);

  @override
  _MyMeetingScreenState createState() => _MyMeetingScreenState();
}

class _MyMeetingScreenState extends State<MyMeetingScreen> {
  bool myMeeting = false;
  bool BmeetingPropose = false;

  List<double> position = [];
  List<List<String>> meetingPropose = [
    ['1', '1', '어필문구', '202202201754', '202202201756', '', 'N', ''],
    ['2', '2', '어필문구2', '202202201654', '202202201656', '', 'Y', ''],
    ['3', '3', '어필문구3', '202202201654', '202202201656', '', 'Y', ''],
    [
      '4',
      '4',
      '어필문구4',
      '202202201654',
      '202202201656',
      '',
      'Y',
      ''
    ] //시간은 이런형태가 아닐듯..?
  ];
//meetingPropose table id=1참조하는 proposer table
  List<List<String>> proposer = [
    ['1', '1', '1', 'Y'],
    ['2', '1', '2', 'Y'],
    ['3', '1', '3', 'Y']
  ];

  @override
  Widget build(BuildContext context) {
    // Color colorPink = Color(0xffe7eb);
    // print(meetingPropose.length);
    // print(proposer.length);
    return ListView(
      children: [
        Container(
          height: (MediaQuery.of(context).size.height -
                  MediaQuery.of(context).viewPadding.top -
                  MediaQuery.of(context).size.width * 0.2) *
              0.5,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          color: Colors.grey.shade200,
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Text(
                    '이름',
                    style: TextStyle(
                        color: Color(0xffff375c),
                        fontWeight: FontWeight.w700,
                        fontSize: 22),
                  ),
                  Text(
                    '님의 미팅',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 22),
                  ),
                ],
              ),
              //홈화면에 있는 미팅들 중 내가 수락요청한 미팅
              Container(
//                여기가 위 컨텐츠
                child: noMeetingPropose(), // 위
//                 child: existRequestMeeting(),
              )
            ],
          ),
        ),
        //아래 컨텐츠
        Container(
          height: (MediaQuery.of(context).size.height -
                  MediaQuery.of(context).viewPadding.top -
                  MediaQuery.of(context).size.width * 0.2) *
              0.5,
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          // color: Colors.,
          child: myMeeting
              ? BmeetingPropose
                  ? existRequestMeeting()
                  : existRequestMeeting()
              : existRequestMeeting(),
        ),
      ],
    );
  }
//내가 신청한 미팅 있을때
Widget meetingMyPropose() {
  return Expanded(child: Container(

  ),

  );
}




//내가 신청한 미팅이 없을때 위에 들어가는 컨텐츠 사진 중앙에 정렬하도록 하세욥
  Widget noMeetingMyPropose() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            // 내가 신청한 미팅이 없을때
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.width * 0.19,
                    child: Image.asset('images/하트비행기.png')),
              ), //캠퍼스밋이미지가져와
            ),
            Container(
                margin: EdgeInsets.only(bottom: 3, top: 13),
                child: Text(
                  '아직 신청하신 미팅이 없네요',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff7C7C7C), fontSize: 13),
                )),
            Container(
                // margin: EdgeInsets.only(top: 3),
                child: Text(
              '관심 가는 상대를 찾고 미팅을 신청해 보세요!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 14),
            )),
            Container(
              // color:const Color(0xffffe7eb),
              width: MediaQuery.of(context).size.width * 0.60,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                  color: Color(0xffffe7eb),
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment(0.0, 0.0),
              child: FlatButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text(
                  '미팅 글 살펴보러 가기',
                  style: TextStyle(color: Color(0xffff375c), fontSize: 13),
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
      ),
    );
  }
//여기부터 아래
  // 미팅 신청이 없을 때 아래
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
            child: Text(
          '미팅 신청을 기다리는 중이에요',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 13),
        )),
        Container(
          height: MediaQuery.of(context).size.width * 0.1,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
              color: Color(0xffffe7eb), borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment(0.0, 0.0),
          child: FlatButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => checkMyWritingScreen()),
              );
            },
            child: Text(
              '내가 쓴 미팅 글 확인하기',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xffff375c), fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }

  // 미팅 게시글이 없을 때 하단에 들어가는 컨텐츠임
  Widget noMeetingPost() {
    return Column(
      children: [
        Container(
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
                  height: MediaQuery.of(context).size.width * 0.18,
                  width: MediaQuery.of(context).size.width * 0.18,
                  color: Colors.grey,
                  child: Image.asset('images/미작성아이콘.png')),
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
          height: MediaQuery.of(context).size.width * 0.1,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
              color: Color(0xffffe7eb), borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment(0.0, 0.0),
          child: FlatButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WritingScreen()),
              );
            },
            child: Text(
              '미팅 글 작성하러 가기',
              style: TextStyle(color: Color(0xffff375c), fontSize: 13),
            ),
          ),
        )
      ],
    );
  }

  // 미팅 게시글 있고 && 미팅 신청도 있을 때 아래 컨텐츠
  Widget existRequestMeeting() {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Text(
                '받은 미팅 신청',
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
                      ),
                    ),
                    //여기 눌리면 내가 쓴 글 페이지로 넘어가
                    SizedBox(
                        child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xffff375c),
                        size: 17,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => checkMyWritingScreen()),
                        );
                      },
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
        // 요청묶음 보이기
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: meetingPropose.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.only(top: 15),
                    child: InkWell(
                      onTap: () {
                        //페이지 이동 requestMeetingARScreen // id값 줘야겠지?
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    requestMeetingARScreen()));
                      },
                      child: Column(children: [
                        Row(children: [
                          Visibility(
                            visible: meetingPropose[index][6] == 'Y',
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
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
                            child: Text(
                              meetingPropose[index][2],
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
                        //proposer
                        Container(
                          // color: Colors.blue,
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 10),
                          child: Stack(
                              children: List.generate(
                                  proposer.length,
                                  (index) => Positioned(
                                        left: index * 35, //!!!!!!!!
                                        child: new CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.white,
                                          child: new CircleAvatar(
                                            radius: 23,
                                            backgroundColor: Colors.pink,
                                          ),
                                        ),
                                      ))),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              // color:Colors.grey ,
                              border: Border(
                                  bottom: BorderSide(
                                      color: index + 1 == meetingPropose.length
                                          ? Colors.white
                                          : Colors.grey.shade300))),
                        )
                      ]),
                    ));
              },
            ),
          ),
        )
      ],
    );
  }
}
