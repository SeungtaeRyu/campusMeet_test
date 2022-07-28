import 'package:flutter/material.dart';

class MemberFomationScreen extends StatefulWidget {
  const MemberFomationScreen({Key? key}) : super(key: key);

  @override
  State<MemberFomationScreen> createState() => _MemberFomationScreenState();
}

class _MemberFomationScreenState extends State<MemberFomationScreen> {
  List<String> friendName = ["도진", "해수", "해수2", "해수3", "해수4", "승태", "현재", "준우", "한비", "경민", "경진", "현민", "수진"]; // 추후 친구목록 DB.length 로 수정
  List<bool> selected = []; // 친구 추가 아이콘 true/false
  List<String> selectedFriendName = []; // 친구 추가 아이콘 true인 친구 list, Navigator.pop에 담을 데이터

  List<String> nullData = [];
  final TextEditingController _search = TextEditingController();
  String _searchText = "";

  _MemberFomationScreenState() {
    _search.addListener(() {
      setState(() {
        _searchText = _search.text;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < friendName.length; i++) {
      selected.add(false);
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
                Navigator.pop(context, nullData);
              }),
          backgroundColor: Colors.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.1,
          elevation: 0.0,
          actions: [
            Container(
              padding: EdgeInsets.only(right: 5),
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, selectedFriendName);
                  },
                  child: Text(
                    "완료",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      keyboardType: TextInputType.name,
                      controller: _search,
                      decoration: InputDecoration(
                        hintText: "이름을 입력하세요...",
                        fillColor: Colors.white,
                        suffixIcon: IconButton(color: Colors.pink, icon: Icon(Icons.search), onPressed: () {}),
                        contentPadding: EdgeInsets.only(left: 18, bottom: 5, top: 5, right: 5),
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
                ],
              ),
            ),

            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.centerLeft,
              child: selected.indexOf(true) == -1
                  ? SizedBox.shrink()
                  : Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedFriendName.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.pink,
                                  radius: 25,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.pink,
                                      radius: 8,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            selected[friendName.indexOf(selectedFriendName[index])] = false;
                                            selectedFriendName.remove(selectedFriendName[index]);
                                          });
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(padding: EdgeInsets.only(bottom: 10), child: Text("${selectedFriendName[index]} ")),
                            ],
                          );
                        },
                      ),
                    ),
            ),

            Divider(height: 5, thickness: 5),

            // 친구 목록 렌더링 컬럼 > 로우 > 이미지, 이름, 아이콘버튼
            Expanded(
              child: _search.text.length != 0
                  ? buildSearchList()
                  : Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: friendName.length, // 추후 친구목록 DB.length 로 수정
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.pink,
                                  radius: 25,
                                ),
                              ),
                              Text("${friendName[index]}"),
                              Expanded(child: Container()),
                              IconButton(
                                  onPressed: () {
                                    // 선택한 친구 수 count
                                    int count = 0;
                                    for (int i = 0; i < friendName.length; i++) {
                                      if (selected[i]) count++;
                                    }

                                    // 5명째에는 동작하지 않음
                                    if (count == 4 && !selected[index]) {
                                    } else {
                                      setState(() {
                                        if (!selected[index]) {
                                          selected[index] = !selected[index];
                                          selectedFriendName.add(friendName[index]);
                                        } else {
                                          selected[index] = !selected[index];
                                          selectedFriendName.remove(friendName[index]);
                                        }
                                      });
                                    }
                                  },
                                  icon: selected[index]
                                      ? Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.pink,
                                        )
                                      : Icon(Icons.circle_outlined)),
                            ],
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  buildSearchList() {
    List<String> searchResults = [];
    for (String d in friendName) {
      if (d.contains(_searchText)) {
        searchResults.add(d);
      }
    }

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 25,
              ),
            ),
            Text("${searchResults[index]}"),
            Expanded(child: Container()),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (!selected[friendName.indexOf(searchResults[index])]) {
                      selected[friendName.indexOf(searchResults[index])] = !selected[friendName.indexOf(searchResults[index])];
                      selectedFriendName.add(friendName[friendName.indexOf(searchResults[index])]);
                    } else {
                      selected[friendName.indexOf(searchResults[index])] = !selected[friendName.indexOf(searchResults[index])];
                      selectedFriendName.remove(friendName[friendName.indexOf(searchResults[index])]);
                    }
                  });
                },
                icon: selected[friendName.indexOf(searchResults[index])]
                    ? Icon(
                        Icons.check_circle_rounded,
                        color: Colors.pink,
                      )
                    : Icon(Icons.circle_outlined)),
          ],
        );
      },
    );
  }
}
