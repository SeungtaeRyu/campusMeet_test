import 'package:campus_meet_test/screens/login/resetPassword.dart';
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
              padding: EdgeInsets.only(bottom: 40),
              child: Center(
                child: Container(

                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.width * 0.35,
                    child: Image.asset('images/campusMeetLogo.png')),
              ), //캠퍼스밋이미지가져와
            ),
            Container(
              // margin:EdgeInsets.only(top: 2) ,
              child: Text(
                '             입력하신 이메일로\n'
                    '비밀번호 재설정 메일이 발송되었어요!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
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
            //test 이메일로 전송된 비밀버놓 재설정 링크타고 들어가면 나오는 화면 가기버튼
            // 추후 삭제
            Container(
              child: FlatButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPassword()),
                  );
                },
                child: Text(
                  '비밀번호 재설정페이지 가기',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xffff375c), fontSize: 13),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}