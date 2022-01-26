import 'package:campus_meet_test/models/metting_post_model.dart';
import 'package:flutter/material.dart';

import 'meeting_post_filter.dart';
import 'notice_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          height: MediaQuery.of(context).size.width * 0.1,
          child: Text('홈',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.black), onPressed: () {}),
          IconButton(
              icon:
                  Icon(Icons.notifications_none_outlined, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoticeScreen()),
                );
              }),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
            height: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.filter_list_alt),
                  onPressed: () {
                    // filter component
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MeetingFilterPage()),
                    );
                  },
                ),
                Text("미팅 필터"),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: meetingPosts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          content: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.8,
                            child: ListView.separated(
                              itemCount: meetingPosts[index].numMember,
                              itemBuilder: (ctx, idx) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Icon(Icons.image),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("이름"),
                                        Text("학교, 학번"),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // 상대프로필 페이지로 이동
                                      },
                                      icon: Icon(Icons.arrow_forward),
                                    )
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider();
                              },
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    // 미팅 신청 로직 구현
                                    Navigator.pop(context);
                                  },
                                  child: Text("미팅 신청"),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(meetingPosts[index].title),
                        Text(meetingPosts[index].location),
                        Text(meetingPosts[index].createdAt),
                        Row(
                          children: <Widget>[
                            for (String keyword in meetingPosts[index].keyword)
                              Text("${keyword} ")
                          ],
                        ),
                        Text(meetingPosts[index].writerId),
                        Text("미팅인원: ${meetingPosts[index].numMember}"),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(thickness: 5);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {},
        tooltip: 'go write!',
        child: const Icon(Icons.add),
      ),
    );
  }
}
