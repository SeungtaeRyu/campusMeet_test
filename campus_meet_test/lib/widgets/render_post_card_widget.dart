import 'package:campus_meet_test/Controller/meetingPostController.dart';
import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:campus_meet_test/models/MeetingPost/Post_model.dart';
import 'package:campus_meet_test/models/MeetingPost/meetingMember_model.dart';
import 'package:campus_meet_test/screens/home/otherPersonProfile_screen.dart';
import 'package:flutter/material.dart';

class RenderPostCard extends StatefulWidget {
  const RenderPostCard({Key? key, required this.post, required this.currentPage}) : super(key: key);
  final Post post;
  final String currentPage;

  @override
  _RenderPostState createState() => _RenderPostState();
}

class _RenderPostState extends State<RenderPostCard> {
  late Future<List<MeetingMember>> meetingMember;

  @override
  void initState() {
    super.initState();
    meetingMember = getMeetingMember(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
        padding: EdgeInsets.all(15),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.title,
              style: TextStyle(fontSize: 16),
            ),
            Padding(padding: EdgeInsets.only(bottom: 5)),
            Text(
              "${widget.post.location.cityStateName} ${widget.post.location.cityCountryName} · ${widget.post.createdAt}",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                for (int i = 0; i < widget.post.tags.length; i++)
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200,
                    ),
                    child: Text("${widget.post.tags[i].text} "),
                  ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              children: [
                Text(
                  "${widget.post.writer.univ} ${widget.post.writer.entryYear}학번 ${widget.post.writer.name} ",
                  style: TextStyle(fontSize: 14),
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
          ],
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
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: snapshot.data!.length == index + 1 ? Colors.white : Colors.grey.shade300))),
                        child: Row(
                          children: [
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
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.grey.shade500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
        // 홈, 필터에서 부를 시

        // Container(
        //   color: Colors.white,
        //   height: 30,
        //   // padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       OutlinedButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => MeetingRequest(data: meetingPosts[index])),
        //           );
        //         },
        //         style: OutlinedButton.styleFrom(
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(20),
        //             ),
        //             side: BorderSide(color: Colors.pink)),
        //         child: Text(
        //           " 미팅 신청 ",
        //           style: TextStyle(color: Colors.pink, height: 1),
        //         ),
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
