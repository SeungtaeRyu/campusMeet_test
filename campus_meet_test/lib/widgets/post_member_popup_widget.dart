import 'package:campus_meet_test/controller/meetingPost_controller.dart';
import 'package:campus_meet_test/models/MeetingPost/meeting_member_model.dart';
import 'package:campus_meet_test/models/MeetingPost/post_model.dart';
import 'package:campus_meet_test/screens/home/home_meeting_request.dart';
import 'package:campus_meet_test/screens/home/post_member_details.dart';
import 'package:flutter/material.dart';

class MemberPopupScreen extends StatefulWidget {
  const MemberPopupScreen({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  _MemberPopupScreenState createState() => _MemberPopupScreenState();
}

class _MemberPopupScreenState extends State<MemberPopupScreen> {
  late Future<List<MeetingMember>> meetingMember;

  @override
  void initState() {
    super.initState();
    meetingMember = getMeetingMember(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 10),
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Wrap(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: FutureBuilder<List<MeetingMember>>(
              future: meetingMember,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index){
                          return Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: snapshot.data!.length == index + 1 ? Colors.white : Colors.grey.shade300))),
                            child: Row(
                              children: [
                                // 상대방 프로필 써클 이미지
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey.shade500,
                                    child: CircleAvatar(
                                      radius: 19,
                                      backgroundColor: Colors.pink,
                                      child: Align(
                                        alignment: Alignment.bottomRight,

                                        // 이 부분은 접속 여부인데 삭제될 수도?
                                        child: CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Colors.grey.shade500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // 이름, 대학교, 학번 렌더링
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "${snapshot.data![index].name}",
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "${snapshot.data![index].univ} ${snapshot.data![index].entryYear}학번",
                                          style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                                // 상대방 프로필 상세보기
                                Container(
                                  child: IconButton(
                                    padding: EdgeInsets.zero, // 아이콘 패딩 설정
                                    constraints: BoxConstraints(),
                                    onPressed: () {
                                      // 상대프로필 페이지로 이동
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => OtherPersonProfileScreen(userId: snapshot.data![index].id)),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
      actions: <Widget>[
        // 미팅 신청이 가능한 게시글일 때
        Container(
          color: Colors.white,
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MeetingRequest(post: widget.post),
                      ));
                },
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: BorderSide(color: Colors.pink)),
                child: Text(
                  " 미팅 신청 ",
                  style: TextStyle(color: Colors.pink, height: 1),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
