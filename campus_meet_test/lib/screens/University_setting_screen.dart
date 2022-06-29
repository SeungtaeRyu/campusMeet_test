import 'package:flutter/material.dart';
import 'package:campus_meet_test/routes.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'check_univ_email_screen.dart';

void main() {
  runApp(SettingUnivPage());
}

class SettingUnivPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SettingUnivPage> {
  TextEditingController univController = TextEditingController();
  List<String> univ = ['명지대 인문캠퍼스', "명지대 자연캠퍼스", "단국대", "용인대"];
  Map univ_url = {
    '명지대 인문캠퍼스': 'www.mju.ac.kr',
    '명지대 자연캠퍼스': 'www.mju.ac.kr',
    '단국대': 'www.dankook.ac.kr',
    '용인대': 'www.yongin.ac.kr'
  };
  Map univ_address = {
    '명지대 인문캠퍼스': '서울특별시 서대문구 거북골로 34',
    '명지대 자연캠퍼스': '경기도 용인시 처인구 남동 명지로 116',
    '단국대': '경기도 용인시 수지구 죽전로 152',
    '용인대': '경기도 용인시 처인구 삼가동 용인대학로 134'
  };

  List<String> search_univ = [];
  List<String> search_univ_result = [];

  List<String> select_univ = [];
  List<String> search_univ_addr=[];
  List<String> search_univ_addr_result = [];

  @override
  Widget build(BuildContext context) {
    Color color = Color(0xffff375c);
    print('build');
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
                          height: 150,
                          alignment: Alignment(-1.0, 0.0),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '현재 재학중인 학교를 알려주세요👀',
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 22),
                          )),
                      // Row(
                      // children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 280,
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              cursorColor: color,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp('[ㄱ-ㅎ|가-힣|ㆍ|ᆢ]')),
                                LengthLimitingTextInputFormatter(7)
                              ],
                              controller: univController,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      borderSide: BorderSide(color: color, width: 1.9)),
                                  border: OutlineInputBorder(
                                  ),
                                  //labelText: 'Email',
                                  hintText: '학교이름'),

                              validator: Validators.compose([
                                Validators.required('Name is required'),
                                Validators.patternString(
                                    r'^(?=.*?[ㄱ-힣]).{2,8}$', //한국어 검사는 없어? 최댓값지정해야하나? //pass
                                    '이름을 입력해주세요')
                              ]),
                            ),
                          ),
                          Container(
                            // 회원가입 조건 하나라도 누락 시 색 죽은색/ 조건 무두 완료시 빨
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color(0xffff375c),
                                borderRadius: BorderRadius.circular(10)),
                            child: FlatButton(
                              onPressed: () {
                                // print(univController.text);
                                search_univ_result = [];
                                search_univ = [];
                                search_univ_addr =[];
                                search_univ_addr_result = [];

                                if (univController.text == "") {
                                } else {
                                  univ.forEach((value) {
                                    if (value.contains(univController.text)) {
                                      search_univ.add(value);
                                      search_univ_addr.add(value);
                                    }
                                  });
                                }
                                setState(() {
                                  search_univ_result = search_univ;
                                  search_univ_addr_result = search_univ_addr;
                                });

                              },
                              child: Text(
                                '검색',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //saerch_univ 를 한줄씩 보여줘
                      Container(
                        height: 200,
                        // padding: EdgeInsets.only(bottom: 200),
                        child: ListView.builder(
                          itemCount: search_univ_result.length,
                          itemBuilder: (context, index) {
                            return Container(
                              // color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(

                                    decoration: BoxDecoration(
                                      // color:Colors.grey ,
                                        border: Border(bottom: BorderSide(color: index +1 == search_univ_result.length
                                            ? Colors.white : Colors.grey.shade300))),

                                    child: TextButton(

                                      onPressed: () async {
                                        select_univ = [];
                                        // print("index: " + search_univ_result[index]);
                                        //print("dlrj?"+univ_url[search_univ_result[index]]);
                                        var univ_url_select =
                                        univ_url[search_univ_result[index]];
                                        // print("up : " + univ_url_select);
                                        setState(() {
                                          select_univ.add(univ_url_select);
                                        });
                                        print("select_univ");
                                        print(select_univ);
                                        print(search_univ_addr_result);
                                      },
                                      child: Text(search_univ_result[index],
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                          textAlign: TextAlign.left
                                      ),

                                    ),
                                  ),
                                  // Container(
                                  //   margin:
                                  //   EdgeInsets.only(top: 10, right: 7, left: 7, bottom: 10),
                                  //   height: 1,
                                  //   width: 355,
                                  //   color: Colors.grey,
                                  // ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container( //다음 버튼
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
                      print(select_univ);
                      List univEmail = select_univ[0].split('.');
                      print(univEmail); //학교 url중 학교 이름 들어간애만 잘라서 보내@
                      Navigator.of(context).pushNamed(Routes.checkUnivEmailScreen,
                          arguments: {"univEmail":univEmail[1]});
                    },
                    child: Text(
                      '다음',
                      style: TextStyle(
                          color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),]),
      ),

    );
  }
}