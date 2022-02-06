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

  List<String> firstAddress = [];
  List<String> filteredFirstAddress = [];
  List<bool> selectedFirstAddress = [];
  List<bool> selectSecondAddress = [];

  List<String> secondAddress = [];
  List<bool> selectedSecondAddress = [];

  // 키워드 DB
  List<String> keywordData =
      []; // 선택할때마다 value 추가, 닫기 누를 시 finalKeywordData 와 동기화
  List<String> finalKeywordData = []; // 확인 누를 시 keywordData 와 동기화
  List<bool> selectedKeywords =
      []; // 선택할때마다 value 추가, 닫기 누를 시 finalSeledctedKeyword 와 동기화
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

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

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
          onTap: () {
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
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
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
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap),
                                          child: Row(
                                            children: [
                                              Text("키워드를 선택하세요",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                          Colors.grey.shade500,
                                                      height: 1)),
                                              Icon(Icons.keyboard_arrow_down,
                                                  color: Colors.grey.shade500,
                                                  size: 26)
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
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            25.0)),
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
                                                          EdgeInsets.fromLTRB(
                                                              20, 20, 20, 20),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              1.5,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets
                                                                .fromLTRB(0, 10,
                                                                    0, 20),
                                                            child: Container(
                                                              // color: Colors.pink,
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.3,
                                                              child: Text(
                                                                  "키워드 선택",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Wrap(
                                                              runSpacing: 10,
                                                              spacing: 10,
                                                              children: List<
                                                                  Widget>.generate(
                                                                keywords.length,
                                                                (index) =>
                                                                    Container(
                                                                  child:
                                                                      ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                        ),
                                                                        elevation: 0,
                                                                        primary: selectedKeywords[index] ? Colors.pink : Colors.grey.shade200,
                                                                        padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                                                        minimumSize: Size.zero,
                                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                                                                    child: Text(
                                                                        "# ${keywords[index]}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color: selectedKeywords[index]
                                                                                ? Colors.white
                                                                                : Colors.grey.shade500)),
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          '3-1. 키워드선택 중');
                                                                      print(
                                                                          finalKeywordData);

                                                                      // 현재 선택된 키워드 갯수 count
                                                                      int count =
                                                                          0;
                                                                      for (int i =
                                                                              0;
                                                                          i < keywords.length;
                                                                          i++) {
                                                                        if (selectedKeywords[
                                                                            i])
                                                                          count++;
                                                                      }

                                                                      // 현재 선택된 키워드 갯수가 7개이고 비활성 키워드를 클릭했을 때는 아무반응없음
                                                                      if (count ==
                                                                              7 &&
                                                                          !selectedKeywords[
                                                                              index]) {
                                                                      } else {
                                                                        if (!selectedKeywords[
                                                                            index]) {
                                                                          mystate(
                                                                              () {
                                                                            selectedKeywords[index] =
                                                                                !selectedKeywords[index];
                                                                            keywordData.add(keywords[index]);
                                                                          });
                                                                        } else {
                                                                          mystate(
                                                                              () {
                                                                            selectedKeywords[index] =
                                                                                !selectedKeywords[index];
                                                                            keywordData.remove(keywords[index]);
                                                                          });
                                                                        }
                                                                      }
                                                                      print(
                                                                          '3-2. 키워드 선택중 끝');
                                                                      print(
                                                                          finalKeywordData);
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.2,
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.1,
                                                                    child:
                                                                        OutlinedButton(
                                                                      child:
                                                                          Text(
                                                                        "닫기",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.pink,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                      style: OutlinedButton.styleFrom(
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          side: BorderSide(color: Colors.pink)),
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          print(
                                                                              '4. 키워드선택 닫기');
                                                                          print(
                                                                              finalKeywordData);
                                                                          selectedKeywords =
                                                                              finalSelectedKeywords;
                                                                          keywordData =
                                                                              finalKeywordData;
                                                                        });
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets.only(
                                                                        right:
                                                                            15)),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.1,
                                                                    child:
                                                                        OutlinedButton(
                                                                      child:
                                                                          Text(
                                                                        "확인",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.pink,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                      style: OutlinedButton.styleFrom(
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          side: BorderSide(color: Colors.pink)),
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          print(
                                                                              '5. 키워드선택 확인');
                                                                          print(
                                                                              finalKeywordData);
                                                                          finalKeywordData =
                                                                              keywordData;
                                                                          finalSelectedKeywords =
                                                                              selectedKeywords;
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
                                    children: finalKeywordData == []
                                        ? [SizedBox.shrink()]
                                        : List.generate(finalKeywordData.length,
                                            (index) {
                                            return Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 10),
                                              child: Container(
                                                height: 30,
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 0, 10, 0),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                          finalKeywordData[
                                                              index],
                                                          style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade500,
                                                              fontSize: 14,
                                                              height: 1)),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: InkWell(
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                EdgeInsets.zero,
                                                            child: Text(" X",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade500,
                                                                    fontSize:
                                                                        14,
                                                                    height:
                                                                        1))),
                                                        onTap: () {
                                                          finalSelectedKeywords[
                                                              keywords.indexOf(
                                                                  finalKeywordData[
                                                                      index])] = !finalSelectedKeywords[
                                                              keywords.indexOf(
                                                                  finalKeywordData[
                                                                      index])];
                                                          setState(() {
                                                            finalKeywordData.remove(
                                                                finalKeywordData[
                                                                    index]);
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
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
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
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  side: BorderSide(color: Colors.pink)),
                              onPressed: () {
                                print(_formKey.currentState!.validate());
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
}
