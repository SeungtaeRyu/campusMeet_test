import 'package:campus_meet_test/controller/friend_controller.dart';
import 'package:campus_meet_test/models/Friend/friend_list_model.dart';
import 'package:flutter/material.dart';

class WritingAddFriendScreen extends StatefulWidget {
  const WritingAddFriendScreen({Key? key}) : super(key: key);

  @override
  State<WritingAddFriendScreen> createState() => _WritingAddFriendScreenState();
}

class _WritingAddFriendScreenState extends State<WritingAddFriendScreen> {
  late Future<List<FriendList>> myFriends;

  // 첫번째 빌드 확인여부
  bool isInit = false;

  // 선택된 친구 데이터 확인할 boolean
  List<bool> selected = [];

  // 선택한 친구 count
  int count = 0;

  // 선택된 친구 데이터 저장할 변수
  List<FriendList> selectedFriends = [];

  int myId = 0;
  List<int> selectedFriendId = []; // 친구 추가 아이콘 true인 친구 list, Navigator.pop에 담을 데이터
  List<String> nullData = [];

  // 여기는 검색 엔진 구간
  final TextEditingController _search = TextEditingController();
  List<String> friendNameList = [];
  String _searchText = "";
  _WritingAddFriendScreenState() {
    _search.addListener(() {
      setState(() {
        _searchText = _search.text;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    myFriends = getMyFriend();
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
                    // if(selectedFriends.length + 1 == widget.post.numOfMember) {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => MeetingRequest2(memberData: selectedFriends)));
                    // }
                    if (count >= 1) {
                      Navigator.pop(context, selectedFriends);
                    }
                  },
                  child: Text(
                    "완료",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
            )
          ],
        ),

        body: FutureBuilder<List<FriendList>>(
          future: myFriends,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if(!isInit) {
                for (var i = 0; i < snapshot.data!.length; i++) {
                  selected.add(false);
                  friendNameList.add(snapshot.data![i].friend.nickname);
                  isInit = true;
                }
              }
              return Column(
                children: [
                  // 이름 검색용 컨테이너
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      keyboardType: TextInputType.name,
                      controller: _search,
                      decoration: InputDecoration(
                        hintText: "이름을 입력하세요...",
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                            color: Colors.pink,
                            icon: Icon(Icons.search),
                            onPressed: () {}),
                        contentPadding: EdgeInsets.only(
                            left: 18, bottom: 5, top: 5, right: 5),
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


                  // 선택한 구성원 있을 시
                  Visibility(
                      visible: selected.indexOf(true) != -1,
                      child: Container(
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectedFriends.length,
                          itemBuilder: (BuildContext context, int index){
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
                                              selected[snapshot.data!.indexOf(selectedFriends[index])] = !selected[snapshot.data!.indexOf(selectedFriends[index])];
                                              selectedFriends.remove(selectedFriends[index]);
                                              count = count - 1 ;
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
                                Container(padding: EdgeInsets.only(bottom: 10), child: Text("${selectedFriends[index].friend.nickname} ")),
                              ],
                            );
                          },
                        ),
                      )
                  ),

                  Divider(height: 5, thickness: 5),

                  // 친구 목록 렌더링 컬럼 > 로우 > 이미지, 이름, 아이콘버튼

                  Expanded(
                    child: _search.text.length != 0 ? buildSearchList(snapshot) : Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
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
                                Text("${snapshot.data![index].friend.nickname}"),
                                Expanded(child: Container()),
                                IconButton(
                                    onPressed: () {
                                      // 미팅멤버 수 초과는 고르지 않음!
                                      if (count == 4 && !selected[index]) {
                                      } else {
                                        setState(() {
                                          if (!selected[index]) {
                                            selected[index] = !selected[index];
                                            selectedFriends.add(snapshot.data![index]);
                                            count = count + 1;
                                          } else {
                                            selected[index] = !selected[index];
                                            selectedFriends.remove(snapshot.data![index]);
                                            count = count - 1;
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
                        )),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  buildSearchList(AsyncSnapshot<List<FriendList>> snapshot) {
    List<String> searchResults = [];
    for (String d in friendNameList) {
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
                  if (count == 4 && !selected[index]) {
                  } else {
                    setState(() {
                      if (!selected[friendNameList.indexOf(searchResults[index])]) {
                        selected[friendNameList.indexOf(searchResults[index])] = !selected[friendNameList.indexOf(searchResults[index])];
                        selectedFriends.add(snapshot.data![friendNameList.indexOf(searchResults[index])]);
                        count = count + 1;
                      } else {
                        selected[friendNameList.indexOf(searchResults[index])] = !selected[friendNameList.indexOf(searchResults[index])];
                        selectedFriends.remove(snapshot.data![friendNameList.indexOf(searchResults[index])]);
                        count = count - 1;
                      }
                    });
                  }
                },
                icon: selected[friendNameList.indexOf(searchResults[index])]
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
