import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:campus_meet_test/routes.dart';
import 'package:flutter/services.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import 'signup.dart';

class CheckUnivPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<CheckUnivPage> {
  TextEditingController userUnivEmailController = TextEditingController();
  TextEditingController certificationNumber = TextEditingController();
  List<String> certificationNumberList = [];

  late String univEmail;

  bool visibility = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments != null) {
      univEmail = arguments["univEmail"] as String;
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    double width = MediaQuery.of(context).size.width;
    Color color = Color(0xffff375c);
    // var select_univ;
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
                        // color: Colors.red,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.width * 0.25,
                        alignment: Alignment(-1.0, 0.0),
                        padding: EdgeInsets.only(left: 10, bottom: 30),
                        child: Text(
                          '대학교 확인을 위해 \n'
                          '학교 이메일 인증이 필요해요!',
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 25),
                        )),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.15,
                      // color: Colors.red,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      //padding: EdgeInsets.only(right: ),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 10, bottom: 10)),
                          Expanded(
                            // height: 60,
                            // width: 150,
                            // padding: EdgeInsets.all(10),

                            child: TextFormField(
                              // autofocus: false,
                              onChanged: (text) {
                                setState(
                                  () {
                                    //userUnivEmailController.text = text;
                                  },
                                );
                              },
                              controller: userUnivEmailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Expanded(
                            // 학교이메일 형식
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '@$univEmail.ac.kr',
                              ),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: userUnivEmailController.text != ""
                                      ? Color(0xffff375c)
                                      : Color.fromARGB(250, 191, 191, 191)),
                              onPressed: () {
                                setState(() {
                                  visibility = true;
                                  //  certificationNumberList.add(certificationNumber.text);
                                });
                                // print(certificationNumberList);

                                String userUnivEmail =
                                    userUnivEmailController.text +
                                        '@$univEmail.ac.kr';
                                print(userUnivEmail); //얘를 뒤페이지로 보내야한다는거쥐
                                //userUnivEmail 로 확인 이메일 보내기
                                //인증번호 입력칸 뜨기
                              },
                              child: Text(
                                '전송',
                                style: TextStyle(
                                  color: userUnivEmailController.text != ""
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: width * 0.035
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: visibility,
                      child: Column(
                        children: [
                          Form(
                            autovalidateMode: AutovalidateMode.always,
                            key: formkey,
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              margin: const EdgeInsets.only(
                                  left: 0.0, right: 0.0, bottom: 10.0),
                              child: TextFormField(
                                //autofocus: true,
                                onChanged: (text_2) {
                                  if (certificationNumber.text.length > 5) {
                                    setState(() {});
                                  }
                                },
                                controller: certificationNumber,
                                decoration: InputDecoration(
                                  suffixIcon: Container(
                                    padding: EdgeInsets.only(top: 10, right: 10),
                                    child: TweenAnimationBuilder<Duration>(
                                        duration: Duration(minutes: 3),
                                        tween: Tween(
                                            begin: Duration(minutes: 3),
                                            end: Duration.zero),
                                        onEnd: () {
                                          setState(() {
                                            visibility = false;
                                          });
                                        },
                                        builder: (BuildContext context,
                                            Duration value, Widget? child) {
                                          final minutes = value.inMinutes;
                                          var seconds = value.inSeconds % 60;
                                          var underTenSecond = seconds.toString();
                                          if (seconds < 10) {
                                            underTenSecond =
                                                ("0" + underTenSecond) as String;
                                          }
                                          ;
                                          return Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 5),
                                              child: Text(
                                                  '0$minutes:$underTenSecond',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color(0xffff375c),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15)));
                                        }),
                                  ),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  // contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                                  border: OutlineInputBorder(),
                                ),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                                // validator: Validators.compose([
                                //   Validators.required(
                                //       ''),
                                //   Validators.patternString(
                                //       r'^(?=.*?[0-9]).{6,6}$', '인증번호는 6자리 입니다.')
                                // ]),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]')), //숫자만 가능
                                  LengthLimitingTextInputFormatter(6)
                                ],
                              ),
                            ),
                          ),
                        Container(
                          height: MediaQuery.of(context).size.width * 0.17,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text("인증번호를 발송했습니다.\n인증번호가 오지 않는다면 입력하신 정보가 정확한지 확인해 주세요."
                              "\n이미 가입된 이메일이거나, 가상 이메일은 인증번호를 받을 수 없습니다."
                          ,  style: TextStyle(fontSize: width*0.032,color: Colors.pinkAccent)
                          ),
                        ),
                        ],
                      ),
                    ),
                  ],
                ))),
                Container(
                  //다음 버튼
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    // padding: EdgeInsets.only(bottom: 10),
                    height: MediaQuery.of(context).size.width * 0.14,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(250, 191, 191, 191),
                        borderRadius: BorderRadius.circular(10)),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: certificationNumber.text != ""
                              ? Color(0xffff375c)
                              : Color.fromARGB(250, 191, 191, 191)),
                      onPressed: () async {
                        print(certificationNumber.text);
                        if (formkey.currentState!.validate()
                            //   && certificationNumber.text == certificationNumber.text
                            ) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SignUpScreen()));
                          print("Validated");
                        } else {
                          print("Not Validated");
                        }
                      },
                      child: Text(
                        '다음',
                        style: TextStyle(
                          color: certificationNumber.text != ""
                              ? Colors.white
                              : Colors.grey,
                        ),
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
