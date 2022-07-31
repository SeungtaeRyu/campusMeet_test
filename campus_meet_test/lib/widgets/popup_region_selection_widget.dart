import 'package:campus_meet_test/controller/location_controller.dart';
import '../../models/Location/location_model.dart';
import 'package:flutter/material.dart';

class RegionSelectionPopupScreen extends StatefulWidget {
  const RegionSelectionPopupScreen({Key? key}) : super(key: key);

  @override
  _RegionSelectionPopupScreenState createState() => _RegionSelectionPopupScreenState();
}

class _RegionSelectionPopupScreenState extends State<RegionSelectionPopupScreen> {
  late Future<List<Location>> allLocations;

  @override
  void initState() {
    super.initState();
    int id = 0;
    allLocations = getAllLocations();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.keyboard_arrow_down),
      padding: EdgeInsets.zero, // 아이콘 패딩 설정
      constraints: BoxConstraints(), // constraints
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          isScrollControlled: true,
          context: context,
          builder: (builder) {
            return FutureBuilder<List<Location>>(
              future: allLocations,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
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
                                  decoration:
                                  BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey.shade300), right: BorderSide(color: Colors.grey.shade300))),
                                  // child: renderFirstAddress(mystate),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                                    // child: renderSecondAddress(mystate),
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
                                          // addressData = "${filteredFirstAddress[selectedFirstAddress.indexOf(true)]} ${secondAddress[selectedSecondAddress.indexOf(true)]}";
                                          // 여기 재활용 해야함!! 필터 페이지 지역선택에 쓸꺼임!!
                                          // addressData.add("${filteredFirstAddress[selectedFirstAddress.indexOf(true)]} ${secondAddress[selectedSecondAddress.indexOf(true)]}");
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
                      )
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          },
        );
      },
    );
  }
}
