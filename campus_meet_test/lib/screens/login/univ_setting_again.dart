import 'dart:convert';

import 'package:campus_meet_test/models/University/univ_model.dart';
import 'package:flutter/material.dart';
import 'package:campus_meet_test/routes.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:http/http.dart' as http;

Future<List<University>> fetchPost(String searchText) async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 단일 객체 일때
    // return MeetingPostTest.fromJson(json.decode(response.body));

    // 복수 객체 일때
    Iterable l = json.decode(response.body);
    print(l);
    return List<University>.from(l.map((model) => University.fromJson(model)));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.fut
    throw Exception('Failed to load post');
  }
}

class SettingUnivPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SettingUnivPage> {
  TextEditingController univController = TextEditingController();

  List<University> univi = [
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
  // List<Map<dynamic,dynamic>> map_search_univ_list = <Map>[];
  // var map_search_univ_set = Set();
  List search_univ_index_list = [];
  @override
  Widget build(BuildContext context) {
    Color color = Color(0xffff375c);
    print('build');
    // var map_search_univ_result = Map<dynamic, dynamic>.from(map_univ);
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
                      // Row(
                      // children: [
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
                                  for (int i = 0; i < univi.length; i++) {
                                    //리스트 길이만큼 돌리는데, 하나씪 맵을 만들어서 매칭해보고 있으면 리스트에 넣어
                                    //  map_univ['id'] = univi[i].id;
                                    //  map_univ['name'] = univi[i].name;
                                    //  map_univ['domainAddress'] = univi[i].domainAddress;
                                    //  map_univ['address'] = univi[i].address;
                                    // 이러면 map_univ에 딱 이번 순서의 애들만 map으로 만들어져 있겠지
                                    //      if (map_univ.values.contains(univController.text)) { // 아씨빠 맞아 완벽히 같지 않으면 못잡아서 map을 안썼지.아ㅣㅆ발진짜.
                                    //             search_univ.add(map_univ);
                                    //             //주소도 들어가야해
                                    //             print("map_univ.values $map_univ.values");
                                    //           }
                                    //리스트 다시만들어
                                    for_all_univ_name_list.add(univi[i].name);
                                  }
                                  print(
                                      "for_search_univ_name_list$for_all_univ_name_list");

                                  for (var value in for_all_univ_name_list) {
                                    //현재 4번 돈다

                                    if (value.contains(univController.text)) {
                                      //명지대의 경우 2번 걸림

                                      //list map으로 하나씩 떼기
                                      //그 2개 안에서만 돌 수 없나
                                      for (int i = 0; i < univi.length; i++) {
                                        //8번 돔 전체가 4갠데 2번 도니까

                                        map_univ['id'] = univi[i].id;
                                        map_univ['name'] = univi[i].name;
                                        map_univ['domainAddress'] =
                                            univi[i].domainAddress;
                                        map_univ['address'] = univi[i].address;
                                        // print("map_univ$map_univ");
                                        if (map_univ.values.contains(value)) {
                                          //address에 우연히 검색어가 걸리면? --> 위에서 이미 name으로 걸렀어 ㄱㅊ
                                          // print("map_univ $map_univ");
                                          // print(map_univ['id']);
                                          search_univ_index_list.add(map_univ['id']);
                                          print("search_univ_index_list$search_univ_index_list");
                                          print(univi);
                                          // print("111map_search_univ_result $map_search_univ_result");
                                          // print("111리스트$map_search_univ_list");
                                          //
                                          // //여기서 바뀌는거
                                          // print("맵이바뀌었다"); // 맨뒤거로 다 대치되는데?
                                          // map_search_univ_result.addAll(map_univ);
                                          //
                                          // print("222map_search_univ_result $map_search_univ_result");
                                          // print("222리스트$map_search_univ_list");
                                          //
                                          // print("333map_search_univ_result $map_search_univ_result");
                                          // map_search_univ_list.add(map_search_univ_result);
                                          // print("리스트에 더했다");
                                          // print("333리스트$map_search_univ_list");
                                          // print("444map_search_univ_result $map_search_univ_result");
                                          // print(map_search_univ_list.length);
                                          //인덱스 값을 갖고오자

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
                            return Container(
                              // color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        // color:Colors.grey ,
                                        border: Border(
                                            bottom: BorderSide(
                                                color: index + 1 ==
                                                        //
                                                        search_univ_index_list
                                                            .length
                                                    ? Colors.white
                                                    : Colors.grey.shade300))),
                                    child: TextButton(
                                      onPressed: () async {
                                        Map<String, dynamic>
                                            map_univ_real_font = {};
                                        for (int i = 0; i < univi.length; i++) {
                                          // map_univ_url.add(univi[i].domainAddress);
                                          // // 여기서 맵으로 받아와보자
                                          // print(i);
                                          // map_univ_real['id'] = univi[i].id;
                                          // map_univ_real['name'] = univi[i].name;
                                          // map_univ_real['domainAddress'] = univi[i].domainAddress;
                                          // map_univ_real['address'] = univi[i].address;
                                          // map_univ_real_font.addAll(map_univ_real);
                                          // print("map_univ_real_font $map_univ_real_font");
                                        }
                                        print(
                                            "map_univ_real_font $map_univ_real_font");
                                        // print(map_univ_url);
                                        // for (var value in univ) {
                                        //   if (value.contains(univController.text)) {
                                        //     // search_univ.add(univi[i].domainAddress);
                                        //     //print(value);
                                        //   }
                                        // }
                                      },
                                      child:
                                          // Text(map_univ[index]['name'], //인덱스 값으로 map의 키 불러와 decode ?
                                          Column(
                                            children: [
                                              Text("학교이름",
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                  textAlign: TextAlign.left),
                                              Text("주소",
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 13),
                                                  textAlign: TextAlign.left),

                                            ],
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
