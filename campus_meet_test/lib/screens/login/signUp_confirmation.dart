import 'package:campus_meet_test/screens/login/signin.dart';
import 'package:flutter/material.dart';


class SignUpConfirmation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignUpConfirmation> {
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
                '회원가입이 완료되었어요!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                ' 로그인해주세요',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14),
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.width * 0.12,
              width: MediaQuery.of(context).size.width * 0.6,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Color(0xffff375c),
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                child: Text(
                  '로그인 페이지로 이동',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}