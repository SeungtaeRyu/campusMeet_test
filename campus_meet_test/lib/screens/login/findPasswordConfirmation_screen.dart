import 'package:flutter/material.dart';

class FindPasswordConfirmation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<FindPasswordConfirmation> {
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
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 50),
              child: Center(
                child: Container(
                    width: 138,
                    height: 126,
                    child: Image.asset('asset/campusMeetLogo.png')),
              ), //캠퍼스밋이미지가져와
            ),
            Container(
              margin:EdgeInsets.only(top: 2) ,
              child: Text(
                '             입력하신 이메일로\n'
                    '비밀번호 재설정 메일이 발송되었어요!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '메일이 보이지 않으면 스팸함을 확인해주세요',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}