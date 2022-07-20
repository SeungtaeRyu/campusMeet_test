import 'package:campus_meet_test/models/Auth/SiginIn_model.dart';
import 'package:campus_meet_test/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import '../../main.dart';
import 'University_setting_screen_test.dart';
import 'University_setting_screen_test2.dart';
import 'findPassword_screen.dart';
import 'University_setting_screen.dart';
import 'package:http/http.dart' as http;

//에러 url 없어서 그런건지

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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void requestLogIn(String email, String password) async {
    print(email);

    SignIn responseBody =
        SignIn.fromJson({'email': email, 'password': password});
    print(email);
    final url = Uri.parse(
      // 'http://localhost:3000/api/v1/auth/signIn',
    'https://jsonplaceholder.typicode.com/users'
    );

    final response = await http.post(url, body: responseBody.toJson());
    print(password);

    if (response.statusCode == 201) { //코드 201 맞는지 확인하기
      // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
      print('Response status: ${response.statusCode}');
      //홈화면으로 가는 materialPage~?//

    } else {
      // 만약 요청이 실패하면, 에러를 던집니다.
      print("로그인 실패");
      //로그인 실패 팝업 띄우기!! 승태님은 return이 더 적절하다고 생각한다.
      // throw Exception('Failed to login');
    }
    // print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formkey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          height: MediaQuery.of(context).size.width * 0.33,
                          child: Image.asset('images/campusMeetLogo.png')),
                    ), //캠퍼스밋이미지가져와
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.width * 0.12,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(31.0)),
                        hintText: '이메일',
                        hintStyle: TextStyle(height: 0.7)),
                    validator: MultiValidator(
                      [
                        // RequiredValidator(errorText: "* Required"),
                        // EmailValidator(errorText: "Enter valid email id"),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 6)),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  height: MediaQuery.of(context).size.width * 0.12,
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(31.0)),
                        //  labelText: 'Password',
                        hintText: '비밀번호',
                        hintStyle: TextStyle(height: 0.7)),
                    validator: Validators.compose([
                      //  Validators.required('Password is required'),
                      //   Validators.patternString(
                      //       r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                      //       '8자리이상,숫자,특수문자를 포함해주세요.')
                    ]),
                    //validatePassword,        //Function to check validation
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FindPassword()),
                      );
                      //SignUpScreen
                      //요기서 화면 바 SettingUnivPage() RadioApp() DropDown()
                      //signup screen
                    },
                    child: Text(
                      '비밀번호 찾기',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.15,
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: Color(0xffff375c),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      //print(nameController.text);
                      //print(passwordController.text);

                      MaterialPageRoute(builder: (context) => const HomeScreen());
                      isLogined = true;
                      requestLogIn(
                          emailController.text, passwordController.text);
                      // if (formkey.currentState!.validate()) {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => MyApp()));
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('처음 오셨나요?'),
                        TextButton(
                          //textColor: Colors.pinkAccent,
                          child: Text(
                            '회원가입 하러가기 🐾',
                            style: TextStyle(fontSize: 20, color: Colors.black),
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
                    ))
              ],
            )),
      ),
    );
  }
}
