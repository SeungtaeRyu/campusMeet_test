import 'package:flutter/material.dart';

class MyPageSettinsScreen extends StatefulWidget {
  const MyPageSettinsScreen({Key? key}) : super(key: key);

  @override
  _MyPageSettinsScreenState createState() => _MyPageSettinsScreenState();
}

class _MyPageSettinsScreenState extends State<MyPageSettinsScreen> {
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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.fromLTRB(20, 30, 10, 30),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(
                    padding: EdgeInsets.zero, // 아이콘 패딩 설정
                    constraints: BoxConstraints(), // constraints
                    onPressed: () {
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  ),
                ],
              )
          );
        },
      ),
    );
  }
}
