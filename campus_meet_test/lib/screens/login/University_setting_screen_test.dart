// import 'dart:convert';
// import 'package:campus_meet_test/models/University/allUniv_model.dart';
// import 'package:flutter/material.dart';
// import 'package:campus_meet_test/routes.dart';
// import 'package:flutter/services.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:wc_form_validators/wc_form_validators.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(SettingUnivPage());
// }
// //_ 지우기d
// class SettingUnivPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => new _State();
// }
//
// class _State extends State<SettingUnivPage> {
//   TextEditingController univController = TextEditingController();
//   // List<String> univList = ['명지대 인문캠퍼스', "명지대 자연캠퍼스", "단국대", "용인대"];
//   //List<String> univ_addressList = ['명지대 인문캠퍼스', "명지대 자연캠퍼스", "단국대", "용인대"];
//   List<Map> universities = [
//     {
//       "id": 0,
//       "name": "명지대 인문캠퍼스",
//       "domainAddress": "www.mju.ac.kr",
//       "address": "서울특별시 서대문구 거북골로34"
//     },  {
//       "id": 1,
//       "name": "명지대 자연캠퍼스",
//       "domainAddress": "www.mju.ac.kr",
//       "address": "경기도 용인시 처인구 남동 명지로 116"
//     }
//   ];
//   // String name = universities.get(0).get("name").toString();
//
//
//   List<String> search_univ = [];
//   List<String> search_univ_result = [];
//
//   List<String> select_univ = [];
//
//   List<String> search_univ_addr = [];
//   List<String> search_univ_addr_result = [];
//
//
//   @override
//   Widget build(BuildContext context) {
//     Color color = Color(0xffff375c);
//     print('build');
//     // print(univ_url.keys.toList());
//     // print(univ_address.values.toList());
//     // print(search_univ_result);
//     //print(search_univ_result.length);
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
//                         // color: Colors.pink,
//                           width: MediaQuery.of(context).size.width * 0.90,
//                           height: MediaQuery.of(context).size.width * 0.13,
//                           alignment: Alignment(-1.0, 0.0),
//                           padding: EdgeInsets.only(bottom: 11),
//                           child: Text(
//                             '현재 재학중인 학교를 알려주세요 👀',
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
//                             // color: Colors.pink,
//                             height: MediaQuery.of(context).size.width * 0.18,
//                             width: MediaQuery.of(context).size.width * 0.75,
//                             padding: EdgeInsets.all(10),
//                             child: TextFormField(
//                               cursorColor: color,
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.allow(
//                                     RegExp('[ㄱ-ㅎ|가-힣|ㆍ|ᆢ]')),
//                                 LengthLimitingTextInputFormatter(7)
//                               ],
//                               controller: univController,
//                               decoration: InputDecoration(
//                                   focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(5.0)),
//                                       borderSide:
//                                       BorderSide(color: color, width: 1.9)),
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
//                             height: MediaQuery.of(context).size.width * 0.13,
//                             width: MediaQuery.of(context).size.width * 0.17,
//                             decoration: BoxDecoration(
//                                 color: Color(0xffff375c),
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: FlatButton(
//                               onPressed: () {
//                                 print(univController.text);
//                                 print(universities);
//                                 print(universities.length);
//                                 search_univ_result = [];
//                                 search_univ = [];
//                                 search_univ_addr = [];
//                                 search_univ_addr_result = [];
//
//                                 if (univController.text == "") {
//                                 } else {
//                                   univList.forEach((value) {
//                                     //value가 뭐야
//                                     if (value.contains(univController.text)) {
//                                       search_univ.add(value);
//                                       search_univ_addr
//                                           .add(value); //여기 VLA이 들어가면 안돼ㅜj
//                                       print("검색클릭 시");
//                                       print(search_univ);
//                                       print("search_univ_addr");
//                                       print(search_univ_addr);
//                                     }
//                                   });
//                                 }
//                                 setState(() {
//                                   search_univ_result = search_univ;
//                                   search_univ_addr_result = search_univ_addr;
//                                 });
//                               },
//                               child: Text(
//                                 '검색',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       //saerch_univ 를 한줄씩 보여줘
//                       Container(
//                         color: Colors.red,
//                         height: MediaQuery.of(context).size.width * 0.5,
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
//                                       // color:Colors.grey ,
//                                         border: Border(
//                                             bottom: BorderSide(
//                                                 color: index + 1 ==
//                                                     search_univ_result
//                                                         .length
//                                                     ? Colors.white
//                                                     : Colors.grey.shade300))),
//                                     child: Column(
//                                       children: [
//                                         TextButton(
//                                           onPressed: () async {
//
//                                           },
//                                           child: Column(
//                                             children: [
//                                               Text(search_univ_result[index],
//                                                   style: TextStyle(
//                                                       color: Colors.grey,
//                                                       fontWeight:
//                                                       FontWeight.bold,
//                                                       fontSize: 15),
//                                                   textAlign: TextAlign.left),
//                                               Text(
//                                                   search_univ_addr_result[
//                                                   index],
//                                                   style: TextStyle(
//                                                       color: Colors.grey,
//                                                       fontSize: 10),
//                                                   textAlign: TextAlign.left)
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
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
//                   height: MediaQuery.of(context).size.width * 0.13,
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
