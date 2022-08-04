import 'dart:convert';
import 'package:campus_meet_test/models/University/univ_model.dart';
import 'package:campus_meet_test/models/univ_model.dart';
import 'package:flutter/material.dart';
import 'package:campus_meet_test/routes.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:http/http.dart' as http;
List select_univ = [];
class SettingUnivPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SettingUnivPage> {
  TextEditingController univController = TextEditingController();
//이거 아니래
  bool visibility = false;
  List<University> universities = [
    University.fromJson({
      "id": 0,
      "name": "명지대(인문)", //학교 붙여야하지 않을까 싶은데,,
      "domainAddress": "www.mju.ac.kr",
      "address": "서울특별시 서대문구 거북골로 34",
    }),
    University.fromJson({
      "id": 1,
      "name": "명지대(자연)",
      "domainAddress": "www.mju.ac.kr",
      "address": "경기도 용인시 처인구 남동 명지로 116",
    }),
    University.fromJson({
      "id": 2,
      "name": "단국대",
      "domainAddress": "www.dankook.ac.kr",
      "address": "경기도 용인시 수지구 죽전로 152",
    }),
    University.fromJson({
      "id": 3,
      "name": "용인대",
      "domainAddress": "www.yongin.ac.kr",
      "address": "경기도 용인시 처인구 삼가동 용인대학로 134",
    }),
    University.fromJson({
      "id": 4,
      "name": "명지대3",
      "domainAddress": "ddd",
      "address": "dd",
    })
  ];

  List<String> for_all_univ_name_list = [];
  Map map_univ = {};
  List search_univ_index_list = [];
  late int a_univ_index;


  @override
  Widget build(BuildContext context) {
    Color color = Color(0xffff375c);
    print('build');
    print("search_univ_index_list$search_univ_index_list");

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
                          // color: Colors.red,
                          height: MediaQuery.of(context).size.width * 0.13,
                          width: MediaQuery.of(context).size.width * 0.9,
                          alignment: Alignment(-1.0, 0.0),
                          padding: EdgeInsets.only(left: 5, bottom: 5),
                          child: Text(
                            '현재 재학중인 학교를 알려주세요👀',
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 22),
                          )),
                      Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * 0.17,
                            width: MediaQuery.of(context).size.width * 0.73,
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              cursorColor: color,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[ㄱ-ㅎ|가-힣|ㆍ|ᆢ]')), //일단 한글만 가능하게했음
                                LengthLimitingTextInputFormatter(7)
                              ],
                              controller: univController,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide:
                                          BorderSide(color: color, width: 1.9)),
                                  border: OutlineInputBorder(),
                                  //labelText: 'Email',
                                  hintText: '학교이름',
                                  hintStyle: TextStyle(height: 0.7)),
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
                            height: MediaQuery.of(context).size.width * 0.12,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                color: Color(0xffff375c),
                                borderRadius: BorderRadius.circular(5)),
                            child: FlatButton(
                              onPressed: () {
                                for_all_univ_name_list = [];
                                search_univ_index_list = [];

                                if (univController.text == "") {
                                } else {
                                  for (int i = 0;
                                      i < universities.length;
                                      i++) {
                                    for_all_univ_name_list
                                        .add(universities[i].name);
                                  }
                                  print(
                                      "for_search_univ_name_list$for_all_univ_name_list");

                                  for (var value in for_all_univ_name_list) {
                                    if (value.contains(univController.text)) {
                                      for (int i = 0;
                                          i < universities.length;
                                          i++) {
                                        map_univ['id'] = universities[i].id;
                                        map_univ['name'] = universities[i].name;
                                        map_univ['domainAddress'] =
                                            universities[i].domainAddress;
                                        map_univ['address'] =
                                            universities[i].address;

                                        if (map_univ.values.contains(value)) {
                                          search_univ_index_list
                                              .add(map_univ['id']);
                                          print(
                                              "search_univ_index_list$search_univ_index_list");
                                        }
                                      }
                                    }
                                  }
                                  // print("mida_univ_index$a_univ_index");
                                }
                                setState(() {
                                  search_univ_index_list =
                                      search_univ_index_list;
                                  visibility = true;
                                  // a_univ_index = map_univ['id'] ;
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
                          child: SearchUnivResult(
                              universities: universities,
                              search_univ_index_list: search_univ_index_list))
                    ],
                  ),
                ),
              ),
              Container(
                //다음 버튼
                padding: EdgeInsets.only(bottom: 20),
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.14,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Color(0xffff375c),
                      borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(
                    onPressed: () async {
                      // print(select_univ);
                      List univEmail = select_univ[0].split('.');
                      print(univEmail); //학교 url중 학교 이름 들어간애만 잘라서 보내@
                      Navigator.of(context).pushNamed(
                          Routes.checkUnivEmailScreen,
                          arguments: {"univEmail": univEmail[1]});
                    },
                    child: Text(
                      '다음',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );

  }
}

//검색한 학교 뽑는 위젯
class SearchUnivResult extends StatefulWidget {
  const SearchUnivResult(
      {Key? key,
      required this.universities,
      required this.search_univ_index_list})
      : super(key: key);

  final List<University> universities;
  final List search_univ_index_list;
  @override
  _SearchUnivResultState createState() => _SearchUnivResultState();
}

class _SearchUnivResultState extends State<SearchUnivResult> {
  // List select_univ = [];
  @override
  Widget build(BuildContext context) {
    print('sdf');
    return widget.search_univ_index_list.isNotEmpty
        ? Container(
            height: MediaQuery.of(context).size.width * 1.3,
            // padding: EdgeInsets.only(bottom: 200),
            child: Column(
              children: [
                for (int i = 0; i < widget.search_univ_index_list.length; i++)
                  (Container(
                      child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          select_univ = [];
                          print('here');
                          print(widget.universities[widget.search_univ_index_list[i]].id.toString());
                          print(widget.universities[widget.search_univ_index_list[i]].domainAddress
                              .toString());
                          select_univ.add(widget.universities[widget.search_univ_index_list[i]].domainAddress);
                          setState(() {
                            select_univ=select_univ;
                            // a_univ_index = map_univ['id'] ;
                          });
                          },

                        child: Column(
                          children: [
                            Text(
                                widget
                                    .universities[
                                        widget.search_univ_index_list[i]]
                                    .name
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                textAlign: TextAlign.left),
                            Text(
                                widget
                                    .universities[
                                        widget.search_univ_index_list[i]]
                                    .address
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                                textAlign: TextAlign.left),
                          ],
                        ),
                      ),
                    ],
                  )))
              ],
            ),
          )
        : Container(
            color: Colors.red,
          );
  }
}
