import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:campus_meet_test/models/address_model.dart';
import 'package:flutter/material.dart';

import 'myPageEditKeyword.dart';

class MyPageEditScreen extends StatefulWidget {
  const MyPageEditScreen({Key? key}) : super(key: key);

  @override
  _MyPageEditScreenState createState() => _MyPageEditScreenState();
}

class _MyPageEditScreenState extends State<MyPageEditScreen> {
  TextEditingController selfIntroduction = TextEditingController();
  TextEditingController major = TextEditingController();

  List<String> images = ['사진1', '사진2', '사진3', '사진4', '사진5'];

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

  @override
  void initState() {
    super.initState();
    selfIntroduction.text = "저는 인간이 된 댕댕이입니다.";

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
      if (addresses[i].firstAddress == filteredFirstAddress[selectedFirstAddress.indexOf(true)]) {
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
        toolbarHeight: MediaQuery.of(context).size.width * 0.1,
        elevation: 0.0,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 5),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "완료",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                // 프로필 사진
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("프로필 사진", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.only(bottom: 8)),
                      Text("다양한 사진들을 추가하여 매칭 성공률을 높여보세요!", style: TextStyle(fontSize: 15)),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      Container(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 9,
                          itemBuilder: (BuildContext context, int index) {
                            if (index < images.length) {
                              return Container(
                                margin: EdgeInsets.only(right: index == 8 ? 0 : 20),
                                child: InkWell(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 68,
                                      backgroundImage: AssetImage('images/user1_profile.jpg'),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(right: index == 8 ? 0 : 20),
                                  child: CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.grey,
                                    child: CircleAvatar(
                                      radius: 68,
                                      backgroundColor: Colors.white,
                                      child: Text('+'),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // 기본 정보
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("기본 정보", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.pink,
                            child: Icon(CustomIcons.my_page, size: 15, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text("나이", style: TextStyle(height: 1))
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.pink,
                            child: Icon(CustomIcons.my_page, size: 15, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text(addressData == '' ? "사는 지역" : addressData, style: TextStyle(color: addressData == '' ? Colors.black : Colors.pink, height: 1)),
                          IconButton(
                            padding: EdgeInsets.zero, // 아이콘 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            onPressed: () {
                              selectAddress();
                            },


                            icon: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: addressData == '' ? Colors.black : Colors.pink),

                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.pink,
                            child: Icon(CustomIcons.my_page, size: 15, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          // Text("학과 미입력", style: TextStyle(height: 1))
                          Expanded(
                            child: Container(
                              height: 30,
                              child: TextFormField(
                                controller: major,
                                onChanged: (value) {
                                },
                                style: TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                  hintText: "학과 미입력",
                                  contentPadding: EdgeInsets.zero,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 자기소개
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // 자기소개 설명
                      Text("자기 소개", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.only(bottom: 8)),
                      Text("상대방이 당신을 더 잘 파악하게 하기 위해 아래 질문들에 답변해 주세요!", style: TextStyle(fontSize: 15)),
                      Padding(padding: EdgeInsets.only(bottom: 20)),

                      // 한마디 표현
                      Row(
                        children: [
                          Icon(Icons.check_circle_rounded, color: Colors.pink),
                          Text(' 당신을 한마디로 표현하자면?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Container(
                        child: TextFormField(
                          controller: selfIntroduction,
                          onChanged: (value) {
                            // setState(() {
                            //   textValue = value;
                            // });
                          },
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20)),

                      // 키워드 질문
                      _renderQustion("당신은 어떤 사람인가요?"),
                      Padding(padding: EdgeInsets.only(bottom: 15)),
                      Wrap(
                          spacing: 11,
                          runSpacing: 15,
                          children: List.generate(9 + 1, (index) {
                            if (index == 9) {
                              return InkWell(
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.pink),
                                    child: Text('+', style: TextStyle(color: Colors.white, height: 1))),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageEditKeywordScreen()));
                                },
                              );
                            } else {
                              return Container(
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
                                  child: Text('키워드', style: TextStyle(color: Colors.grey.shade500, height: 1)));
                            }
                          })),

                      _renderQustion("쉬는날 주로 무얼 하나요?"),
                      Padding(padding: EdgeInsets.only(bottom: 10)),

                      _renderQustion("어떤 상대에게 호감을 느끼나요?"),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _renderQustion(String title) {
    return Row(
      children: [
        Text("Q. ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
        Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // 지역 선택
  Future selectAddress() {
    return showModalBottomSheet(
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
                          // color: Colors.pink,
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
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey.shade300), right: BorderSide(color: Colors.grey.shade300))),
                          child: renderFirstAddress(mystate),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                            child: renderSecondAddress(mystate),
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
                                  addressData = "${filteredFirstAddress[selectedFirstAddress.indexOf(true)]} ${secondAddress[selectedSecondAddress.indexOf(true)]}";
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
  }

  renderFirstAddress(StateSetter mystate) {
    return ListView.builder(
      itemCount: filteredFirstAddress.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: CircleAvatar(
            radius: 20,
            backgroundColor: selectedFirstAddress[index] ? Colors.pink : Colors.white,
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
                  if (addresses[i].firstAddress == filteredFirstAddress[result.indexOf(true)]) {
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
                style: TextStyle(color: selectedFirstAddress[index] ? Colors.white : Colors.black, fontSize: 14),
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
                fontWeight: selectedSecondAddress[index] ? FontWeight.bold : FontWeight.normal,
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
