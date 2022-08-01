import 'package:campus_meet_test/controller/location_controller.dart';
import '../../models/Location/location_model.dart';
import 'package:flutter/material.dart';

class RegionSelectionPopupScreen extends StatefulWidget {
  const RegionSelectionPopupScreen({Key? key}) : super(key: key);

  @override
  _RegionSelectionPopupScreenState createState() => _RegionSelectionPopupScreenState();
}

class _RegionSelectionPopupScreenState extends State<RegionSelectionPopupScreen> {
  // 어떤 페이지에서 호출했는지 담을 변수


  // api 요청 변수
  late Future<List<Location>> allLocations;

  // 첫 빌드 여부
  bool isInit = false;

  // stateName, cityName
  List<String> stateName = [];
  List<bool> selectedStateName = [];
  List<String> cityName = [];
  List<bool> selectedCityName = [];

  // return location data
  late List<Location> returnLocations;

  @override
  void initState() {
    super.initState();
    allLocations = getAllLocations();
    returnLocations = [];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, returnLocations);
        return true; // return true if needs to be popped
      },
      child: FutureBuilder<List<Location>>(
        future: allLocations,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (!isInit) {
              isInit = true;
              // state 지역 갯수 할당, 중복 제거
              for (int i = 0; i < snapshot.data!.length; i++) {
                stateName.add(snapshot.data![i].stateName);
              }
              stateName = stateName.toSet().toList();

              // 첫번째 state 자동 선택으로 초기화
              for (int i = 0; i < stateName.length; i++) {
                if (i == 0) {
                  selectedStateName.add(true);
                } else {
                  selectedStateName.add(false);
                }
              }

              // city 지역 갯수 할당
              for (int i = 0; i < snapshot.data!.length; i++) {
                if (snapshot.data![i].stateName == stateName[selectedStateName.indexOf(true)]) {
                  cityName.add(snapshot.data![i].cityName);
                }
              }

              // 첫번째 city 자동 선택으로 초기화
              for (int i = 0; i < cityName.length; i++) {
                if (i == 0) {
                  selectedCityName.add(true);
                } else {
                  selectedCityName.add(false);
                }
              }
            }
            return Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                height: MediaQuery.of(context).size.width * 1.5,
                child: StatefulBuilder(builder: (BuildContext context, StateSetter myState) {
                  return Column(
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

                            // stateName 목록 렌더링
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey.shade300), right: BorderSide(color: Colors.grey.shade300))),
                              child: ListView.builder(
                                itemCount: stateName.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: selectedStateName[index] ? Colors.pink : Colors.white,
                                      child: InkWell(

                                        // 클릭 시 상태관리 로직
                                        onTap: () {
                                          // selectedStateName 새로 담을 변수 설정
                                          List<bool> result = [];
                                          for (int i = 0; i < stateName.length; i++) {
                                            if (i == index) {
                                              result.add(true);
                                            } else {
                                              result.add(false);
                                            }
                                          }

                                          // cityName 초기화
                                          cityName = [];
                                          for (int i = 0; i < snapshot.data!.length; i++) {
                                            if (snapshot.data![i].stateName == stateName[result.indexOf(true)]) {
                                              cityName.add(snapshot.data![i].cityName);
                                            }
                                          }

                                          // selectedCityName 초기화
                                          selectedCityName = [];
                                          for (int i = 0; i < cityName.length; i++) {
                                            if (i == 0) {
                                              selectedCityName.add(true);
                                            } else {
                                              selectedCityName.add(false);
                                            }
                                          }

                                          myState(() {
                                            selectedStateName = result;
                                          });
                                        },
                                        child: Text(
                                          stateName[index],
                                          style: TextStyle(color: selectedStateName[index] ? Colors.white : Colors.black, fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            // cityName 목록 렌더링
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                                child: StatefulBuilder(builder: (BuildContext context, StateSetter myState) {
                                  return ListView.builder(
                                    itemCount: cityName.length, // 첫번째선택된주소의 개수
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
                                            cityName[index],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: selectedCityName[index] ? FontWeight.bold : FontWeight.normal,
                                            ),
                                          ),

                                          // 클릭 시 상태관리 로직
                                          onPressed: () {
                                            // selectedSecondAddress 초기화
                                            List<bool> result = [];
                                            for (int i = 0; i < cityName.length; i++) {
                                              if (i == index) {
                                                result.add(true);
                                              } else {
                                                result.add(false);
                                              }
                                            }

                                            myState(() {
                                              selectedCityName = result;
                                            });
                                          },
                                        ),
                                      );
                                    },
                                  );
                                }),
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
                                    returnLocations = [];
                                    Navigator.pop(context, returnLocations);
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
                                    returnLocations = [];
                                    for (int i = 0; i < snapshot.data!.length; i++) {
                                      if (snapshot.data![i].stateName == stateName[selectedStateName.indexOf(true)] && snapshot.data![i].cityName == cityName[selectedCityName.indexOf(true)]) {
                                        returnLocations.add(snapshot.data![i]);
                                      }
                                    }
                                    setState(() {
                                      // return data 변경
                                      Navigator.pop(context, returnLocations);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
