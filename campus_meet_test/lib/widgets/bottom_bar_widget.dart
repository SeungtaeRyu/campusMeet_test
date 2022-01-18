import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 60,
        child: const TabBar(
          labelColor: Colors.pink,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            Tab(
              icon: Icon(CustomIcons.home, size: 24),
              child: Text('홈', style: TextStyle(fontSize: 9)),
            ),
            Tab(
              icon: Icon(CustomIcons.my_meeting, size: 24),
              child: Text('나의 미팅', style: TextStyle(fontSize: 9)),
            ),
            Tab(
              icon: Icon(CustomIcons.my_page, size: 24),
              child: Text('마이페이지', style: TextStyle(fontSize: 9)),
            ),
          ],
        ),
      ),
    );
  }
}
