import 'package:flutter/material.dart';

class MyPageSettingsResignScreen extends StatefulWidget {
  const MyPageSettingsResignScreen({Key? key}) : super(key: key);

  @override
  _MyPageSettingsResignScreenState createState() => _MyPageSettingsResignScreenState();
}

class _MyPageSettingsResignScreenState extends State<MyPageSettingsResignScreen> {
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
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("이름님\n정말 탈퇴하시나요?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              children: [
                Icon(
                  Icons.warning_rounded,
                  color: Colors.pink,
                  size: 22,
                ),
                Text(" 탈퇴 전 주의사항을 꼭 확인해주세요!", style: TextStyle(fontSize: 15, color: Colors.grey)),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 50)),
            Expanded(
              child: RichText(
                  text: TextSpan(text: "탈퇴하실 경우,", style: TextStyle(color: Colors.black, fontSize: 14), children: <TextSpan>[
                TextSpan(text: " 24시간 동안 재가입이 불가능", style: TextStyle(color: Colors.pink)),
                TextSpan(text: "하며 삭제된 "),
                TextSpan(text: "계정은 복구할 수 없습니다. ", style: TextStyle(color: Colors.pink)),
                TextSpan(text: "\n\n탈퇴 시 작성하셨던 "),
                TextSpan(text: "미팅글은 자동 삭제되지 않습니다.", style: TextStyle(color: Colors.pink))
              ])),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                child: Text(
                  "서비스 탈퇴",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade400,
                  elevation: 0, //elevation of button
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
