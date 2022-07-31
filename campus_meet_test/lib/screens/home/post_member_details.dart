import 'package:blur/blur.dart';
import 'package:campus_meet_test/widgets/carousel_slider_widget.dart';
import 'package:campus_meet_test/widgets/render_other_person_profile_widget.dart';
import 'package:flutter/material.dart';

class OtherPersonProfileScreen extends StatefulWidget {
  const OtherPersonProfileScreen({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  _OtherPersonProfileScreenState createState() => _OtherPersonProfileScreenState();
}

class _OtherPersonProfileScreenState extends State<OtherPersonProfileScreen> {
  final bool isAddInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(height: MediaQuery.of(context).viewPadding.top),
          Container(
           // color: Colors.yellow,
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top,
            child: Stack(
              children: <Widget>[
                CarouselImage(userId: widget.userId),
                TopBar(),
                Positioned(
                  bottom: 0,
                  child: isAddInfo
                      ? RenderOtherPersonProfile(userId: widget.userId)
                      : RenderOtherPersonProfile(userId: widget.userId).blurred(
                          blur: 10,
                          borderRadius: BorderRadius.circular(25),
                          overlay: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "이름",
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
                                  onPressed: () {},
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
