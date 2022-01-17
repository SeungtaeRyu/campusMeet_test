import 'package:campus_meet_test/models/notice_model.dart';
import 'package:flutter/material.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  List<Notice> notices = [
    Notice.fromMap({
      'emoji': '💌',
      'title': '애프터 신청',
      'header': '\'밥 한끼 하고싶은 사람\' 카드가 도착했어요!',
      'paragraph': '[방학 3일남은 한량들입니다] 나를 마음에 들어한 사람이 누구인지 확인해보세요 :)',
      'date': '8월 21일',
    }),
    Notice.fromMap({
      'emoji': '💬',
      'title': '매칭 완료',
      'header': '누군가에게 미팅 신청이 왔어요!',
      'paragraph': '[방학 3일남은 한량들입니다] 생성된 채팅방을 통해 대화를 나누고, 미팅 일정을 등록해보세요!',
      'date': '8월 18일',
    }),
    Notice.fromMap({
      'emoji': '👀',
      'title': '미팅 신청',
      'header': '누군가에게 미팅 신청이 왔어요!',
      'paragraph': '[저희 어때요 누나!!] 멤버들의 프로필을 살펴보고, 미팅 진행 여부를 선택해주세요 :)',
      'date': '8월 18일',
    }),
    Notice.fromMap({
      'emoji': '👀',
      'title': '미팅 신청',
      'header': '누군가에게 미팅 신청이 왔어요!',
      'paragraph': '[저희 아이돌 닮았어요] 멤버들의 프로필을 살펴보고, 미팅 진행 여부를 선택해주세요 :)',
      'date': '8월 18일',
    }),
    Notice.fromMap({
      'emoji': '👀',
      'title': '미팅 신청',
      'header': '누군가에게 미팅 신청이 왔어요!',
      'paragraph': '[저희 아이돌 닮았어요] 멤버들의 프로필을 살펴보고, 미팅 진행 여부를 선택해주세요 :)',
      'date': '8월 18일',
    }),
  ];
  Icon abcd = Icon(
    Icons.home,
    color: Colors.red,
    size: 60.0,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
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
            title: Text('알림',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            bottom: TabBar(
              indicatorColor: Colors.pink,
              tabs: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.1,
                  child: Text(
                    '활동 알림',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.1,
                  child: Text(
                    '시스템 알림',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              ListView.separated(
                itemCount: notices.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            child: Text(notices[index].emoji)),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                notices[index].title,
                                style: TextStyle(fontSize: 12, color: Colors.grey)),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(notices[index].header,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(
                                notices[index].paragraph,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12, color: Colors.black)),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(notices[index].date,
                              style: TextStyle(fontSize: 12, color: Colors.grey))
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
