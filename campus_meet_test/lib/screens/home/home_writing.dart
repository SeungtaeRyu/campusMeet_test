import 'package:campus_meet_test/controller/tag_controller.dart';
import 'package:campus_meet_test/models/Friend/friend_list_model.dart';
import 'package:campus_meet_test/models/Location/location_model.dart';
import 'package:campus_meet_test/models/Tag/tag_model.dart';
import 'package:campus_meet_test/widgets/popup_region_selection_widget.dart';
import 'package:flutter/material.dart';
import 'home_writing_add_member.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({Key? key}) : super(key: key);

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  // 첫번째 빌드 확인여부
  bool isInit = false;

  // 선택된 지역 변수
  List<Location> selectedLocation = [];


  TextEditingController titleController = TextEditingController();
  TextEditingController openChatLinkController = TextEditingController();

  List<FriendList> selectedFriends = []; // 멤버결성창에서 리턴될 데이터

  // tag DB
  late Future<List<Tag>> tags;
  List<int> selectedTagIds = [];

  List<bool> selectedTags = [];

  @override
  void initState() {
    super.initState();
    tags = getAllTag();
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

          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: ElevatedButton(
                onPressed: () {
                  if(titleController.text.length != 0 && selectedLocation.length != 0 && selectedFriends.length != 0 && openChatLinkController.text.length != 0 &&selectedTagIds.length != 0) {
                    int myId = 0;
                    List<int> selectedFriendsId = [myId];
                    for(int i = 0; i < selectedFriends.length; i++) {
                      selectedFriendsId.add(selectedFriends[i].friend.id);
                    }

                    print("titleController.text : ${titleController.text}");
                    print("Location data: ${selectedLocation[0].id}");
                    print("selectedFriendsId: ${selectedFriendsId}");
                    print("openChatLinkController.text : ${openChatLinkController.text}");
                    print("selectedTagsId: ${selectedTagIds}");
                  }
                },
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
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Builder(
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight!,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: FutureBuilder<List<Tag>>(
                    future: tags,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if(!isInit) {
                          // selectedKeywords
                          for (int i = 0; i < snapshot.data!.length; i++) {
                            selectedTags.add(false);
                          }
                        }
                        return SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              // 제목
                              inputTitle(),

                              // 지역
                              inputAddress(),

                              // 참가자
                              addMember(),

                              // 오픈채팅 링크
                              inputOpenChatLink(),

                              // 키워드
                              addKeywords(snapshot),
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                  }
                ),
              );
            }
          ),
        ),
      ),
    );
  }

  // 제목 입력
  Widget inputTitle() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: titleController,
            cursorColor: Colors.grey,
            decoration: InputDecoration(border: InputBorder.none, hintText: '미팅 제목을 입력하세요', hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade500)),
          ),
        ],
      ),
    );
  }

  // 지역 입력
  Widget inputAddress() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              "지역",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child:
            Row(
              children: [
                Text(
                  selectedLocation.length == 0 ? "지역 선택" : "${selectedLocation[0].stateName} ${selectedLocation[0].cityName}",
                  style: TextStyle(fontSize: 16, color: selectedLocation == [] ? Colors.grey.shade500 : Colors.black, height: 1),
                ),
                IconButton(
                  onPressed: (){
                    showModalBottomSheet(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (context) =>
                            RegionSelectionPopupScreen()
                    ).then((value){
                      setState((){
                        if (value.length == 0) {
                        } else {
                          selectedLocation = value;
                        }
                      });
                    });
                  },
                  padding: EdgeInsets.zero, // 아이콘 패딩 설정
                  constraints: BoxConstraints(), // constraints
                  icon: Icon(Icons.keyboard_arrow_down),
                ),

              ],
            )
          ),
        ],
      ),
    );
  }

  // 멤버 추가
  Widget addMember() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "참가자",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.only(bottom: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: selectedFriends.length + 2,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("images/user1_profile.jpg"),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.black.withOpacity(0.3),
                        child: Text(
                          "나",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  );
                } else if (index < selectedFriends.length + 1) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: CircleAvatar(
                      backgroundColor: Colors.pink,
                      radius: 25,
                      child: Text(
                        "${selectedFriends[index - 1].friend.nickname}",
                        style: TextStyle(color: Colors.white, fontSize: 12),
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
                            final data = await Navigator.push(context, MaterialPageRoute(builder: (context) => WritingAddFriendScreen()));
                            setState(() {
                              selectedFriends = data;
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
        ],
      ),
    );
  }

  // 오픈채팅 링크 입력
  Widget inputOpenChatLink() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "채팅 링크",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
            child: Row(
              children: [
                Icon(Icons.link, color: Colors.grey.shade500),
                Padding(padding: EdgeInsets.only(right: 10)),
                Expanded(
                  child: TextFormField(
                    controller: openChatLinkController,
                    cursorColor: Colors.grey,
                    style: TextStyle(color: Colors.grey.shade500),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '오픈 채팅방 링크를 입력해주세요.',
                      hintStyle: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20))
        ],
      ),
    );
  }

  // 키워드 추가
  Widget addKeywords(AsyncSnapshot<List<Tag>> snapshot) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "키워드",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
              "(최대 5개까지 선택가능)",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
          ),

          // keywords 나열하자!
          Wrap(
            runSpacing: 10,
            spacing: 10,
            children: List<Widget>.generate(
              snapshot.data!.length,
              (index) => Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                    primary: selectedTags[index] ? Colors.pink : Colors.grey.shade200,
                    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    "# ${snapshot.data![index].text}",
                    style: TextStyle(fontSize: 13, color: selectedTags[index] ? Colors.white : Colors.grey.shade500),
                  ),
                  onPressed: () {
                    // 현재 선택된 키워드 갯수 count
                    int count = 0;
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      if (selectedTags[i]) count++;
                    }

                    // 현재 선택된 키워드 갯수가 5개이고 비활성 키워드를 클릭했을 때는 아무반응없음
                    if (count == 5 && !selectedTags[index]) {
                    } else {
                      setState(() {
                        if (selectedTags[index]) {
                          selectedTags[index] = false;
                          selectedTagIds.remove(snapshot.data![index].id);
                        } else {
                          selectedTags[index] = true;
                          selectedTagIds.add(snapshot.data![index].id);
                        }
                      });
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20))
        ],
      ),
    );
  }
}
