import 'package:campus_meet_test/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeetingFilterScreen extends StatefulWidget {
  const MeetingFilterScreen({Key? key}) : super(key: key);

  @override
  State<MeetingFilterScreen> createState() => _MeetingFilterScreenState();
}

class _MeetingFilterScreenState extends State<MeetingFilterScreen> {
  double numMemberController = 2;
  TextEditingController studuntIDController1 = TextEditingController();
  TextEditingController studuntIDController2 = TextEditingController();
  TextEditingController ageController1 = TextEditingController();
  TextEditingController ageController2 = TextEditingController();


  // 주소 DB
  List<String> firstAddress = [];
  List<String> filteredFirstAddress = [];
  List<bool> selectedFirstAddress = [];

  List<int> filteredFirstAddressCount = [];
  int addIndex = 0;

  List<bool> tempAddressBool = [];
  List<bool> resultAddressBool = [];
  List<int> tempAddressId = [];
  List<int> resultAddressId = [];

  List<Address> addresses = [
    Address.fromMap(
      {
        'id': 0,
        'firstAddress': '서울',
        'secondAddress': '동작구',
      },
    ),
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


  // 키워드 DB
  List<String> tempKeywords = [];
  List<String> resultKeywords = [];

  List<bool> tempKeywordBool = [];
  List<bool> resultKeywordBool = [];

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

    numMemberController = 2;
    addIndex = 0;
    tempAddressBool = [];
    resultAddressBool = [];
    tempAddressId = [];
    resultAddressId = [];
    studuntIDController1.text = "";
    studuntIDController2.text = "";
    ageController1.text = "";
    ageController2.text = "";
    tempKeywords = [];
    tempKeywordBool = [];
    resultKeywords = [];
    resultKeywordBool = [];

    // first address 중복 삭제
    for (int i = 0; i < addresses.length; i++) {
      firstAddress.add(addresses[i].firstAddress);
    }
    filteredFirstAddress = firstAddress.toSet().toList();

    // first address selected default 값 설정
    for (int i = 0; i < filteredFirstAddress.length; i++) {
      if (i == 0) {
        selectedFirstAddress.add(true);
      } else {
        selectedFirstAddress.add(false);
      }
    }

    // 중복 삭제된 first address 마다 second address 의 개수 구하기
    for (int i = 0; i < filteredFirstAddress.length; i++) {
      int count = 0;
      for (int j = 0; j < addresses.length; j++) {
        if (filteredFirstAddress[i] == addresses[j].firstAddress) {
          count++;
        }
      }
      filteredFirstAddressCount.add(count);
    }

    // second address selected default 값 설정
    for (int i = 0; i < addresses.length; i++) {
      tempAddressBool.add(false);
      resultAddressBool.add(false);
    }

    // keyword selected default 값 설정
    for (int i = 0; i < keywords.length; i++) {
      tempKeywordBool.add(false);
      resultKeywordBool.add(false);
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
          centerTitle: true,
          elevation: 0.0,
          title: Text('검색 필터', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
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
                          // 인원수 선택
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                renderHeaderText("인원수"),
                                SliderTheme(
                                  data: SliderThemeData(
                                    trackShape: CustomTrackShape(),
                                    trackHeight: 5,
                                    valueIndicatorColor: Colors.pink,
                                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0), // thumb size
                                  ),
                                  child: Slider(
                                    value: numMemberController,
                                    onChanged: (newnumMember) {
                                      setState(() {
                                        numMemberController = newnumMember;
                                      });
                                    },
                                    min: 2,
                                    max: 5,
                                    divisions: 3,
                                    activeColor: Colors.grey.shade300,
                                    inactiveColor: Colors.grey.shade300,
                                    thumbColor: Colors.pink,
                                    label: "${numMemberController.round()}",
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                          // 지역 선택
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                renderHeaderText("지역 선택"),
                                renderAddressPopUp(),
                                renderResultAddress(),
                              ],
                            ),
                          ),

                          // 학번 선택
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                renderHeaderText("학번 선택"),
                                renderStudentIdInputBox(),
                              ],
                            ),
                          ),

                          // 나이 선택
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                renderHeaderText("나이 선택"),
                                renderAgeInputBox(),
                              ],
                            ),
                          ),

                          //키워드 선택
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                renderHeaderText("키워드 선택"),
                                renderKeywordsPopUp(),
                                renderResultKeywords(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                bottomButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 제목
  renderHeaderText(String text) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  // 지역 선택
  renderAddressPopUp() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 5),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Row(
              children: [
                Text(
                  "지역을 선택하세요",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500, height: 1),
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
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                ),
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
                    return SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        height: MediaQuery.of(context).size.width * 1.5,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      "시/도",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    // color: Colors.blue,
                                    padding: EdgeInsets.only(left: 30),
                                    alignment: Alignment.centerLeft,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      "시/구/군",
                                      style: TextStyle(fontSize: 16),
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
                                  // first Address
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey.shade300), right: BorderSide(color: Colors.grey.shade300))),
                                    child: ListView.builder(
                                      itemCount: filteredFirstAddress.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Container(
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: selectedFirstAddress[index] ? Colors.pink : Colors.white,
                                            child: InkWell(
                                              onTap: () {
                                                // 첫번째 주소 선택 시 셀렉트 변경
                                                List<bool> result = [];
                                                for (int i = 0; i < filteredFirstAddress.length; i++) {
                                                  if (i == index) {
                                                    result.add(true);
                                                  } else {
                                                    result.add(false);
                                                  }
                                                }

                                                // 두번째 주소에 추가로 줄 인덱스 카운팅
                                                addIndex = 0;
                                                for (int i = 0; i < index; i++) {
                                                  addIndex += filteredFirstAddressCount[i];
                                                }

                                                mystate(() {
                                                  selectedFirstAddress = result;
                                                });
                                              },
                                              child: Text(
                                                filteredFirstAddress[index],
                                                style: TextStyle(color: selectedFirstAddress[index] ? Colors.white : Colors.black, fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                  // second Address
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      width: MediaQuery.of(context).size.width * 0.3,
                                      decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                                      child: ListView.builder(
                                        itemCount: filteredFirstAddressCount[selectedFirstAddress.indexOf(true)],
                                        itemBuilder: (BuildContext context, int index) {
                                          return Container(
                                            padding: EdgeInsets.only(left: 30),
                                            alignment: Alignment.centerLeft,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.zero,
                                              ),
                                              child: Text(
                                                addresses[index + addIndex].secondAddress,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: tempAddressBool[index + addIndex] ? FontWeight.bold : FontWeight.normal,
                                                ),
                                              ),
                                              onPressed: () {
                                                int count = 0;
                                                for (int i = 0; i < tempAddressBool.length; i++) {
                                                  if (tempAddressBool[i]) count++;
                                                }

                                                if (count == 5 && !tempAddressBool[index + addIndex]) {
                                                } else {
                                                  if (!tempAddressBool[index + addIndex]) {
                                                    mystate(() {
                                                      tempAddressBool[index + addIndex] = true;
                                                      tempAddressId.add(addresses[index + addIndex].id);
                                                    });
                                                  } else {
                                                    mystate(() {
                                                      tempAddressBool[index + addIndex] = false;
                                                      tempAddressId.remove(addresses[index + addIndex].id);
                                                    });
                                                  }
                                                }
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
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
                                          "닫기",
                                          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            side: BorderSide(color: Colors.pink)),
                                        onPressed: () {
                                          setState(() {
                                            for (int i = 0; i < addresses.length; i++) {
                                              tempAddressBool[i] = resultAddressBool[i];
                                            }
                                            tempAddressId = [];
                                            for (int i = 0; i < resultAddressId.length; i++) {
                                              tempAddressId.add(resultAddressId[i]);
                                            }
                                          });
                                          Navigator.pop(context);
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
                                          "확인",
                                          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            side: BorderSide(color: Colors.pink)),
                                        onPressed: () {
                                          setState(() {
                                            for (int i = 0; i < addresses.length; i++) {
                                              resultAddressBool[i] = tempAddressBool[i];
                                            }
                                            resultAddressId = [];
                                            for (int i = 0; i < tempAddressId.length; i++) {
                                              resultAddressId.add(tempAddressId[i]);
                                            }
                                          });
                                          Navigator.pop(context);
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
    );
  }

  renderResultAddress() {
    return Wrap(
      children: resultAddressId == []
          ? [SizedBox.shrink()]
          : List.generate(
              resultAddressId.length,
              (index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                  child: Container(
                    height: 30,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text("${resultAddressId[index]}", style: TextStyle(color: Colors.grey.shade500, fontSize: 14, height: 1)),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            child: Container(alignment: Alignment.center, padding: EdgeInsets.zero, child: Text(" X", style: TextStyle(color: Colors.grey.shade500, fontSize: 14, height: 1))),
                            onTap: () {
                              setState(() {
                                tempAddressBool[tempAddressId[index]] = false;
                                resultAddressBool[resultAddressId[index]] = false;

                                tempAddressId.remove(tempAddressId[index]);
                                resultAddressId.remove(resultAddressId[index]);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  // 학번 선택
  renderStudentIdInputBox() {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: studuntIDController1,
              keyboardType: TextInputType.number,
              cursorColor: Colors.grey,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(2)],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                hintText: '제한 없음',
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
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
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                hintText: '22',
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 나이 선택
  renderAgeInputBox() {
    return Container(
      // height: 80,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  hintText: '19',
                  hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                  errorStyle: TextStyle(fontSize: 0.01),
                  // border: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.blue)),
                  // disabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.grey.shade300)),
                  // focusedErrorBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.grey.shade300)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
                ),
                validator: (value) {
                  if ((value != null && int.parse(value) < 19)) {
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
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                hintText: '제한 없음',
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 키워드 선택
  renderKeywordsPopUp() {
    return Row(
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
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500, height: 1),
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
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                ),
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
                    return SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        height: MediaQuery.of(context).size.width * 1.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  "키워드 선택",
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                                        primary: tempKeywordBool[index] ? Colors.pink : Colors.grey.shade200,
                                        padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                        minimumSize: Size.zero,
                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Text(
                                        "# ${keywords[index]}",
                                        style: TextStyle(fontSize: 13, color: tempKeywordBool[index] ? Colors.white : Colors.grey.shade500),
                                      ),
                                      onPressed: () {
                                        // 현재 선택된 키워드 갯수 count
                                        int count = 0;
                                        for (int i = 0; i < keywords.length; i++) {
                                          if (tempKeywordBool[i]) count++;
                                        }

                                        if (!tempKeywordBool[index]) {
                                          mystate(() {
                                            tempKeywordBool[index] = true;
                                            tempKeywords.add(keywords[index]);
                                          });
                                        } else {
                                          mystate(() {
                                            tempKeywordBool[index] = false;
                                            tempKeywords.remove(keywords[index]);
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width * 0.2,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: MediaQuery.of(context).size.width * 0.1,
                                      child: OutlinedButton(
                                        child: Text("닫기", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
                                        style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), side: BorderSide(color: Colors.pink)),
                                        onPressed: () {
                                          setState(() {
                                            for (int i = 0; i < keywords.length; i++) {
                                              tempKeywordBool[i] = resultKeywordBool[i];
                                            }

                                            tempKeywords = [];
                                            for (int i = 0; i < resultKeywords.length; i++) {
                                              tempKeywords.add(resultKeywords[i]);
                                            }
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 15)),
                                  Expanded(
                                    child: Container(
                                      height: MediaQuery.of(context).size.width * 0.1,
                                      child: OutlinedButton(
                                        child: Text("확인", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
                                        style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            side: BorderSide(color: Colors.pink)),
                                        onPressed: () {
                                          setState(() {
                                            for (int i = 0; i < keywords.length; i++) {
                                              resultKeywordBool[i] = tempKeywordBool[i];
                                            }
                                            resultKeywords = [];
                                            for (int i = 0; i < tempKeywords.length; i++) {
                                              resultKeywords.add(tempKeywords[i]);
                                            }
                                          });
                                          Navigator.pop(context);
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
    );
  }

  renderResultKeywords() {
    return Wrap(
      children: resultKeywords == []
          ? [SizedBox.shrink()]
          : List.generate(resultKeywords.length, (index) {
              return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                child: Container(
                  height: 30,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(resultKeywords[index], style: TextStyle(color: Colors.grey.shade500, fontSize: 14, height: 1)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: InkWell(
                          child: Container(alignment: Alignment.center, padding: EdgeInsets.zero, child: Text(" X", style: TextStyle(color: Colors.grey.shade500, fontSize: 14, height: 1))),
                          onTap: () {
                            setState(() {
                              tempKeywordBool[keywords.indexOf(tempKeywords[index])] = false;
                              resultKeywordBool[keywords.indexOf(resultKeywords[index])] = false;

                              tempKeywords.remove(tempKeywords[index]);
                              resultKeywords.remove(resultKeywords[index]);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
    );
  }

  // 초기화, 적용 버튼
  bottomButton() {
    return Container(
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
                  style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                ),
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(color: Colors.pink)),
                onPressed: () {
                  setState(() {
                    numMemberController = 2;
                    addIndex = 0;
                    tempAddressBool = [];
                    resultAddressBool = [];
                    tempAddressId = [];
                    resultAddressId = [];
                    studuntIDController1.text = "";
                    studuntIDController2.text = "";
                    ageController1.text = "";
                    ageController2.text = "";
                    tempKeywords = [];
                    tempKeywordBool = [];
                    resultKeywords = [];
                    resultKeywordBool = [];

                    // first address selected default 값 설정
                    selectedFirstAddress = [];
                    for (int i = 0; i < filteredFirstAddress.length; i++) {
                      if (i == 0) {
                        selectedFirstAddress.add(true);
                      } else {
                        selectedFirstAddress.add(false);
                      }
                    }

                    // second address selected default 값 설정
                    for (int i = 0; i < addresses.length; i++) {
                      tempAddressBool.add(false);
                      resultAddressBool.add(false);
                    }

                    // keyword selected default 값 설정
                    for (int i = 0; i < keywords.length; i++) {
                      tempKeywordBool.add(false);
                      resultKeywordBool.add(false);
                    }
                  });
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
                  style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                ),
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(color: Colors.pink)),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
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
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}