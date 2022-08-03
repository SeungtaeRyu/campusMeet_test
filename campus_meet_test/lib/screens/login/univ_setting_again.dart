import 'dart:convert';
import 'package:campus_meet_test/models/University/univ_model.dart';
import 'package:campus_meet_test/models/univ_model.dart';
import 'package:flutter/material.dart';
import 'package:campus_meet_test/routes.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:http/http.dart' as http;


class SettingUnivPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SettingUnivPage> {
  TextEditingController univController = TextEditingController();

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
  ];

  List<String> for_all_univ_name_list = [];
  Map map_univ = {};
  List search_univ_index_list = [];
  @override
  Widget build(BuildContext context) {
    Color color = Color(0xffff375c);
    print('build');
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
                                  for (int i = 0; i < universities.length; i++) {
                                    for_all_univ_name_list.add(universities[i].name);
                                  }
                                  print("for_search_univ_name_list$for_all_univ_name_list");

                                  for (var value in for_all_univ_name_list) {

                                    if (value.contains(univController.text)) {

                                      for (int i = 0; i < universities.length; i++) {
                                        map_univ['id'] = universities[i].id;
                                        map_univ['name'] = universities[i].name;
                                        map_univ['domainAddress'] = universities[i].domainAddress;
                                        map_univ['address'] = universities[i].address;

                                        if (map_univ.values.contains(value)) {
                                          search_univ_index_list.add(map_univ['id']);
                                          print("search_univ_index_list$search_univ_index_list");
                                          print(universities);
                                        }
                                      }
                                    }
                                  }

                                }
                                setState(() {
                                  search_univ_index_list =
                                      search_univ_index_list;
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
                        height: MediaQuery.of(context).size.width * 1.3,
                        // padding: EdgeInsets.only(bottom: 200),
                        child: ListView.builder(
                          itemCount: search_univ_index_list.length,
                          itemBuilder: (context, index) {
                            //이거!!!
                             return SearchUnivResult(university: universities[index]);
                            // return Container(
                            //   // color: Colors.red,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.stretch,
                            //     children: [
                            //       Container(
                            //         //요소간 실선
                            //         decoration: BoxDecoration(
                            //             // color:Colors.grey ,
                            //             border: Border(
                            //                 bottom: BorderSide(
                            //                     color: index + 1 ==
                            //                             //
                            //                             search_univ_index_list
                            //                                 .length
                            //                         ? Colors.white
                            //                         : Colors.grey.shade300))),
                            //         child: TextButton(
                            //           onPressed: () async {
                            //             Map<String, dynamic>
                            //                 map_univ_real_font = {};
                            //             for (int i = 0; i < universities.length; i++) {
                            //
                            //             }
                            //             print(universities[0]);
                            //             print("map_univ_real_font $map_univ_real_font");
                            //
                            //           },
                            //           child:
                            //               Column(
                            //                 children: [
                            //                   Text("학교이름",
                            //                       style: const TextStyle(
                            //                           color: Colors.grey,
                            //                           fontWeight: FontWeight.bold,
                            //                           fontSize: 15),
                            //                       textAlign: TextAlign.left),
                            //                   Text("주소",
                            //                       style: const TextStyle(
                            //                           color: Colors.grey,
                            //                           fontWeight: FontWeight.bold,
                            //                           fontSize: 13),
                            //                       textAlign: TextAlign.left),
                            //                 ],
                            //               ),
                            //         ),
                            //       ),
                            //       // Container(
                            //       //   margin:
                            //       //   EdgeInsets.only(top: 10, right: 7, left: 7, bottom: 10),
                            //       //   height: 1,
                            //       //   width: 355,
                            //       //   color: Colors.grey,
                            //       // ),
                            //     ],
                            //   ),
                            // );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   //다음 버튼
              //   padding: EdgeInsets.only(bottom: 20),
              //   child: Container(
              //     height: MediaQuery.of(context).size.width * 0.14,
              //     width: MediaQuery.of(context).size.width * 0.9,
              //     decoration: BoxDecoration(
              //         color: Color(0xffff375c),
              //         borderRadius: BorderRadius.circular(10)),
              //     child: FlatButton(
              //       onPressed: () async {
              //         // print(select_univ);
              //         List univEmail = select_univ[0].split('.');
              //         print(univEmail); //학교 url중 학교 이름 들어간애만 잘라서 보내@
              //         Navigator.of(context).pushNamed(
              //             Routes.checkUnivEmailScreen,
              //             arguments: {"univEmail": univEmail[1]});
              //       },
              //       child: Text(
              //         '다음',
              //         style: TextStyle(color: Colors.white, fontSize: 25),
              //       ),
              //     ),
              //   ),
              // ),
            ]),
      ),
    );
  }
}
//검색한 학교 뽑는 위젯
class SearchUnivResult extends StatefulWidget {
  const SearchUnivResult({Key? key,  required this.university}) : super(key: key);
  final University university;
  @override
  _SearchUnivResultState createState() => _SearchUnivResultState();
}
class _SearchUnivResultState extends State<SearchUnivResult> {

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   // color:Colors.grey ,
      //     border: Border(
      //         bottom: BorderSide(
      //             color: index + 1 == search_univ_index_list.length
      //                 ? Colors.white
      //                 : Colors.grey.shade300))),
        child: TextButton(
          onPressed: () async {

          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.university.name,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              textAlign: TextAlign.left),

              Padding(padding: EdgeInsets.only(bottom: 5)),
              Text(
                "${widget.university.address}",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                  textAlign: TextAlign.left),

            ],
          ),
        ),


    );
    }

  }


