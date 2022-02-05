import 'package:campus_meet_test/models/address_model.dart';
import 'package:campus_meet_test/screens/member_formation_screen.dart';
import 'package:flutter/material.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({Key? key}) : super(key: key);

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  List<String> memberData = []; // 멤버결성창에서 리턴될 데이터
  String addressData = ""; // 지역선택창에서 리턴될 데이터
  List<Address> addresses = [
    Address.fromMap(
      {
        'id': 1,
        'firstAddress': '서울',
        'secondAddress': '강남구',
      },
    ),
    Address.fromMap(
      {
        'id': 2,
        'firstAddress': '서울',
        'secondAddress': '강동구',
      },
    ),
    Address.fromMap(
      {
        'id': 3,
        'firstAddress': '서울',
        'secondAddress': '강북구',
      },
    ),
    Address.fromMap(
      {
        'id': 4,
        'firstAddress': '서울',
        'secondAddress': '강서구',
      },
    ),
    Address.fromMap(
      {
        'id': 5,
        'firstAddress': '서울',
        'secondAddress': '관악구',
      },
    ),
    Address.fromMap(
      {
        'id': 6,
        'firstAddress': '경기',
        'secondAddress': '가평군',
      },
    ),
    Address.fromMap(
      {
        'id': 7,
        'firstAddress': '경기',
        'secondAddress': '구리시',
      },
    ),
    Address.fromMap(
      {
        'id': 8,
        'firstAddress': '경기',
        'secondAddress': '김포시',
      },
    ),
    Address.fromMap(
      {
        'id': 9,
        'firstAddress': '경기',
        'secondAddress': '파주시',
      },
    ),
    Address.fromMap(
      {
        'id': 10,
        'firstAddress': '경기',
        'secondAddress': '평택시',
      },
    ),
    Address.fromMap(
      {
        'id': 11,
        'firstAddress': '경기',
        'secondAddress': '평택시2',
      },
    ),
    Address.fromMap(
      {
        'id': 12,
        'firstAddress': '경기',
        'secondAddress': '평택시3',
      },
    ),
    Address.fromMap(
      {
        'id': 13,
        'firstAddress': '경기',
        'secondAddress': '평택시4',
      },
    ),
    Address.fromMap(
      {
        'id': 14,
        'firstAddress': '경남',
        'secondAddress': '거제시',
      },
    ),
    Address.fromMap(
      {
        'id': 15,
        'firstAddress': '경남',
        'secondAddress': '거제시2',
      },
    ),
    Address.fromMap(
      {
        'id': 16,
        'firstAddress': '경남',
        'secondAddress': '거제시3',
      },
    ),
    Address.fromMap(
      {
        'id': 17,
        'firstAddress': '경남',
        'secondAddress': '거제시4',
      },
    ),
  ];
  List<String> firstAddress = [];
  List<String> filteredFirstAddress = [];
  List<bool> selectedFirstAddress = [];
  List<bool> selectSecondAddress = [];

  List<String> secondAddress = [];
  List<bool> selectedSecondAddress = [];

  // 키워드 DB
  List<bool> selectedKeywords = [];
  List<String> keywords = [
    "인간 댕댕이",
    "회색 아기 고양이",
    "매력쟁이",
    "건강미 뿜뿜",
    "보기보다 동안",
    "나름 귀여울지도",
    "사람 냄새나는 스타일",
    "카리스마 있는 편",
    "센스 폭발",
    "배꼽 도둑",
    "틈새 드립러",
    "분위기 메이커",
    "부끄럼쟁이",
    "리액션 부자",
    "따뜻 다정",
    "표현 서툰 츤데레",
    "어색한건 못 참아",
    "밥보단 술",
    "술보단 밥",
    "편하게 놀아요",
    "술은 적당히",
    "몸만 오세요",
    "멈추지마 가보자고",
    "분위기 캐리 부탁드립니다",
    "시간 순삭 책임질게요",
    "뚝딱이들"
  ];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < addresses.length; i++) {
      firstAddress.add(addresses[i].firstAddress);
    }
    filteredFirstAddress = firstAddress.toSet().toList();
    for (int i = 0; i < filteredFirstAddress.length; i++) {
      if (i == 0) {
        selectedFirstAddress.add(true);
      } else {
        selectedFirstAddress.add(false);
      }
    }

    // secondAddress 초기화
    for (int i = 0; i < addresses.length; i++) {
      if (addresses[i].firstAddress ==
          filteredFirstAddress[selectedFirstAddress.indexOf(true)]) {
        secondAddress.add(addresses[i].secondAddress);
      }
    }
    // selectedSecondAddress 초기화
    for (int i = 0; i < secondAddress.length; i++) {
      if (i == 0) {
        selectedSecondAddress.add(true);
      } else {
        selectedSecondAddress.add(false);
      }
    }
    // selectedKeywords
    for (int i = 0; i < keywords.length; i++) {
      selectedKeywords.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          toolbarHeight: MediaQuery.of(context).size.width * 0.1,
          elevation: 0.0,

          // actions 버튼 패딩 어쩔꺼?
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "등록",
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  minimumSize: Size.zero,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 20))
          ],
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      // controller: studuntIDController1,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '미팅 제목을 입력하세요',
                          hintStyle: TextStyle(
                              fontSize: 16, color: Colors.grey.shade500)),
                    ),
                  ],
                ),
              ),

              // 지역
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "지역",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: TextButton(
                            // TextButton inner padding 삭제하는방법!!
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  addressData == "" ? "지역 선택" : addressData,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: addressData == ""
                                          ? Colors.grey.shade500
                                          : Colors.black,
                                      height: 1),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: addressData == ""
                                      ? Colors.grey.shade500
                                      : Colors.black,
                                  size: 26,
                                ),
                              ],
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0)),
                                ),
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter mystate) {
                                    return SingleChildScrollView(
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        height:
                                            MediaQuery.of(context).size.width *
                                                1.5,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey.shade300))),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // color: Colors.pink,
                                                    alignment: Alignment.center,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    child: Text(
                                                      "시/도",
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  Container(
                                                    // color: Colors.blue,
                                                    padding: EdgeInsets.only(
                                                        left: 30),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    child: Text(
                                                      "시/구/군",
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    alignment: Alignment.center,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300),
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300))),
                                                    child: renderFirstAddress(
                                                        mystate),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300))),
                                                      child:
                                                          renderSecondAddress(
                                                              mystate),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 0, 20, 20),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                      child: OutlinedButton(
                                                        child: Text(
                                                          "닫기",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.pink,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .pink)),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 15)),
                                                  Expanded(
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                      child: OutlinedButton(
                                                        child: Text(
                                                          "확인",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.pink,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .pink)),
                                                        onPressed: () {
                                                          setState(() {
                                                            addressData =
                                                                "${filteredFirstAddress[selectedFirstAddress.indexOf(true)]} ${secondAddress[selectedSecondAddress.indexOf(true)]}";
                                                            // 여기 재활용 해야함!! 필터 페이지 지역선택에 쓸꺼임!!
                                                            // addressData.add("${filteredFirstAddress[selectedFirstAddress.indexOf(true)]} ${secondAddress[selectedSecondAddress.indexOf(true)]}");
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    // 여기 재활용 해야함!! 필터 페이지 지역선택에 쓸꺼임!!
                    // 여기가 선택된 지역 보여주는 곳인데 flexible한 사이즈 할당이 안되는중
                    // Container(
                    //   child: addressData.length == 0
                    //       ? SizedBox.shrink()
                    //       : Container(
                    //     height: 40,
                    //     padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    //     child: ListView.builder(
                    //       itemCount: addressData.length,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return Row(
                    //           children: [
                    //             Container(
                    //               height: 30,
                    //               padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    //               decoration: BoxDecoration(
                    //                 color: Colors.grey.shade300,
                    //                 borderRadius: BorderRadius.circular(20)
                    //               ),
                    //               child: Row(
                    //                 children: [
                    //                   Container(
                    //                     alignment: Alignment.center,
                    //                     child: Text(addressData[index],style: TextStyle(fontSize: 14, height: 1)),
                    //                   ),
                    //                   Container(
                    //                     alignment: Alignment.center,
                    //                     child: InkWell(
                    //                       child: Container(
                    //                           alignment: Alignment.center,
                    //                           padding: EdgeInsets.zero,
                    //                           child: Text(" X", style: TextStyle(fontSize: 14,height: 1))),
                    //                       onTap: (){
                    //                         // setState(() {
                    //                         //   addressData.remove(addressData[index]);
                    //                         // });
                    //                       },
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //             Padding(padding: EdgeInsets.only(right: 10)),
                    //           ],
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

              // 참가자
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "참가자",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 60,
                      padding: EdgeInsets.only(bottom: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: memberData.length + 2,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage("images/user1_profile.jpg"),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      Colors.black.withOpacity(0.3),
                                  child: Text(
                                    "나",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                            );
                          } else if (index < memberData.length + 1) {
                            return Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: CircleAvatar(
                                backgroundColor: Colors.pink,
                                radius: 25,
                                child: Text(
                                  "${memberData[index - 1]}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey,
                                child: CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    icon: Icon(Icons.add, color: Colors.grey),
                                    padding: EdgeInsets.zero,
                                    onPressed: () async {
                                      final data = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MemberFomationScreen()));
                                      setState(() {
                                        memberData = data;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    // Container(
                    //   child: SingleChildScrollView(
                    //     child: Wrap(
                    //       runSpacing: 10,
                    //       children: List.generate(
                    //         memberData.length + 2,
                    //         (index) {
                    //           if (index == 0) {
                    //             return Container(
                    //               padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    //               child: CircleAvatar(
                    //                 radius: 25,
                    //                 backgroundImage:
                    //                     AssetImage("images/user1_profile.jpg"),
                    //                 child: CircleAvatar(
                    //                   radius: 25,
                    //                   backgroundColor: Colors.black.withOpacity(0.3),
                    //                   child: Text(
                    //                     "나",
                    //                     style: TextStyle(
                    //                         color: Colors.white, fontSize: 12),
                    //                   ),
                    //                 ),
                    //               ),
                    //             );
                    //           } else if (index < memberData.length + 1) {
                    //             return Container(
                    //               padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    //               child: CircleAvatar(
                    //                 backgroundColor: Colors.pink,
                    //                 radius: 25,
                    //                 child: Text(
                    //                   "${memberData[index - 1]}",
                    //                   style: TextStyle(
                    //                       color: Colors.white, fontSize: 12),
                    //                 ),
                    //               ),
                    //             );
                    //           } else {
                    //             return Container(
                    //               child: CircleAvatar(
                    //                 radius: 25,
                    //                 backgroundColor: Colors.grey,
                    //                 child: CircleAvatar(
                    //                   radius: 23,
                    //                   backgroundColor: Colors.white,
                    //                   child: IconButton(
                    //                     icon:
                    //                         Icon(Icons.add, color: Colors.grey),
                    //                     padding: EdgeInsets.zero,
                    //                     onPressed: () async {
                    //                       final data = await Navigator.push(
                    //                           context,
                    //                           MaterialPageRoute(
                    //                               builder: (context) =>
                    //                                   MemberFomationScreen()));
                    //                       setState(() {
                    //                         memberData = data;
                    //                       });
                    //                     },
                    //                   ),
                    //                 ),
                    //               ),
                    //             );
                    //           }
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

              // 키워드
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "키워드",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "미팅 상대에게 멤버들의 특징이나 장점들을 어필해보세요!",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "(최대 7개까지 선택가능)",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
                        ),
                      ),

                      // keywords 나열하자!
                      Expanded(
                        child: SingleChildScrollView(
                          child: Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: List<Widget>.generate(
                              keywords.length,
                              (index) => Container(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    elevation: 0,
                                    primary: selectedKeywords[index]
                                        ? Colors.pink
                                        : Colors.grey.shade200,
                                    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    "# ${keywords[index]}",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: selectedKeywords[index]
                                            ? Colors.white
                                            : Colors.grey.shade500),
                                  ),
                                  onPressed: () {
                                    // 현재 선택된 키워드 갯수 count
                                    int count = 0;
                                    for (int i = 0; i < keywords.length; i++) {
                                      if (selectedKeywords[i]) count++;
                                    }

                                    // 현재 선택된 키워드 갯수가 7개이고 비활성 키워드를 클릭했을 때는 아무반응없음
                                    if (count == 7 &&
                                        !selectedKeywords[index]) {
                                    } else {
                                      setState(() {
                                        selectedKeywords[index] =
                                            !selectedKeywords[index];
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  renderFirstAddress(StateSetter mystate) {
    return ListView.builder(
      itemCount: filteredFirstAddress.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: CircleAvatar(
            radius: 20,
            backgroundColor:
                selectedFirstAddress[index] ? Colors.pink : Colors.white,
            child: InkWell(
              onTap: () {
                // selectedFirstAddress 새로 담을 변수 설정
                List<bool> result = [];
                for (int i = 0; i < filteredFirstAddress.length; i++) {
                  if (i == index) {
                    result.add(true);
                  } else {
                    result.add(false);
                  }
                }

                // secondAddress 초기화
                secondAddress = [];
                for (int i = 0; i < addresses.length; i++) {
                  if (addresses[i].firstAddress ==
                      filteredFirstAddress[result.indexOf(true)]) {
                    secondAddress.add(addresses[i].secondAddress);
                  }
                }

                // selectedSecondAddress 초기화
                selectedSecondAddress = [];
                for (int i = 0; i < secondAddress.length; i++) {
                  if (i == 0) {
                    selectedSecondAddress.add(true);
                  } else {
                    selectedSecondAddress.add(false);
                  }
                }

                mystate(() {
                  selectedFirstAddress = result;
                });
              },
              child: Text(
                filteredFirstAddress[index],
                style: TextStyle(
                    color: selectedFirstAddress[index]
                        ? Colors.white
                        : Colors.black,
                    fontSize: 14),
              ),
            ),
          ),
        );
      },
    );
  }

  renderSecondAddress(StateSetter mystate) {
    return ListView.builder(
      itemCount: secondAddress.length, // 첫번째선택된주소의 개수
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.only(left: 30),
          alignment: Alignment.centerLeft,
          child: TextButton(
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              // backgroundColor: Colors.pink
            ),
            child: Text(
              secondAddress[index],
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: selectedSecondAddress[index]
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            onPressed: () {
              // selectedSecondAddress 초기화
              List<bool> result = [];
              for (int i = 0; i < secondAddress.length; i++) {
                if (i == index) {
                  result.add(true);
                } else {
                  result.add(false);
                }
              }
              mystate(() {
                selectedSecondAddress = result;
              });
            },
          ),
        );
      },
    );
  }
}
