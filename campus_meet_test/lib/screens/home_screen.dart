import 'package:flutter/material.dart';

import 'notice_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('홈',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.black), onPressed: (){}),
          IconButton(icon: Icon(Icons.notifications_none_outlined, color: Colors.black),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoticeScreen()),
                );
              }),
          IconButton(icon: Icon(Icons.navigate_next, color: Colors.black), onPressed: (){}),
        ],
      ),
      body: Container(
        child: Row(

        ),
      ),
    );
  }
}
