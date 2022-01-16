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
              icon: Icon(Icons.home_outlined, size: 24),
              child: Text('홈', style: TextStyle(fontSize: 9)),
            ),
            Tab(
              icon: Icon(Icons.calendar_today_outlined, size: 18),
              child: Text('나의 미팅', style: TextStyle(fontSize: 9)),
            ),
            Tab(
              icon: Icon(Icons.person_outline_rounded, size: 24),
              child: Text('마이페이지', style: TextStyle(fontSize: 9)),
            ),
          ],
        ),
      ),
    );
  }
}
