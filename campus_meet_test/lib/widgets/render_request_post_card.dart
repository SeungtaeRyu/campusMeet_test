import 'package:campus_meet_test/Controller/meetingPostController.dart';
import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:campus_meet_test/models/MeetingPost/post_model.dart';
import 'package:campus_meet_test/models/MeetingPost/meetingMember_model.dart';
import 'package:campus_meet_test/screens/home/homeMeetingRequest.dart';
import 'package:campus_meet_test/screens/home/otherPersonProfile_screen.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/rendering.dart';

class RenderRequestPostCard extends StatefulWidget {
  const RenderRequestPostCard({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  _RenderRequestPostState createState() => _RenderRequestPostState();
}

class _RenderRequestPostState extends State<RenderRequestPostCard> {
  late Future<List<MeetingMember>> meetingMember;

  @override
  void initState() {
    super.initState();
    meetingMember = getMeetingMember(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(9, 0, 9, 8),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(255, 124, 148, 10),
                    ),
                    height: MediaQuery.of(context).size.width * 0.058,
                    width: MediaQuery.of(context).size.width * 0.16,
                    child: Text(
                      '->대기중',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.03,
                          height: 1.9),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: width * 0.1)),
                  Text(
                    "${widget.post.location.cityStateName} ${widget.post.location.cityCountryName} · ${widget.post.createdAt}",
                    style: TextStyle(
                      fontSize: width * 0.028,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: width * 0.03)),
              Text(
                widget.post.title,
                style: TextStyle(fontSize: width * 0.04),
              ),
              Padding(padding: EdgeInsets.only(bottom: width * 0.03)),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: <Widget>[
                  for (int i = 0; i < widget.post.tags.length; i++)
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(255, 231, 235, 1),
                      ),
                      child: Text(
                        "${widget.post.tags[i].text} ",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 124, 148, 1),
                            fontSize: width * 0.03),
                      ),
                    ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: width * 0.033)),
              Row(
                children: [
                  Text(
                    "${widget.post.writer.univ} ${widget.post.writer.entryYear}학번 ${widget.post.writer.name} ",
                    style: TextStyle(fontSize: width * 0.03),
                  ),
                  Icon(
                    CustomIcons.my_page,
                    size: 14,
                    color: Colors.pink,
                  ),
                  Text(
                    "${widget.post.numOfMember}",
                    style: TextStyle(color: Colors.pink),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.08,
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(top: width * 0.03),
                child: DottedBorder(
                  // strokeCap: StrokeCap.round,
                  dashPattern: [4, 4, 4, 4],
                  // radius: Radius.circular(30),
                  color: Color.fromRGBO(228, 228, 228, 1),
                  strokeWidth: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.08,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextButton(
                      onPressed: () {
                        print("삭제");
                      },
                      child: Text(
                        '대기 취소하기',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 55, 92, 1),
                            fontSize: width * 0.03),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return memberPopup();
          },
        );
      },
    );
  }

  Widget memberPopup() {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Wrap(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: FutureBuilder<List<MeetingMember>>(
              future: meetingMember,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      // print(snapshot.data[index].id);
                      // 미팅멤버 참가자 로직
                      return Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: snapshot.data!.length == index + 1
                                        ? Colors.white
                                        : Colors.grey.shade300))),
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
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 12),
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
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OtherPersonProfileScreen(
                                                userId:
                                                    snapshot.data![index].id)),
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
                    },
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
                      MaterialPageRoute(
                        builder: (context) => MeetingRequest(post: widget.post),
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
