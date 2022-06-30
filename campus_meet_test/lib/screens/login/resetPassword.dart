import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import 'SignIn_Screen.dart';


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
                        // color: Colors.grey,
                          width: 380,
                          height: 60,
                          alignment: Alignment(-1.0, 0.0),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '비밀번호 재설정',
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 22),
                          )),

                      Container(
                        //  color: Colors.grey,
                          width: 380,
                          //height: 60,
                          //  alignment: Alignment(-1.0, 0.0),
                          margin: EdgeInsets.only(top: 40, left: 10),
                          child: Text(
                            '새 비밀번호 입력',
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                // fontWeight: FontWeight.w500,
                                fontSize: 14),
                          )),
                      Container(
                        //  color: Colors.grey,
                        //signin 65
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextFormField(
                          //비밀번호 조건
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            //border: OutlineInputBorder(),
                              labelText: 'Password'),
                          validator: Validators.compose([
                            Validators.required('Password is required'),
                            Validators.patternString(
                                r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                '8자리이상,숫자,특수문자를 포함해주세요.')
                          ]),
                        ),
                      ),
                      Container(
                        //비밀번호확
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordEController,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                              labelText: 'Password'),
                          //validateEPassword:
                          validator: (value) {
                            //애러메세지 띄워
                            if (value == passwordController.text) {
                              //print("비밀번호가 일치합니다");
                            } else {
                              //print('비밀번호가 일치하지 않습니다벨');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color(0xffff375c),
                  borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  if (formkey.currentState!.validate() &&
                      passwordController.text == passwordEController.text) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SignInPage()));
                    print("Validated");
                  } else {
                    print("Not Validated");
                  }
                },
                child: Text(
                  '회원가입',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}