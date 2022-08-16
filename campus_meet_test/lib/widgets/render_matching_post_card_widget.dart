import 'package:campus_meet_test/Controller/meetingPost_controller.dart';
import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:campus_meet_test/models/MeetingPost/post_model.dart';
import 'package:campus_meet_test/models/MeetingPost/meeting_member_model.dart';
import 'package:campus_meet_test/screens/home/home_meeting_request.dart';
import 'package:campus_meet_test/widgets/render_user_details.dart';
import 'package:campus_meet_test/widgets/popup_post_member_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/rendering.dart';

class MeetingMatchingPostCard extends StatefulWidget {
  const MeetingMatchingPostCard({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  _RenderRequestPostState createState() => _RenderRequestPostState();
}

class _RenderRequestPostState extends State<MeetingMatchingPostCard> {
  // late Future<List<MeetingMember>> meetingMember;
   Future<List<MeetingMember>> ? meetingMember;
  @override
  void initState() {
    print(widget.post.id);
    meetingMember = getMeetingMember(widget.post.id);
    super.initState();
  }
   int _currentPage = 0;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.pinkAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    offset: Offset(2, 5), // Shadow position
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.width * 0.058,
              width: MediaQuery.of(context).size.width * 0.16,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: width * 0.008, top:width * 0.3 )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                      height: MediaQuery.of(context).size.width * 0.03,
                      child: Image.asset('images/play.png')), //<-- 하트로 바꾸기
                  Padding(padding: EdgeInsets.only(right: width * 0.01)),
                  Text(
                    '매칭중',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.03,
                        height: 1.6),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Text(
              widget.post.title,
              style: TextStyle(fontSize: 16),
            ),
            Padding(padding: EdgeInsets.only(bottom: 5)),
            Text(
              "${widget.post.location.stateName} ${widget.post.location.cityName} · ${widget.post.createdAt}",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Wrap(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                  child: FutureBuilder<List<MeetingMember>>(
                    future: meetingMember,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.width * 0.38,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index){
                                return Container(
                                  width: MediaQuery.of(context).size.width * 0.32,
                                  height: MediaQuery.of(context).size.width * 0.2,
                                 padding: EdgeInsets.fromLTRB(20, 0, 10, 1),
                                 //     이름, 대학교, 학번 렌더링
                                      child: Expanded(
                                        child: Column(
                                         // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.42,
                                              height: MediaQuery.of(context).size.width * 0.2,
                                              decoration: const BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  topLeft: Radius.circular(10),
                                                ),
                                              ),
                                            ),
                                            Container(),
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
                                  margin: EdgeInsets.only(
                                      right: width * 0.01, left: width * 0.01),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        offset: const Offset(8, 14),
                                        blurRadius: 5.0,
                                      )
                                    ],
                                  ),

                                      // 상대방 프로필 상세보기
                                      // Container(
                                      //   child: IconButton(
                                      //     padding: EdgeInsets.zero, // 아이콘 패딩 설정
                                      //     constraints: BoxConstraints(),
                                      //     onPressed: () {
                                      //       // 상대프로필 페이지로 이동
                                      //       print(snapshot.data![index].id);
                                      //       Navigator.push(
                                      //         context,
                                      //         MaterialPageRoute(builder: (context) => RenderUserDetails(userId: snapshot.data![index].id)),
                                      //       );
                                      //     },
                                      //     icon: Icon(
                                      //       Icons.arrow_forward_ios_rounded,
                                      //       size: 14,
                                      //     ),
                                      //   ),
                                      // ),

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
            Padding(padding: EdgeInsets.only(bottom: 20)),
    //여기에 채팅 버튼
          ],
        ),
      ),
    );
  }

}
