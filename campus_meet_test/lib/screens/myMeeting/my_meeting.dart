import 'package:campus_meet_test/models/MeetingPost/post_model.dart';
import 'package:campus_meet_test/models/metting_post_model.dart';
import 'package:campus_meet_test/screens/home/home_writing.dart';
import 'package:campus_meet_test/screens/myMeeting/request_meeting_response.dart';
import 'package:campus_meet_test/widgets/render_matching_post_card_widget.dart';
import 'package:campus_meet_test/widgets/render_post_card_widget.dart';
import 'package:campus_meet_test/widgets/render_request_post_card_widget.dart';
import 'package:campus_meet_test/widgets/render_request_post_card_SE_widget.dart';
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

  bool noExistMyMeeting = true; // 내가 속한 그룹이 작성한 미팅글 없니?
  bool existRequestToMyMeeting = false; //내가속한 미팅에 상대팀 요청이있는경우
  bool existProposeToOtherMeeting = true; //남의 미팅에 내가속한 그룹이 요청한 경우
  bool existMatchingMeeting = true; // ㅁㅐ칭중인 미팅이 있는지
  List<Post> posts = [
    Post.fromJson({
      "id": 0,
      "location": {"id": 0, "stateName": "서울", "cityName": "전체"},
      "writer": {
        "id": 0,
        "univ": "명지대학교",
        "entryYear": 20,
        "name": "홍길동",
        "profileImages": ["http://hostaddress/path"]
      },
      "title": "방학 3일남은 한량들입니다",
      "createdAt": "2020-02-11 13:01:12",
      "updatedAt": "2020-02-11 13:01:12",
      "numOfMember": 3,
      "tags": [
        {"id": 0, "text": "얼굴천재"},
        {"id": 1, "text": "마네킹비율"},
        {"id": 2, "text": "보기보다 동안"},
        {"id": 3, "text": "나름 귀여울지도"},
        {"id": 4, "text": "사람 냄새나는 스타일"},
      ],
      "members": "http://localhost:3000/api/v1/post/0/member"
    }),
    Post.fromJson({
      "id": 0,
      "location": {"id": 0, "stateName": "서울", "cityName": "전체"},
      "writer": {
        "id": 0,
        "univ": "명지대학교",
        "entryYear": 20,
        "name": "홍길동",
        "profileImages": ["http://hostaddress/path"]
      },
      "title": "방학 3일남은 한량들입니다",
      "createdAt": "2020-02-11 13:01:12",
      "updatedAt": "2020-02-11 13:01:12",
      "numOfMember": 3,
      "tags": [
        {"id": 0, "text": "얼굴천재"},
        {"id": 1, "text": "마네킹비율"},
        {"id": 2, "text": "보기보다 동안"},
        {"id": 3, "text": "나름 귀여울지도"},
        {"id": 4, "text": "사람 냄새나는 스타일"},
      ],
      "members": "http://localhost:3000/api/v1/post/0/member"
    }),
  ];

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
    double width = MediaQuery.of(context).size.width;
    double viewPaddingTop = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewPadding.top -
                    MediaQuery.of(context).size.width * 0.2) *
                0.5,
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '이름',
                        style: TextStyle(
                            color: Color(0xffff375c),
                            fontWeight: FontWeight.w700,
                            fontSize: width * 0.059),
                      ),
                      Text(
                        '님의 미팅',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: width * 0.059),
                      ),
                    ],
                  ),
                ),
                //홈화면에 있는 미팅들 중 내가 수락요청한 미팅
                //여기가 위 컨텐츠
                Container(
                  child: viewPaddingTop > 21.0
                      ? Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    //existProposeToOtherMeeting true일때 meetingMyPropose()
                    // child: existProposeToOtherMeeting? meetingMyPropose() : noMeetingMyPropose() ,
                    child: existProposeToOtherMeeting? meetingMatcing() : noMeetingMyPropose() ,
                  )
                      : Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                    // child:  existProposeToOtherMeeting? meetingMyPropose() : noMeetingMyProposeSE() ,
                    child: existProposeToOtherMeeting? meetingMatcing() : noMeetingMyPropose() ,
                )
                )],
            ),
          ),
          //아래 컨텐츠
          Container(
            color: Colors.white,
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewPadding.top -
                    MediaQuery.of(context).size.width * 0.2) *
                0.5,
            padding: EdgeInsets.fromLTRB(20, width * 0.02, 20, 0),
            // color: Colors.,
            // 1. 내가 속한 그룹이 없는 경우 :noMeetingPost  find All Meeting
            //2. 내가 속한 그룹이 쓴 글이 있는데, 상대 팀 신청이 없는경우:noMeetingPropose
            //3. 내가 속한 그룹이 쓴 글에 상대 팀 신청이 있는 경우: existRequestMeeting
            //4. 상대팀 미팅에 내가속한 그룹 신청이 있는 경우 existRequestToMyMeeting //위팀
            //내가 속한 미팅글이 있나
            child: noExistMyMeeting ? noMeetingPost(): existRequestToMyMeeting ? existRequestMeeting() : noMeetingPropose() ,
          ),
        ],
      ),
    );
  }

  final PageController controller = PageController(
    initialPage: 1,
  );

//내가 신청한 미팅 있을때 위
  Widget meetingMyPropose() {
    double width = MediaQuery.of(context).size.width;
    double viewPaddingTop = MediaQuery.of(context).viewPadding.top;
    return Container(
        margin: EdgeInsets.only(top: width * 0.001),
        height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewPadding.top -
                    MediaQuery.of(context).size.width * 0.2) *
                0.5 -
            width * 0.19,
        child: SizedBox(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: width * 0.03, left: width * 0.03),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Container(
                  child: viewPaddingTop > 21.0
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: RenderRequestPostCard(post: posts[index]),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: RenderRequestPostCardSE(post: posts[index])),
                );
              }),
        ));
  }
  //매칭중인 미팅 있을때
  Widget meetingMatcing() {
    double width = MediaQuery.of(context).size.width;
    double viewPaddingTop = MediaQuery.of(context).viewPadding.top;
    return Container(
        margin: EdgeInsets.only(top: width * 0.001),
        height: (MediaQuery.of(context).size.height -
            MediaQuery.of(context).viewPadding.top -
            MediaQuery.of(context).size.width * 0.2) *
            0.5 -
            width * 0.19,
        child: SizedBox(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: width * 0.03, left: width * 0.03),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Container(
                  child: viewPaddingTop > 21.0
                      ? Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: MeetingMatchingPostCard(post: posts[index]),
                  )
                      : Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: MeetingMatchingPostCard(post: posts[index])),
                );
              }),
        ));
  }
//내가 신청한 미팅이 없을때 위에 들어가는 컨텐츠 사진 중앙에 정렬하도록 하세욥
  Widget noMeetingMyPropose() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: width * 0.001),
      height: (MediaQuery.of(context).size.height -
          MediaQuery.of(context).viewPadding.top -
          MediaQuery.of(context).size.width * 0.2) *
          0.5 -
          width * 0.19,
      child: Container(
          margin: EdgeInsets.fromLTRB(3, 20, 3, 8),
          padding: EdgeInsets.all(width * 0.03),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(5, 5),
                blurRadius: 5.0,
              )
            ],
          ),
        child: Column(
          children: [
            // 내가 신청한 미팅이 없을때
            Padding(
              padding: EdgeInsets.only(top: width*0.09),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.width * 0.19,
                    child: Image.asset('images/하트비행기.png')),
              ), //캠퍼스밋이미지가져와
            ),
            Container(
                margin: EdgeInsets.only(bottom: width*0.01, top: width*0.013),
                child: Text(
                  '아직 신청하신 미팅이 없네요',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff7C7C7C), fontSize: width*0.034),
                )),
            Container(
                // margin: EdgeInsets.only(top: 3),
                child: Text(
              '관심 가는 상대를 찾고 미팅을 신청해 보세요!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: width*0.038),
            )),
            Container(
              // color:const Color(0xffffe7eb),
              width: MediaQuery.of(context).size.width * 0.60,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                  color: Color(0xffffe7eb),
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.only(top: width*0.02),
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
                  style: TextStyle(color: Color(0xffff375c), fontSize: width*0.036),
                ),
              ),
            )
          ],
         ),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10), color: Colors.white),
      ),
    );
  }
  Widget noMeetingMyProposeSE() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: width * 0.001),
      height: (MediaQuery.of(context).size.height -
          MediaQuery.of(context).viewPadding.top -
          MediaQuery.of(context).size.width * 0.2) *
          0.5 -
          width * 0.19,
      child: Container(
        margin: EdgeInsets.fromLTRB(3, 20, 3, 8),
        padding: EdgeInsets.all(width * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(5, 5),
              blurRadius: 5.0,
            )
          ],
        ),
        child: Column(
          children: [
            // 내가 신청한 미팅이 없을때
            Padding(
              padding: EdgeInsets.only(top: width*0.042),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.16,
                    child: Image.asset('images/하트비행기.png')),
              ), //캠퍼스밋이미지가져와
            ),
            Container(
                margin: EdgeInsets.only(bottom: width*0.01, top: width*0.013),
                child: Text(
                  '아직 신청하신 미팅이 없네요',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff7C7C7C), fontSize: width*0.031),
                )),
            Container(
              // margin: EdgeInsets.only(top: 3),
                child: Text(
                  '관심 가는 상대를 찾고 미팅을 신청해 보세요!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: width*0.035),
                )),
            Container(
              // color:const Color(0xffffe7eb),
              width: MediaQuery.of(context).size.width * 0.58,
              height: MediaQuery.of(context).size.width * 0.09,
              decoration: BoxDecoration(
                  color: Color(0xffffe7eb),
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.only(top: width*0.02),
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
                  style: TextStyle(color: Color(0xffff375c), fontSize: width*0.034),
                ),
              ),
            )
          ],
        ),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10), color: Colors.white),
      ),
    );
  }
//여기부터 아래///////////////////////////////
  // 미팅 신청이 없을 때 아래
  Widget noMeetingPropose() {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
            //color: Colors.red,
            alignment: Alignment(-1.0, -1.0),
            margin: EdgeInsets.only(top: width * 0.03),
            child: Text(
              '받은 미팅 신청',
              //textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.053),
            )),
        Container(
          margin: EdgeInsets.only(bottom: width * 0.02),
          child: Padding(
            padding: EdgeInsets.only(top: width * 0.13),
            child: Center(
              child: Column(
                children: [
                  Container(
                      // color: Colors.blue,
                      height: MediaQuery.of(context).size.width * 0.18,
                      width: MediaQuery.of(context).size.width * 0.18,
                      child: Image.asset('images/나의미팅신청기다림.png')),
                  Container(
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      child: Image.asset('images/dots.png')),
                ],
              ),
            ), //캠퍼스밋이미지가져와
          ),
        ),
        Container(
            // color: Colors.blue,
            child: Text(
          '미팅 신청을 기다리는 중이에요',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: width * 0.033),
        )),
        Container(
          height: MediaQuery.of(context).size.width * 0.1,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
              color: Color(0xffffe7eb), borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.only(top: width * 0.03),
          alignment: Alignment(0.0, 0.0),
          child: FlatButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => checkMyWritingScreen()),
              );
            },
            child: Text(
              '개설한 미팅글 확인하기',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Color(0xffff375c), fontSize: width * 0.037),
            ),
          ),
        ),
      ],
    );
  }

  // 미팅 게시글이 없을 때 하단에 들어가는 컨텐츠임
  Widget noMeetingPost() {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
            alignment: Alignment(-1.0, -1.0),
            margin: EdgeInsets.only(top: width * 0.03),
            child: Text(
              '받은 미팅 신청',
              //textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.053),
            )),
        Container(
          margin: EdgeInsets.only(bottom: width * 0.02),
          child: Padding(
            padding: EdgeInsets.only(top: width * 0.13),
            child: Center(
              child: Container(
                  height: MediaQuery.of(context).size.width * 0.16,
                  width: MediaQuery.of(context).size.width * 0.16,
                  child: Image.asset('images/미작성아이콘.png')),
            ), //캠퍼스밋이미지가져와
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: width * 0.01),
            child: Text(
              '아직 아무것도 작성하지 않았어요',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Color(0xff7C7C7C), fontSize: width * 0.031),
            )),
        Container(
            // margin: EdgeInsets.only(top: 3),
            padding: EdgeInsets.only(top: width * 0.01),
            child: Text(
              '두근두근 첫 미팅글을 개설해보세요!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: width * 0.038),
            )),
        Container(
          height: MediaQuery.of(context).size.width * 0.1,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
              color: Color(0xffffe7eb), borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.only(top: width * 0.04),
          alignment: Alignment(0.0, 0.0),
          child: FlatButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WritingScreen()),
              );
            },
            child: Text(
              '미팅 글 개설하러 가기',
              style:
                  TextStyle(color: Color(0xffff375c), fontSize: width * 0.033),
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
                        '개설한 미팅글 확인하기',
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
