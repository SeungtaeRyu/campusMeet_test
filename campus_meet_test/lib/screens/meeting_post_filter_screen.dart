import 'package:campus_meet_test/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeetingFilterScreen extends StatefulWidget {
  const MeetingFilterScreen({Key? key}) : super(key: key);

  @override
  State<MeetingFilterScreen> createState() => _MeetingFilterScreenState();
}

class _MeetingFilterScreenState extends State<MeetingFilterScreen> {
  double numMember = 2;
  TextEditingController studuntIDController1 = TextEditingController();
  TextEditingController studuntIDController2 = TextEditingController();
  TextEditingController ageController1 = TextEditingController();
  TextEditingController ageController2 = TextEditingController();

  List<String> addressData = []; // 지역선택창에서 리턴될 데이터
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
  List<String> keywordData = []; // 선택할때마다 value 추가, 닫기 누를 시 finalKeywordData 와 동기화
  List<String> finalKeywordData = []; // 확인 누를 시 keywordData 와 동기화
  List<bool> selectedKeywords = []; // 선택할때마다 value 추가, 닫기 누를 시 finalSeledctedKeyword 와 동기화
  List<bool> finalSelectedKeywords = []; // 확인 누를 시 selectedKeywords 와 동기화
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

  final _formKey=GlobalKey<FormState>();

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
      finalSelectedKeywords.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(keywordData);
    // print(_formKey.currentState?.validate());
    // print(finalKeywordData);
    // print(finalSelectedKeywords);
    // print(keywordData);
    // print(selectedKeywords);
    print('1. 빌드');
    print(finalKeywordData);

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
          centerTitle: true,
          elevation: 0.0,
          title: Text('검색 필터',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: _formKey,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          children: <Widget>[
                            // 인원수 필터
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey.shade300))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text("인원수", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                  ),
                                  SliderTheme(
                                    data: SliderThemeData(
                                      trackShape: CustomTrackShape(),
                                      trackHeight: 5,
                                      valueIndicatorColor: Colors.pink,
                                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0), // thumb size
                                    ),
                                    child: Slider(
                                      value: numMember,
                                      onChanged: (newnumMember) {
                                        setState(() {
                                          numMember = newnumMember;
                                        });
                                      },
                                      min: 2,
                                      max: 5,
                                      divisions: 3,
                                      activeColor: Colors.grey.shade300,
                                      inactiveColor: Colors.grey.shade300,
                                      thumbColor: Colors.pink,
                                      label: "${numMember.round()}",
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("2"),
                                        Text("3"),
                                        Text("4"),
                                        Text("5"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // 지역 필터
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                      "지역 선택",
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 5),
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
                                                "지역을 선택하세요",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey.shade500,
                                                    height: 1),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.grey.shade500,
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
                                                                          addressData.add("${filteredFirstAddress[selectedFirstAddress.indexOf(true)]} ${secondAddress[selectedSecondAddress.indexOf(true)]}");
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

                                  Wrap(
                                    // runSpacing: 10,
                                    // spacing: 10,
                                    children: addressData == [] ? [SizedBox.shrink()] : List.generate(addressData.length, (index){
                                      return Container(
                                        padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                                        child: Container(
                                          height: 30,
                                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text(addressData[index],style: TextStyle(color: Colors.grey.shade500, fontSize: 14, height: 1)),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: InkWell(
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      padding: EdgeInsets.zero,
                                                      child: Text(" X", style: TextStyle(color: Colors.grey.shade500, fontSize: 14,height: 1))),
                                                  onTap: (){
                                                    setState(() {
                                                      addressData.remove(addressData[index]);
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
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
                            // Container(
                            //   padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            //   decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       border: Border(
                            //           bottom:
                            //               BorderSide(color: Colors.grey.shade300))),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.stretch,
                            //     children: <Widget>[
                            //       Container(
                            //         padding: EdgeInsets.only(bottom: 10),
                            //         child: Text("지역 필터"),
                            //       ),
                            //       // 지역필터 버튼 구현해야함! API도 쓸수도?
                            //       Container(
                            //         child: Text("button"),
                            //       ),
                            //     ],
                            //   ),
                            // ),

                            // 학번 선택 -> 텍스트폼필드 포커스 해제하는법 추가하기!
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey.shade300))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text("학번 선택",
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    // color: Colors.pink,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: TextFormField(
                                            controller: studuntIDController1,
                                            keyboardType: TextInputType.number,
                                            cursorColor: Colors.grey,
                                            inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(2)],
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(10, 0, 10, 0),
                                              hintText: '제한 없음',
                                              hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey.shade300)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey.shade300)),
                                            ),
                                          ),
                                        ),
                                        Text("  ~  "),
                                        Expanded(
                                          child: TextFormField(
                                            controller: studuntIDController2,
                                            keyboardType: TextInputType.number,
                                            cursorColor: Colors.grey,
                                            inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(2)],
                                            decoration: InputDecoration(
                                              contentPadding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                              hintText: '22',
                                              hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey.shade300)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey.shade300)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // 나이 선택
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey.shade300))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text("나이 선택",
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.bold),),
                                  ),
                                  Container(
                                    // height: 80,
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: SizedBox(
                                            // height: 60,
                                            child: TextFormField(
                                              controller: ageController1,
                                              keyboardType: TextInputType.number,
                                              cursorColor: Colors.grey,
                                              inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(2)],
                                              decoration: InputDecoration(
                                                contentPadding:
                                                  EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                hintText: '19',
                                                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                                                errorBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.red)),
                                                errorStyle: TextStyle(fontSize: 0.01),
                                                // border: OutlineInputBorder(
                                                //     borderSide: BorderSide(color: Colors.blue)),
                                                // disabledBorder: OutlineInputBorder(
                                                //     borderSide: BorderSide(color: Colors.grey.shade300)),
                                                // focusedErrorBorder: OutlineInputBorder(
                                                //     borderSide: BorderSide(color: Colors.grey.shade300)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey.shade300)),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey.shade300)),
                                              ),
                                              validator: (value){
                                                if((value != null && int.parse(value) < 19)){
                                                  return "19 이상이어야 함";
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        Text("  ~  "),
                                        Expanded(
                                          child: TextFormField(
                                            controller: ageController2,
                                            keyboardType: TextInputType.number,
                                            cursorColor: Colors.grey,
                                            inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(2)],
                                            decoration: InputDecoration(
                                              contentPadding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                              hintText: '제한 없음',
                                              hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey.shade300)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey.shade300)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //키워드 선택
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text("키워드 선택",
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.bold),),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 5),
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
                                                "키워드를 선택하세요",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey.shade500,
                                                    height: 1),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.grey.shade500,
                                                size: 26,
                                              ),
                                            ],
                                          ),
                                          onPressed: () {
                                            // selectedKeywords = finalSelectedKeywords;
                                            // keywordData = finalKeywordData;

                                            print('2. 키워드선택');
                                            print(finalKeywordData);

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
                                                      EdgeInsets.fromLTRB(20, 20, 20, 20),
                                                      height:
                                                      MediaQuery.of(context).size.width *
                                                          1.5,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets.fromLTRB(
                                                                0, 10, 0, 20),
                                                            child: Container(
                                                              // color: Colors.pink,
                                                              alignment: Alignment.centerLeft,
                                                              width:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                                  0.3,
                                                              child: Text(
                                                                "키워드 선택",
                                                                style: TextStyle(
                                                                    fontSize: 15,
                                                                fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                          ),

                                                          Expanded(
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
                                                                      print('3-1. 키워드선택 중');
                                                                      print(finalKeywordData);

                                                                      // 현재 선택된 키워드 갯수 count
                                                                      int count = 0;
                                                                      for (int i = 0; i < keywords.length; i++) {
                                                                        if (selectedKeywords[i]) count++;
                                                                      }

                                                                      // 현재 선택된 키워드 갯수가 7개이고 비활성 키워드를 클릭했을 때는 아무반응없음
                                                                      if (count == 7 &&
                                                                          !selectedKeywords[index]) {
                                                                      } else {
                                                                        if(!selectedKeywords[index]){
                                                                          mystate(() {
                                                                            selectedKeywords[index] = !selectedKeywords[index];
                                                                            keywordData.add(keywords[index]);
                                                                          });
                                                                        } else {
                                                                          mystate(() {
                                                                            selectedKeywords[index] = !selectedKeywords[index];
                                                                            keywordData.remove(keywords[index]);
                                                                          });
                                                                        }
                                                                      }
                                                                      print('3-2. 키워드 선택중 끝');
                                                                      print(finalKeywordData);
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          Container(
                                                            height: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                0.2,
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

                                                                        setState(() {
                                                                          print('4. 키워드선택 닫기');
                                                                          print(finalKeywordData);
                                                                          selectedKeywords = finalSelectedKeywords;
                                                                          keywordData = finalKeywordData;
                                                                        });
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
                                                                          print('5. 키워드선택 확인');
                                                                          print(finalKeywordData);
                                                                          finalKeywordData = keywordData;
                                                                          finalSelectedKeywords = selectedKeywords;
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

                                  Wrap(
                                    // runSpacing: 10,
                                    // spacing: 10,
                                    children: finalKeywordData == [] ? [SizedBox.shrink()] : List.generate(finalKeywordData.length, (index){
                                      return Container(
                                        padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                                        child: Container(
                                          height: 30,
                                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text(finalKeywordData[index],style: TextStyle(color: Colors.grey.shade500, fontSize: 14, height: 1)),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: InkWell(
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      padding: EdgeInsets.zero,
                                                      child: Text(" X", style: TextStyle(color: Colors.grey.shade500, fontSize: 14,height: 1))),
                                                  onTap: (){
                                                    finalSelectedKeywords[keywords.indexOf(finalKeywordData[index])] = !finalSelectedKeywords[keywords.indexOf(finalKeywordData[index])];
                                                    setState(() {
                                                      finalKeywordData.remove(finalKeywordData[index]);
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.width * 0.25,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: OutlinedButton(
                              child: Text(
                                "초기화",
                                style: TextStyle(
                                    color: Colors.pink, fontWeight: FontWeight.bold),
                              ),
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  side: BorderSide(color: Colors.pink)),
                              onPressed: () {
                                setState(() {
                                  numMember = 2;
                                  addressData = [];
                                  studuntIDController1.text = "";
                                  studuntIDController2.text = "";
                                  ageController1.text = "";
                                  ageController2.text = "";
                                  finalKeywordData = [];
                                });
                                // Navigator.pop(
                                //     context);
                              },
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 15)),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: OutlinedButton(
                              child: Text(
                                "적용",
                                style: TextStyle(
                                    color: Colors.pink, fontWeight: FontWeight.bold),
                              ),
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  side: BorderSide(color: Colors.pink)),
                              onPressed: () {
                                print(_formKey.currentState!.validate());
                                // if(_formKey.currentState!.validate()) {
                                //   print(_formKey.currentState!.validate());
                                // }
                                // setState(() {
                                //   // addressData =
                                //   // "${filteredFirstAddress[selectedFirstAddress.indexOf(true)]} ${secondAddress[selectedSecondAddress.indexOf(true)]}";
                                //   // // 여기 재활용 해야함!! 필터 페이지 지역선택에 쓸꺼임!!
                                //   // addressData.add("${filteredFirstAddress[selectedFirstAddress.indexOf(true)]} ${secondAddress[selectedSecondAddress.indexOf(true)]}");
                                // });
                                // Navigator.pop(context);
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

// Slider width 부모 컨테이너의 width만큼 할당
class CustomTrackShape extends RectangularSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
