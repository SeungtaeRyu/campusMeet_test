import 'package:flutter/material.dart';
import 'package:campus_meet_test/routes.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import 'find_password_confirmation.dart';


// void main() {
//   runApp(FindPassword());
// }

class FindPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<FindPassword> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<String> univ = ['명지대 인문캠퍼스', "명지대 자연캠퍼스", "단국대", "용인대", "용인대2"];
  Map univ_url = {
    '명지대 인문캠퍼스': 'www.mju.ac.kr',
    '명지대 자연캠퍼스': 'www.mju.ac.kr',
    '단국대': 'www.dankook.ac.kr',
    '용인대': 'www.yongin.ac.kr'
  };

  //이런 느낌?
  //     {{name: 명지, url: www.mju.ac.kr, addr: 서울시},
  //     {name: 용인, url: www.y.ac.kr, addr: 용인}...}

  List<String> search_univ = [];
  List<String> search_univ_result = [];
  List<String> select_univ = [];

  @override
  Widget build(BuildContext context) {
    Color color = Color(0xffff375c);
    print(univ_url.keys.toList());
    // print(search_univ_result);
    //print(search_univ_result.length);
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
        //autovalidateMode: AutovalidateMode.always,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 380,
                        height: 50,
                        // alignment: Alignment(-1.0, 0.0),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '비밀번호 찾기',
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 25),
                        ),
                      ),
                      Container(
                        width: 380,
                        height: 50,
                        alignment: Alignment(-1.0, 0.0),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '가입된 이름(실명)과 이메일을 입력하시면 비밀번호 재설정을 위한 메일을 보내드립니다.',
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ),

                      Form(
                        autovalidateMode: AutovalidateMode.always,
                        key: formkey,
                        child: Column(
                          children: [
                            Container(
                              height: 67,
                              width: 400,
                              margin: EdgeInsets.only(top: 30),
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                  labelText: '이름',
                                ),
                                validator: Validators.compose([
                                  //  Validators.required('Password is required'),
                                  //   Validators.patternString(
                                  //       r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                  //       '8자리이상,숫자,특수문자를 포함해주세요.')
                                ]),
                              ),
                            ),
                            Container(
                              height: 67,
                              width: 400,
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  // focusedBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(color: Colors.red, width: 2.0),
                                  // ),
                                  // focusColor: Colors.grey,
                                  border: OutlineInputBorder(),
                                  labelText: '이메일',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Container(
                  // padding: EdgeInsets.only(bottom: 10),
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Color(0xffff375c),
                      borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(
                    onPressed: () async {
                      print(nameController.text);
                      print(passwordController.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FindPasswordConfirmation()),
                        //color_test   //FindPasswordConfirmation
                      );
                    },
                    child: Text(
                      '임시 비밀번호 발급하기',
                      style: TextStyle(
                          color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}