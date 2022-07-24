import 'package:campus_meet_test/Controller/meetingPostController.dart';
import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:campus_meet_test/models/MeetingPost/post_model.dart';
import 'package:campus_meet_test/models/MeetingPost/meetingMember_model.dart';
import 'package:campus_meet_test/widgets/post_member_popup.dart';
import 'package:flutter/material.dart';

class RenderPostCard extends StatefulWidget {
  const RenderPostCard({Key? key, required this.post, required this.currentPage}) : super(key: key);
  final Post post;
  final String currentPage;

  @override
  _RenderPostState createState() => _RenderPostState();
}

class _RenderPostState extends State<RenderPostCard> {


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
            return MemberPopupScreen(post: widget.post);
          },
        );
      },
    );
  }
}