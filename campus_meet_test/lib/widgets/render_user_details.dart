import 'package:blur/blur.dart';
import 'package:campus_meet_test/controller/user_controller.dart';
import 'package:campus_meet_test/models/User/find_user_by_id_model.dart';
import 'package:campus_meet_test/screens/myPage/myPage_edit.dart';
import 'package:campus_meet_test/widgets/carousel_slider_widget.dart';
import 'package:campus_meet_test/widgets/render_user_details_more_info_widget.dart';
import 'package:flutter/material.dart';

class RenderUserDetails extends StatefulWidget {
  const RenderUserDetails({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  _RenderUserDetailsState createState() => _RenderUserDetailsState();
}

class _RenderUserDetailsState extends State<RenderUserDetails> {
  late Future<FindUserById> searchedUser;

  // 추후 본인 정보 로컬?에서 읽어올 때 추가 정보 입력했는지 여부로 true / false 하기
  final bool isAddInfo = true;

  @override
  void initState() {
    super.initState();

    searchedUser = getUserById();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FindUserById>(
        future: searchedUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Column(
                children: <Widget>[
                  Container(height: MediaQuery.of(context).viewPadding.top),
                  Container(
                    height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top,
                    child: Stack(
                      children: <Widget>[
                        CarouselImage(searchedUser: snapshot.data!),
                        TopBar(),
                        Positioned(
                          bottom: 0,
                          child: isAddInfo
                              ? RenderUserDetailsMoreInfo(searchedUser: snapshot.data!)
                              : RenderUserDetailsMoreInfo(searchedUser: snapshot.data!).blurred(
                                  blur: 10,
                                  borderRadius: BorderRadius.circular(25),
                                  overlay: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${snapshot.data!.name}",
                                            style: TextStyle(color: Colors.pink, fontSize: 15, fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "님의 프로필을 더 완성해주세요!",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "(추가 프로필을 작성해야 열람할 수 있습니다)",
                                        style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                                      ),
                                      OutlinedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => MyPageEditScreen()),
                                            );
                                          },
                                          style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), side: BorderSide(color: Colors.pink)),
                                          child: Text(
                                            "정보 입력하기",
                                            style: TextStyle(color: Colors.pink, height: 1),
                                          ))
                                    ],
                                  )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
