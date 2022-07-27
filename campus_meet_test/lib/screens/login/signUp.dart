import 'package:campus_meet_test/screens/login/terms%20.dart';
import 'package:flutter/material.dart';
import 'package:campus_meet_test/main.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
enum Gender { WOMEN, MAN }

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController univ_id = TextEditingController();
  TextEditingController entry_year = TextEditingController();
  TextEditingController sex = TextEditingController(); //라디오버튼?
  TextEditingController id = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController passwordEController = TextEditingController();
  TextEditingController nick_name = TextEditingController();
  TextEditingController introduce_text = TextEditingController();
  TextEditingController born_year = TextEditingController(); // 생년월일 하나로 받아간다!

  // final RegExp _regExp = RegExp(r'[\uac00-\ud7af]', unicode: true);
  // 안쓰는거 지워 !
  String montDropdownvalue = '1';
  String dayDropdownvalue = '1';
  Gender? _gender = Gender.MAN;

  @override
  void initState() {
    super.initState();

    name = TextEditingController();
  }
  void _signUpPost() async {
    var url = Uri.parse(
      'https://raw.githubusercontent.com/dev-yakuza/users/master/api.json',
    );
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    url = Uri.parse('https://reqbin.com/sample/post/json');
    response = await http.post(url, body: {
      "email":id.toString(),
      "name": name.toString(),
      "entryYear" : entry_year.toString(),
      "nickname" : nick_name.toString(),
      "pwd" : pwd.toString(),
      "birthDate" : "2000-01-01", //전처리 born_year + '-' + ..
      "sex" : "M",// "성별, F/M"
      "univ_id" : 1
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    Color color = Color(0xffff375c);
    //https://kor.pakostnici.com/408272-how-to-select-birth-date-ZRRTII 날짜 관련 참고
    List month = [];
    for (int i = 1; i < 13; i++) {
      String ii = i.toString();
      month.add(ii);
    }
    List day = [];
    for (int i = 1; i < 32; i++) {
      String ii = i.toString();
      day.add(ii);
    } //1 3 5 7 8 10 12 <- 31일
    //2월은? 2개?
    //4 6 9 11 <- 30일
    String? validateEPassword(String? value) {
      if (value != pwd) {
        // The user haven't typed anything
        return "비밀번호가 일치하지 않습니다~.";
      } else {
        return null;
      }
    }

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
                  height: MediaQuery.of(context).size.width * 0.14,
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment(-1.2, 0.0),
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    '거의 다 왔어요! \n회원정보를 입력해주세요!🐣',
                    //textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                  )),

              Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                // padding: EdgeInsets.all(10),
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[ㄱ-ㅎ|가-힣|ㆍ|ᆢ]')),
                    LengthLimitingTextInputFormatter(7)
                  ],
                  controller: name,
                  decoration: InputDecoration(
                    //  border: OutlineInputBorder(),
                    labelText: '이름',
                    hintText: '실명으로 입력해주세요',
                      hintStyle: TextStyle(height: 0.7)
                  ),
                  autovalidateMode: AutovalidateMode.always,
                  onChanged: (dynamic val) {},
                  validator: Validators.compose([
                    // Validators.required('Name is required'),
                    // Validators.patternString(
                    //      r'^(?=.*?[ㄱ-힣]).{2,8}$', //한국어 검사는 없어? 최댓값지정해야하나? //pass
                    //      '이름을 입력해주세요')
                  ]),

                ),
              ),

              // padding: EdgeInsets.all(10),
              // child: TextFormField(
              //   controller: name,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: '이름',
              //   ),
              //   validator: Validators.compose([
              //     Validators.required('Password is required'),
              //     Validators.patternString(
              //         r'^(?=.*?[ㄱ-힣]).{2,5}$', //한국어 검사는 없어? 최댓값지정해야하나? //pass
              //         '이름을 입력해주세요')
              //   ]),
              // ),
              //이름

              // 학번 입력받을때 숫자패드만 보이게 아래 참고
              // https://stackoverflow.com/questions/49577781/how-to-create-number-input-field-in-flutter
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2)
                  ],
                  keyboardType: TextInputType.number, //안뜨는데?
                  controller: entry_year,
                  decoration: InputDecoration(
                    //   border: OutlineInputBorder(),
                    labelText: '학번', //텍스트필드말고 숫자만?데 두자리?
                      hintText: '숫자만 입력해주세요 ex)21',
                      hintStyle: TextStyle(height: 0.7)
                  ),
                  validator: Validators.compose([
                    Validators.required('입학년도 2자리 입니다.')
                    // Validators.patternString(
                    //     r'^(?=.*?[0-9]).{1,2}$', '압헉년도 2자리입니다.')
                  ]),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: nick_name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[ㄱ-ㅎ|가-힣|ㆍ|ᆢ|a-z|A-Z]')),
                    LengthLimitingTextInputFormatter(7)
                  ],
                  decoration: InputDecoration(
                    //  border: OutlineInputBorder(),
                    labelText: '별명', //별명이 필수인가?
                  ),
                  validator: Validators.compose([
                    Validators.required('영문 또는 한글 최대 7글자')
                  ]),

                ),
              ),
              Container(
                //signin 65
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    TextFormField(
                      //비밀번호 조건
                      obscureText: true,
                      controller: pwd,
                      decoration: InputDecoration(
                        //  border: OutlineInputBorder(),
                          labelText: '비밀번호'),
                      // validator: Validators.compose([
                      //   Validators.required('Password is required'),
                      //   Validators.patternString(
                      //       r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                      //       '8자리이상,숫자,특수문자를 포함해주세요.')
                      // ]),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")), //수정
                        // LengthLimitingTextInputFormatter(7)
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 1),
                      alignment: Alignment(-0.9, 0.0),
                      child: Text(
                        "- 8자 이상 입력 \n- 영문/숫자/특수문자(공백제외)만 허용하며, 2개 이상 조합",
                        //textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    )
                  ],
                  ),

              ),
              Container(
                //비밀번호확
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordEController,
                  decoration: InputDecoration(
                    //  border: OutlineInputBorder(),
                      labelText: '비밀번호 확인'),
                  //validateEPassword:
                  validator: (value) {
                    //애러메세지 띄워
                    if (value == pwd.text) {
                      //print("비밀번호가 일치합니다");
                    } else {
                      //print('비밀번호가 일치하지 않습니다벨');
                    }
                  },
                ),
              ),
              //비밀번호 확인
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      //padding설
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4)
                        ],
                        keyboardType: TextInputType.number,
                        controller: born_year,
                        decoration: InputDecoration(
                          //  border: OutlineInputBorder(),
                          labelText: '출생년도',
                        ),
                        validator: Validators.compose([
                          Validators.required('출생년도를 입력해주세요'),
                          Validators.patternString(
                              r'^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)].{3,4}$',
                              'ex) 1999')
                        ]),
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Center(
                          child: DropdownButton(
                            value: montDropdownvalue,
                            items: month.map((month) {
                              return DropdownMenuItem(
                                  value: month, child: Text(month));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                montDropdownvalue = newValue as String;
                              });
                            },
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: DropdownButton(
                            value: dayDropdownvalue,
                            items: day.map((day) {
                              return DropdownMenuItem(
                                  value: day, child: Text(day));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                dayDropdownvalue = newValue as String;
                              });
                            },
                          ),
                        )),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: ListTile(
                      title: const Text('여성'),
                      leading: Radio<Gender>(
                        value: Gender.WOMEN,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ListTile(
                      title: const Text('남성'),
                      leading: Radio<Gender>(
                        value: Gender.MAN,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
// https://api.flutter.dev/flutter/material/Radio-class.html 값을 어떻게 갖고오
              Container(
                // color: Colors.red,
                // 회원가입 조건 하나라도 누락 시 색 죽은색/ 조건 무두 완료시 빨
                height: MediaQuery.of(context).size.width * 0.14,
                width: MediaQuery.of(context).size.width * 0.9,
                // padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.only(top:30),
                decoration: BoxDecoration(
                    color: Color(0xffff375c),
                    borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  // padding: EdgeInsets.only(top: 20),
                  onPressed: () {
                    _signUpPost();
                    // print('이름: ' + name.text);
                    print('학교: ' + univ_id.text);
                    // print('학번: ' + entry_year.text);
                    // print('성별: ' + sex.text);
                    // print('아이디없음' + id.text);
                    // print('비밀번호: ' + pwd.text);
                    // print('비밀번호확인: ' + passwordEController.text);
                    // print('별명: ' + nick_name.text);
                    // print('한줄소개: ' + introduce_text.text);
                    // print('출생년: ' + born_year.text);
                    if (formkey.currentState!.validate() &&
                        pwd.text == passwordEController.text) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => TermsPage()));
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
      ),
    );
  }
}