// import 'dart:convert';
//
// import 'package:campus_meet_test/models/University/univ_model.dart';
// import 'package:flutter/material.dart';
// import 'package:campus_meet_test/routes.dart';
// import 'package:flutter/services.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:wc_form_validators/wc_form_validators.dart';
// import 'package:http/http.dart' as http;
//
// Future<List<University>> fetchPost(String searchText) async {
//   final response =
//       await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
//
//   if (response.statusCode == 200) {
//     // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
//
//     // 단일 객체 일때
//     // return MeetingPostTest.fromJson(json.decode(response.body));
//
//     // 복수 객체 일때
//     Iterable l = json.decode(response.body);
//     print(l);
//     return List<University>.from(l.map((model) => University.fromJson(model)));
//   } else {
//     // 만약 요청이 실패하면, 에러를 던집니다.fut
//     throw Exception('Failed to load post');
//   }
// }
// // myMap.entries.map((entry) => "${entry.key} + ${entry.value}").toList();
// // class HomeSearchScreen extends StatefulWidget {
// //   const HomeSearchScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   _HomeSearchScreenState createState() => _HomeSearchScreenState();
// // }
//
// // void main() {
// //   runApp(SettingUnivPage());
// // }
//
// class SettingUnivPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => new _State();
// }
//
// class _State extends State<SettingUnivPage> {
//   TextEditingController univController = TextEditingController();
//   //
//   List<University> univi = [
//     University.fromJson({
//       "id": 0,
//       "name": "명지대(인문)",
//       "domainAddress": "www.mju.ac.kr",
//       "address": "서울특별시 서대문구 거북골로 34",
//     }),
//     University.fromJson({
//       "id": 1,
//       "name": "명지대(자연)",
//       "domainAddress": "www.mju.ac.kr",
//       "address": "경기도 용인시 처인구 남동 명지로 116",
//     }),
//     University.fromJson({
//       "id": 2,
//       "name": "단국대",
//       "domainAddress": "www.dankook.ac.kr",
//       "address": "경기도 용인시 수지구 죽전로 152",
//     }),
//     University.fromJson({
//       "id": 3,
//       "name": "용인대",
//       "domainAddress": "www.yongin.ac.kr",
//       "address": "경기도 용인시 처인구 삼가동 용인대학로 134",
//     }),
//   ];
//   // List<String> univivi =
//
//   //
//   List<String> univ = ['명지대 인문캠퍼스', "명지대 자연캠퍼스", "단국대", "용인대"];
//   Map univ_url = {
//     '명지대 인문캠퍼스': 'www.mju.ac.kr',
//     '명지대 자연캠퍼스': 'www.mju.ac.kr',
//     '단국대': 'www.dankook.ac.kr',
//     '용인대': 'www.yongin.ac.kr'
//   };
//
//   List<String> search_univ = [];
//   List<String> search_univ_result = [];
//   List<String> select_univ = [];
//   List<String> search_univ_addr = [];
//   List<String> search_univ_addr_result = [];
//   List<String> map_univ = [];
//   List<String> map_univ_url = [];
//   Map<String,dynamic> map_univ_real ={};
//   @override어
//   Widget build(BuildContext context) {
//     Color color = Color(0xffff375c);
//     print('build');
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_ios_rounded,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         //autovalidateMode: AutovalidateMode.always,
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                           // color: Colors.red,
//                           height: MediaQuery.of(context).size.width * 0.13,
//                           width: MediaQuery.of(context).size.width * 0.9,
//                           alignment: Alignment(-1.0, 0.0),
//                           padding: EdgeInsets.only(left: 5, bottom: 5),
//                           child: Text(
//                             '현재 재학중인 학교를 알려주세요👀',
//                             //textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 22),
//                           )),
//                       // Row(
//                       // children: [
//                       Row(
//                         children: [
//                           Container(
//                             height: MediaQuery.of(context).size.width * 0.17,
//                             width: MediaQuery.of(context).size.width * 0.73,
//                             padding: EdgeInsets.all(10),
//                             child: TextFormField(
//                               cursorColor: color,
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.allow(
//                                     RegExp('[ㄱ-ㅎ|가-힣|ㆍ|ᆢ]')), //일단 한글만 가능하게했음
//                                 LengthLimitingTextInputFormatter(7)
//                               ],
//                               controller: univController,
//                               decoration: InputDecoration(
//                                   focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(5.0)),
//                                       borderSide:
//                                           BorderSide(color: color, width: 1.9)),
//                                   border: OutlineInputBorder(),
//                                   //labelText: 'Email',
//                                   hintText: '학교이름',
//                                   hintStyle: TextStyle(height: 0.7)),
//                               validator: Validators.compose([
//                                 Validators.required('Name is required'),
//                                 Validators.patternString(
//                                     r'^(?=.*?[ㄱ-힣]).{2,8}$', //한국어 검사는 없어? 최댓값지정해야하나? //pass
//                                     '이름을 입력해주세요')
//                               ]),
//                             ),
//                           ),
//                           Container(
//                             // 회원가입 조건 하나라도 누락 시 색 죽은색/ 조건 무두 완료시 빨
//                             height: MediaQuery.of(context).size.width * 0.12,
//                             width: MediaQuery.of(context).size.width * 0.2,
//                             decoration: BoxDecoration(
//                                 color: Color(0xffff375c),
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: FlatButton(
//                               onPressed: () {
//                                 // print(univController.text);
//                                 search_univ_result = [];
//                                 search_univ = [];
//                                 search_univ_addr = [];
//                                 search_univ_addr_result = [];
//                                 map_univ = [];
//                                 if (univController.text == "") {
//                                 } else {
//                                   for (int i = 0; i < univi.length; i++) {
//
//                                     map_univ.add(univi[i].name);
//
//                                   }
//                                   for (var value in map_univ) {
//                                     if (value.contains(univController.text)) {
//                                       search_univ.add(value);
//                                       search_univ_addr.add(value);
//                                       print("val $value");
//                                     }
//                                   }
//
//                                   print("search_univ$search_univ");
//                                   print("search_univ_addr$search_univ_addr");
//                                 }
//                                 setState(() {
//                                   search_univ_result = search_univ;
//                                   search_univ_addr_result = search_univ_addr;
//                                 });
//                               },
//                               child: Text(
//                                 '검색',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 20),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       //saerch_univ 를 한줄씩 보여줘
//                       Container(
//                         height: MediaQuery.of(context).size.width * 1.3,
//                         // padding: EdgeInsets.only(bottom: 200),
//                         child: ListView.builder(
//                           itemCount: search_univ_result.length,
//                           itemBuilder: (context, index) {
//                             return Container(
//                               // color: Colors.red,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                         // color:Colors.grey ,
//                                         border: Border(
//                                             bottom: BorderSide(
//                                                 color: index + 1 ==
//                                                         search_univ_result
//                                                             .length
//                                                     ? Colors.white
//                                                     : Colors.grey.shade300))),
//                                     child: TextButton(
//                                       onPressed: () async {
//                                         map_univ_url = [];
//                                         Map<String,dynamic> map_univ_real_font ={};
//                                         for (int i = 0; i < univi.length; i++) {
//                                           map_univ_url.add(univi[i].domainAddress);
//                                           // 여기서 맵으로 받아와보자
//                                           print(i);
//                                           map_univ_real['id'] = univi[i].id;
//                                           map_univ_real['name'] = univi[i].name;
//                                           map_univ_real['domainAddress'] = univi[i].domainAddress;
//                                           map_univ_real['address'] = univi[i].address;
//                                           map_univ_real_font.addAll(map_univ_real);
//                                           print("map_univ_real_font $map_univ_real_font");
//                                         }
//                                         print("map_univ_real_font $map_univ_real_font");
//                                         print(map_univ_url);
//                                         for (var value in univ) {
//                                           if (value.contains(univController.text)) {
//                                             // search_univ.add(univi[i].domainAddress);
//                                             //print(value);
//                                           }
//                                         }
//                                       },
//                                       child:
//                                       //Text(search_univ_result[index],
//                                       Text(search_univ_result[index],
//                                           style: const TextStyle(
//                                               color: Colors.grey,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 15),
//                                           textAlign: TextAlign.left),
//                                     ),
//                                   ),
//                                   // Container(
//                                   //   margin:
//                                   //   EdgeInsets.only(top: 10, right: 7, left: 7, bottom: 10),
//                                   //   height: 1,
//                                   //   width: 355,
//                                   //   color: Colors.grey,
//                                   // ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 //다음 버튼
//                 padding: EdgeInsets.only(bottom: 20),
//                 child: Container(
//                   height: MediaQuery.of(context).size.width * 0.14,
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   decoration: BoxDecoration(
//                       color: Color(0xffff375c),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: FlatButton(
//                     onPressed: () async {
//                       print(select_univ);
//                       List univEmail = select_univ[0].split('.');
//                       print(univEmail); //학교 url중 학교 이름 들어간애만 잘라서 보내@
//                       Navigator.of(context).pushNamed(
//                           Routes.checkUnivEmailScreen,
//                           arguments: {"univEmail": univEmail[1]});
//                     },
//                     child: Text(
//                       '다음',
//                       style: TextStyle(color: Colors.white, fontSize: 25),
//                     ),
//                   ),
//                 ),
//               ),
//             ]),
//       ),
//     );
//   }
// }
