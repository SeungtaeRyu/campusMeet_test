import 'package:campus_meet_test/screens/login/reset_password_confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import 'signIn_screen.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<ResetPassword> {
  TextEditingController passwordEController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    //  Color color = Color(0xffff375c);

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
        child: Column(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: formkey,
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.width * 0.15,
                          child: Text(
                            '비밀번호 재설정',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 22),
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        // margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "새 비밀번호 입력",
                              style: TextStyle(
                                  // backgroundColor: Colors.red,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.08,
                              child: TextFormField(
                                //비밀번호 조건
                                obscureText: true,
                                controller: passwordController,
                                // // decoration: InputDecoration(
                                // //     //border: OutlineInputBorder(),
                                // //     labelText: '새 비밀번호 입력'),
                                // validator: Validators.compose([
                                //   Validators.required('Password is required'),
                                //   Validators.patternString(
                                //       r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                //       null;)
                                // ]),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  } else {
                                    final RegExp regex = RegExp(
                                        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$');
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          //  color: Colors.grey,
                          width: MediaQuery.of(context).size.width * 0.9,
                          //height: 60,
                          //  alignment: Alignment(-1.0, 0.0),
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            '- 8자 이상 입력 \n- 영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합',
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey,
                                // fontWeight: FontWeight.w500,
                                fontSize: 12),
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.only(top: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "새 비밀번호 확인",
                                style: TextStyle(
                                    // backgroundColor: Colors.red,
                                    color: Colors.black,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.08,
                                child: TextFormField(
                                  obscureText: true,
                                  controller: passwordEController,
                                  // decoration: InputDecoration(
                                  //     // border: OutlineInputBorder(),
                                  //     labelText: '새 비밀번호 확인'),
                                  //validateEPassword:
                                  validator: (value) {
                                    //애러메세지 띄워
                                    if (value == passwordController.text) {
                                      print("비밀번호가 일치합니다");
                                    } else {
                                      print('비밀번호가 일치하지 않습니다벨');
                                    }
                                  },
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.13,
              decoration: BoxDecoration(
                  color: Color(0xffff375c),
                  borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {
                  if (formkey.currentState!.validate() &&
                      passwordController.text == passwordEController.text) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ResetPasswordConfirmation()));
                    print("Validated");
                  } else {
                    print("Not Validated");
                  }
                },
                child: Text(
                  '확인',
                  style: TextStyle(color: Colors.white, fontSize: 21),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
