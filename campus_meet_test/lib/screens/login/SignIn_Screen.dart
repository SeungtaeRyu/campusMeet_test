import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import '../../main.dart';
import 'findPassword_screen.dart';
import 'University_setting_screen.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignInPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "* 필수";
    } else if (value.length < 8) {
      return "비밀번호는 8자리 이상입니다.";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formkey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 40) ,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                      child: Container(
                          width: 138,
                          height: 126,
                          child: Image.asset('images/campusMeetLogo.png')),
                    ), //캠퍼스밋이미지가져와
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 46,
                    child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder( borderRadius: BorderRadius.circular(31.0)),
                            //labelText: 'Email',
                            hintText: '이메일'),
                        validator: MultiValidator([
                          // RequiredValidator(errorText: "* Required"),
                          // EmailValidator(errorText: "Enter valid email id"),
                        ])
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 6, bottom: 0),
                  child: Container(
                    height: 46,
                    child: TextFormField(
                      obscureText: true,
                      //controller: passwordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(31.0)),
                          //  labelText: 'Password',
                          hintText: '비밀번호'),
                      validator: Validators.compose([
                        //  Validators.required('Password is required'),
                        //   Validators.patternString(
                        //       r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                        //       '8자리이상,숫자,특수문자를 포함해주세요.')
                      ]),
                      //validatePassword,        //Function to check validation
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FindPassword()),
                      );
                      //SignUpScreen
                      //요기서 화면 바 SettingUnivPage() RadioApp() DropDown()
                      //signup screen
                    },
                    child: Text('비밀번호 찾기'),
                  ),
                ),
                Container(
                  height: 50,
                  width: 340,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: Color(0xffff375c),
                      borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(
                    onPressed: () {
                      //print(nameController.text);
                      //print(passwordController.text);
                      isLogined = true;
                      // if (formkey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MyApp()));
                      //   print("Validated"); // 사용자 정보 맞았을때 넘어가야하는데
                      //                       //지금은 구현 못하는게 맞는지? 일단 했다 치고
                      // } else {
                      //   print("Not Validated");
                      // }
                    },
                    child: Text(
                      '로그인',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Column(
                      children: <Widget>[
                        Text('처음 오셨나요?'),
                        FlatButton(
                          //textColor: Colors.pinkAccent,
                          child: Text(
                            '회원가입 하러가기 🐾',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingUnivPage()),
                            );
                            //SignUpScreen
                            //요기서 화면 바 SettingUnivPage() RadioApp() DropDown()
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))


              ],
            )),
      ),
    );
  }
}