import 'package:flutter/material.dart';

class MyPageNoticeDetailScreen extends StatelessWidget {
  final content;
  const MyPageNoticeDetailScreen({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text('공지사항', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: Container(
        child: Text(content),
      ),
    );
  }
}
