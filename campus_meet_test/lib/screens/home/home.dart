import 'package:badges/badges.dart';
import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:campus_meet_test/models/MeetingPost/post_model.dart';
import 'package:campus_meet_test/models/metting_post_model.dart';
import 'package:campus_meet_test/screens/home/otherPersonProfile_screen.dart';
import 'package:campus_meet_test/widgets/render_post_card_widget.dart';
import 'package:campus_meet_test/widgets/render_request_post_card.dart';
import 'package:flutter/material.dart';
import 'homeFilter.dart';
import 'homeMeetingRequest.dart';
import 'homeNotice.dart';
import 'homeSearch.dart';
import 'homeWriting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentPage = "home";
  List<Post> posts = [
    Post.fromJson({
      "id": 1,
      "location": {"id": 0, "cityStateName": "서울", "cityCountryName": "전체"},
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
      "id": 2,
      "location": {"id": 0, "cityStateName": "서울", "cityCountryName": "전체"},
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
      "location": {"id": 0, "cityStateName": "서울", "cityCountryName": "전체"},
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
    })
  ];

  List<MeetingPost> meetingPosts = [
    MeetingPost.fromMap({
      'id': 1,
      'title': '방학 3일남은 한량들입니다.',
      'location': '서울 강남구',
      'createdAt': 'createdAt',
      'keyword': ['keyword1', 'keyword2'],
      'writerId': '작성자 학교/학번/닉네임',
      'numMember': 3,
    }),
    MeetingPost.fromMap({
      'id': 2,
      'title': '개강의 슬픔을 술로 달래실 분들',
      'location': '서울 전체',
      'createdAt': 'createdAt',
      'keyword': ['keyword1', 'keyword2'],
      'writerId': '작성자 학교/학번/닉네임',
      'numMember': 4,
    }),
    MeetingPost.fromMap({
      'id': 3,
      'title': '개강 기념 미팅할 사람 구해요!',
      'location': '서울 전체',
      'createdAt': 'createdAt',
      'keyword': ['keyword1', 'keyword2', 'keyword3', 'keyword4'],
      'writerId': '작성자 학교/학번/닉네임',
      'numMember': 4,
    }),
    MeetingPost.fromMap({
      'id': 4,
      'title': '미팅 너무 재밌겠다 그죠잉',
      'location': '경기도 파주시',
      'createdAt': 'createdAt',
      'keyword': ['keyword1', 'keyword2'],
      'writerId': '작성자 학교/학번/닉네임',
      'numMember': 2,
    }),
    MeetingPost.fromMap({
      'id': 4,
      'title': '미팅 너무 재밌겠다 그죠잉',
      'location': '경기도 파주시',
      'createdAt': 'createdAt',
      'keyword': ['keyword1', 'keyword2'],
      'writerId': '작성자 학교/학번/닉네임',
      'numMember': 2,
    }),
    MeetingPost.fromMap({
      'id': 4,
      'title': '미팅 너무 재밌겠다 그죠잉',
      'location': '경기도 파주시',
      'createdAt': 'createdAt',
      'keyword': ['keyword1', 'keyword2'],
      'writerId': '작성자 학교/학번/닉네임',
      'numMember': 2,
    }),
    MeetingPost.fromMap({
      'id': 4,
      'title': '미팅 너무 재밌겠다 그죠잉',
      'location': '경기도 파주시',
      'createdAt': 'createdAt',
      'keyword': ['keyword1', 'keyword2'],
      'writerId': '작성자 학교/학번/닉네임',
      'numMember': 2,
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Container(
          alignment: Alignment.centerLeft,
          height: MediaQuery.of(context).size.width * 0.1,
          child: Text(
            '캠퍼스밋',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink, fontFamily: 'TmoneyRoundWind'),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.black, size: 26),
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              constraints: BoxConstraints(),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeSearchScreen()));
              }),
          Badge(
            badgeContent: null,
            position: BadgePosition.topEnd(top: 10, end: 5),
            toAnimate: false,
            showBadge: true,
            child: IconButton(
              icon: Icon(Icons.notifications_none_outlined, color: Colors.black, size: 26),
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              constraints: BoxConstraints(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoticeScreen()),
                );
              },
            ),
          ),
          IconButton(icon: Icon(Icons.close, color: Colors.black, size: 26), padding: EdgeInsets.fromLTRB(0, 0, 20, 0), constraints: BoxConstraints(), onPressed: () {}),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          // 공지사항, 업데이트 배너
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.15,
            color: Colors.yellow.shade200,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              "공지 or 업데이트 내용 / 캐러슬 슬라이더?, 인디케이터?",
              style: TextStyle(color: Colors.amber),
            ),
          ),

          // 게시글 필터, 찜만보기
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 검색 필터
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MeetingFilterScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.image, size: 24, color: Colors.pink),
                      Text(" 검색 필터"),
                    ],
                  ),
                ),

                // 찜만 보기 (미구현)
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline_rounded, size: 20, color: Colors.grey.shade500),
                      Text(" 찜만 보기(미구현)"),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 게시글 읽기
          // 모델 수정, widget 분리 후
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return RenderPostCard(post: posts[index], currentPage: 'currentPage',);
              },
            ),
          ),

          // 모델 수정 전, widget 분리 전
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: meetingPosts.length,
          //     itemBuilder: (context, index) {
          //       return renderMeetingPost(index);
          //     },
          //   ),
          // ),
        ],
      ),

      // 글작성 페이지 이동
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WritingScreen()),
          );
        },
        tooltip: 'go write!',
        child: const Icon(Icons.add),
      ),
    );
  }


  // 미팅 게시글 불러오기
  // Widget renderMeetingPost(int index) {
  //   return InkWell(
  //     onTap: (){
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             contentPadding: EdgeInsets.zero,
  //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  //             content: Wrap(
  //               children: [
  //                 Container(
  //                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
  //                   child: Column(
  //                     children: List.generate(meetingPosts[index].numMember, (idx) {
  //                       return Container(
  //                         padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
  //                         width: MediaQuery.of(context).size.width * 0.9,
  //                         decoration: BoxDecoration(border: Border(bottom: BorderSide(color: meetingPosts[index].numMember == idx + 1 ? Colors.white : Colors.grey.shade300))),
  //                         child: Row(
  //                           children: [
  //                             Container(
  //                               padding: EdgeInsets.only(right: 10),
  //                               child: CircleAvatar(
  //                                 radius: 20,
  //                                 backgroundColor: Colors.grey.shade500,
  //                                 child: CircleAvatar(
  //                                   radius: 19,
  //                                   backgroundColor: Colors.pink,
  //                                   child: Align(
  //                                     alignment: Alignment.bottomRight,
  //                                     child: CircleAvatar(
  //                                       radius: 5,
  //                                       backgroundColor: Colors.grey.shade500,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                             Expanded(
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Container(
  //                                     child: Text(
  //                                       "${idx}번 학생 이름",
  //                                     ),
  //                                   ),
  //                                   Container(
  //                                     child: Text(
  //                                       "${idx}번 학생 대학, 학번",
  //                                       style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                             Container(
  //                                 child: IconButton(
  //                                   padding: EdgeInsets.zero, // 아이콘 패딩 설정
  //                                   constraints: BoxConstraints(),
  //                                   onPressed: () {
  //                                     // 상대프로필 페이지로 이동
  //                                     Navigator.push(
  //                                       context,
  //                                       MaterialPageRoute(builder: (context) => OtherPersonProfileScreen(userId: idx)),
  //                                     );
  //                                   },
  //                                   icon: Icon(
  //                                     Icons.arrow_forward_ios_rounded,
  //                                     size: 14,
  //                                   ),
  //                                 )),
  //                           ],
  //                         ),
  //                       );
  //                     }),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             actions: <Widget>[
  //               Container(
  //                 color: Colors.white,
  //                 height: 30,
  //                 // padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: <Widget>[
  //                     OutlinedButton(
  //                       onPressed: () {
  //                         Navigator.push(
  //                           context,
  //                           MaterialPageRoute(builder: (context) => MeetingRequest(post: meetingPosts[index])),
  //                         );
  //                       },
  //                       style: OutlinedButton.styleFrom(
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(20),
  //                           ),
  //                           side: BorderSide(color: Colors.pink)),
  //                       child: Text(
  //                         " 미팅 신청 ",
  //                         style: TextStyle(color: Colors.pink, height: 1),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           );
  //         },
  //       );
  //     },
  //     child: Container(
  //       margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
  //       padding: EdgeInsets.all(15),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         color: Colors.white,
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.2),
  //             offset: const Offset(5, 5),
  //             blurRadius: 5.0,
  //             // spreadRadius: 4,
  //           )
  //         ],
  //       ),
  //
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             meetingPosts[index].title,
  //             style: TextStyle(fontSize: 16),
  //           ),
  //           Padding(padding: EdgeInsets.only(bottom: 5)),
  //           Text(
  //             "${meetingPosts[index].location} · ${meetingPosts[index].createdAt}",
  //             style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
  //           ),
  //           Padding(padding: EdgeInsets.only(bottom: 20)),
  //           Wrap(
  //             spacing: 10,
  //             runSpacing: 10,
  //               children: <Widget>[for (String keyword in meetingPosts[index].keyword) Container(
  //                   padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
  //                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
  //                   child: Text("${keyword} "))]
  //           ),
  //           Padding(padding: EdgeInsets.only(bottom: 20)),
  //           Row(
  //             children: [
  //               Text(
  //                 "${meetingPosts[index].writerId} ",
  //                 style: TextStyle(fontSize: 14),
  //               ),
  //               Icon(
  //                 CustomIcons.my_page,
  //                 size: 14,
  //                 color: Colors.pink,
  //               ),
  //               Text(
  //                 "${meetingPosts[index].numMember}",
  //                 style: TextStyle(color: Colors.pink),
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
