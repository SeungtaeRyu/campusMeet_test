import 'dart:convert';

import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:campus_meet_test/models/meetingPostTest.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<MeetingPostTest>> fetchPost(String searchText) async {

  // 추후에 users 대신 searchText 사용하기!!
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users=${searchText}"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    // 단일 객체 일때
    // return MeetingPostTest.fromJson(json.decode(response.body));

    // 복수 객체 일때
    Iterable l = json.decode(response.body);
    return List<MeetingPostTest>.from(l.map((model) => MeetingPostTest.fromJson(model)));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.fut
    throw Exception('Failed to load post');
  }
}



class HomeSearchScreen extends StatefulWidget {
  const HomeSearchScreen({Key? key}) : super(key: key);

  @override
  _HomeSearchScreenState createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends State<HomeSearchScreen> {
  late Future<List<MeetingPostTest>> meetingPostTest;


  final TextEditingController _search = TextEditingController();
  bool isAdd = false;
  String _searchText = "";
  bool isValid = true;
  bool isFirstSearch = false;

  @override
  void initState() {
    super.initState();
    meetingPostTest = fetchPost("0");
  }

  _HomeSearchScreenState() {
    _search.addListener(() {
      _searchText = _search.text;
      print(_searchText);
    });
  }



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
        centerTitle: true,
        elevation: 0.0,
        title: Text('검색', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child:

        // Container(
        //   child: FutureBuilder<MeetingPostTest>(
        //     future: meetingPostTest,
        //     builder: (context, snapshot) {
        //       if(snapshot.hasData) {
        //         return Text(snapshot.data!.title);
        //       } else if (snapshot.hasError) {
        //         return Text("${snapshot.error}");
        //       }
        //       return CircularProgressIndicator();
        //     },
        //   ),
        // )



        Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: TextFormField(
                cursorColor: Colors.grey,
                keyboardType: TextInputType.name,
                controller: _search,
                autofocus: true,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                  if(_searchText != "") {
                    setState(() {
                      meetingPostTest = fetchPost(_searchText);
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: "검색어를 입력하세요...",
                  hintStyle: TextStyle(fontSize: 16),
                  fillColor: Colors.white,
                  suffixIcon: IconButton(color: Colors.pink, icon: Icon(Icons.search), onPressed: () {
                    FocusScope.of(context).unfocus();
                    if(_searchText != "") {
                      setState(() {
                        meetingPostTest = fetchPost(_searchText);
                      });
                    }
                  }),
                  contentPadding: EdgeInsets.only(left: 15, bottom: 5, top: 5, right: 5),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.pink,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.pink,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),

            // 검색 하기 전 검색 도움 글 출력
            Visibility(
              visible: _searchText=="",
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey.shade200),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.pink,
                      size: 18,
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Expanded(
                      child: Text(
                        '입력하신 검색어와 일치하는 제목과 키워드를 가진 미팅글을 찾아드릴게요!',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                ),
              ),
            ),


            // 검색 했을 때

            FutureBuilder<List<MeetingPostTest>>(
              future: meetingPostTest,
              builder: (context, snapshot) {
                if(_searchText=="") {
                  return Container();
                }

                if(snapshot.hasData) {
                  // return Container(child: Text("${snapshot.data!.length}"));

                  return Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.grey.shade100,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) {
                            return renderMeetingPost(snapshot.data![index]);
                          }
                      ),
                    ),
                  );


                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            )

        //     Visibility(
        //       visible: isFirstSearch,
        //       child: !isValid ? Container(
        //         margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey.shade200),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Icon(
        //               Icons.info,
        //               color: Colors.pink,
        //               size: 18,
        //             ),
        //             Padding(padding: EdgeInsets.only(right: 10)),
        //             Expanded(
        //               child: Text(
        //                 '입력하신 검색어와 일치하는 제목과 키워드를 가진 미팅글이 없습니다',
        //                 style: TextStyle(
        //                   fontSize: 13,
        //                 ),
        //                 softWrap: true,
        //                 overflow: TextOverflow.clip,
        //               ),
        //             )
        //           ],
        //         ),
        //       ) : Expanded(
        //         child: SingleChildScrollView(
        //           child: Container(
        //             color: Colors.grey.shade100,
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.stretch,
        //               children: [
        //                 Padding(padding: EdgeInsets.only(bottom: 10)),
        //                 renderMeetingPost(),
        //                 renderMeetingPost(),
        //                 renderMeetingPost(),
        //                 renderMeetingPost(),
        //                 Padding(padding: EdgeInsets.only(bottom: 10))
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
          ],
        ),


      ),
    );
  }
}

Widget renderMeetingPost(MeetingPostTest post) {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        offset: const Offset(5, 5),
        blurRadius: 5.0,
        // spreadRadius: 4,
      )
    ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // post.title 출력 예정
        Text(
          post.name,
          style: TextStyle(fontSize: 16),
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),

        // post.location.cityStateName // post.location.cityCountryName // post.createAt 출력 예정

        Text(
          "지역 : ${post.location.cityStateName} · n분전{createAt}",
          style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
        ),
        Padding(padding: EdgeInsets.only(bottom: 20)),

        // post.tags.length만큼 for문 돌려서 post.tags[index].text 출력 예정
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
              child: Text("# keywords[index]", style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
              child: Text("# keywords[index]", style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
              child: Text("# keywords[index]", style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 20)),

        // post.writer['univ'] 출력 예정
        // post.writer['entryYear'] 출력 예정
        // post.writer['name'] 출력 예정
        // post.numOfNumber 출력 예정
        Row(
          children: [
            Text("명지대학교 20학번 박선호 ", style: TextStyle(fontSize: 14),),
            Icon(CustomIcons.my_page, size: 14, color: Colors.pink,),
            Text("3", style: TextStyle(color: Colors.pink),)
          ],
        )
      ],
    ),
  );
}




// Widget renderMeetingPost() {
//   return Container(
//     margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
//     padding: EdgeInsets.all(15),
//     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.2),
//         offset: const Offset(5, 5),
//         blurRadius: 5.0,
//         // spreadRadius: 4,
//       )
//     ]),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "방학 3일 남은 한량들입니다",
//           style: TextStyle(fontSize: 16),
//         ),
//         Padding(padding: EdgeInsets.only(bottom: 5)),
//         Text(
//           "location · n분전",
//           style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
//         ),
//         Padding(padding: EdgeInsets.only(bottom: 20)),
//         Wrap(
//           spacing: 10,
//           runSpacing: 10,
//           children: [
//             Container(
//               padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
//               child: Text("# keywords[index]", style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
//             ),
//             Container(
//               padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
//               child: Text("# keywords[index]", style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
//             ),
//             Container(
//               padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
//               child: Text("# keywords[index]", style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
//             ),
//           ],
//         ),
//         Padding(padding: EdgeInsets.only(bottom: 20)),
//         Row(
//           children: [
//             Text("명지대학교 20학번 박선호 ", style: TextStyle(fontSize: 14),),
//             Icon(CustomIcons.my_page, size: 14, color: Colors.pink,),
//             Text("3", style: TextStyle(color: Colors.pink),)
//           ],
//         )
//       ],
//     ),
//   );
// }
