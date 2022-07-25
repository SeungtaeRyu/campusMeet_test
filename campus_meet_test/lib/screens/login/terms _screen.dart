import 'package:campus_meet_test/widgets/terms_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SignIn_Screen.dart';

class TermsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<TermsPage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    Color color = Color(0xffff375c);
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
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                            height: MediaQuery.of(context).size.width * 0.18,
                            width: MediaQuery.of(context).size.width * 0.9,
                            // alignment: Alignment(-1.0, 0.0),
                            margin:
                                EdgeInsets.only(right: 1, bottom: 10, top: 10),
                            child: Text(
                              '이제 정말 끝! \n'
                              '이용 약관 동의 부탁드립니다🤗',
                              //textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25),
                            )),
                        Row(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.11,
                              width: MediaQuery.of(context).size.width * 0.11,
                              // width: double.infinity, // <-- match_parent
                              // height: double.infinity, // <-- match-parent
                              child: TextButton(
                                onPressed: () {},
                                child: Image.asset('images/disagree.png'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              height: MediaQuery.of(context).size.width * 0.07,
                              width: MediaQuery.of(context).size.width * 0.38,
                              child: Text(
                                '전체 동의합니다.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 10, right: 7, left: 7, bottom: 10),
                          height: MediaQuery.of(context).size.width * 0.002,
                          width: MediaQuery.of(context).size.width * 1,
                          color: Colors.grey,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              //안쓰는게 좋을듯! icon으로받을거
                              height: MediaQuery.of(context).size.width * 0.11,
                              width: MediaQuery.of(context).size.width * 0.11,
                              // width: double.infinity, // <-- match_parent
                              // height: double.infinity, // <-- match-parent
                              child: TextButton(
                                onPressed: () {},
                                child: Image.asset('images/disagree.png'),
                              ),
                            ),
                            TermText(content: '이용약관 동의'),

                            Container(
                              margin: EdgeInsets.only(top: 5),
                              height: MediaQuery.of(context).size.width * 0.07,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text(
                                '(필수)',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),

                            IconButton(
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.11,
                              width: MediaQuery.of(context).size.width * 0.11,
                              // width: double.infinity, // <-- match_parent
                              // height: double.infinity, // <-- match-parent
                              child: TextButton(
                                onPressed: () {},
                                child: Image.asset('images/disagree.png'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              height: MediaQuery.of(context).size.width * 0.07,
                              width: MediaQuery.of(context).size.width * 0.38,
                              child: Text(
                                '개인정보 수집.이용 동의',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              height: MediaQuery.of(context).size.width * 0.07,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text(
                                '(필수)',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.11,
                              width: MediaQuery.of(context).size.width * 0.11,
                              // width: double.infinity, // <-- match_parent
                              // height: double.infinity, // <-- match-parent
                              child: TextButton(
                                onPressed: () {},
                                child: Image.asset('images/disagree.png'),
                              ),
                            ),
                            Container(
                              // color: Colors.blue,
                              margin: EdgeInsets.only(top: 5),
                              height: MediaQuery.of(context).size.width * 0.07,
                              width: MediaQuery.of(context).size.width * 0.48,
                              child: Text(
                                'SNS / 이메일 정보 수신 동의',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              height: MediaQuery.of(context).size.width * 0.07,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Text(
                                '(선택)',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  //다음 버튼
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    // padding: EdgeInsets.only(bottom: 10),
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(250, 191, 191, 191),
                        borderRadius: BorderRadius.circular(10)),

                    child: FlatButton(
                      // style: ElevatedButton.styleFrom(
                      //     primary: certificationNumber.text != ""
                      //         ? Color(0xffff375c)
                      //         : Color.fromARGB(250, 191, 191, 191)),
                      onPressed: () async {
                        //  if () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                        print("Validated");
                        // } else {
                        //   print("Not Validated");
                        // }
                      },
                      child: Text(
                        '다음',
                        // style: TextStyle(
                        //   color: certificationNumber.text != ""
                        //       ? Colors.white
                        //       : Colors.grey,
                        // ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
//
