import 'package:campus_meet_test/models/Friend/friend_list_model.dart';
import 'package:campus_meet_test/models/Location/location_model.dart';
import 'package:campus_meet_test/models/address_model.dart';
import 'package:campus_meet_test/widgets/popup_region_selection_widget.dart';
import 'package:flutter/material.dart';
import 'home_writing_add_member.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({Key? key}) : super(key: key);

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {

  // 선택된 지역 변수
  List<Location> selectedLocation = [];


  TextEditingController titleController = TextEditingController();
  TextEditingController openChatLinkController = TextEditingController();

  List<FriendList> selectedFriends = []; // 멤버결성창에서 리턴될 데이터


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

          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: ElevatedButton(
                onPressed: () {
                  // print("titleController.text : ${titleController.text}");
                  // print("Location data: ${selectedLocation[0].id}");
                  // print("member data: ${memberData}");
                  // print("openChatLinkController.text : ${openChatLinkController.text}");
                  // print("keywords 선택된 건 selectedKeywords의 true값");
                  // print(selectedKeywords);
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
                child: SingleChildScrollView(
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
                      addKeywords(),
                    ],
                  ),
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
  Widget addKeywords() {
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
              "(최대 7개까지 선택가능)",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
          ),

          // keywords 나열하자!
          Wrap(
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
                    primary: selectedKeywords[index] ? Colors.pink : Colors.grey.shade200,
                    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    "# ${keywords[index]}",
                    style: TextStyle(fontSize: 13, color: selectedKeywords[index] ? Colors.white : Colors.grey.shade500),
                  ),
                  onPressed: () {
                    // 현재 선택된 키워드 갯수 count
                    int count = 0;
                    for (int i = 0; i < keywords.length; i++) {
                      if (selectedKeywords[i]) count++;
                    }

                    // 현재 선택된 키워드 갯수가 7개이고 비활성 키워드를 클릭했을 때는 아무반응없음
                    if (count == 7 && !selectedKeywords[index]) {
                    } else {
                      setState(() {
                        selectedKeywords[index] = !selectedKeywords[index];
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
