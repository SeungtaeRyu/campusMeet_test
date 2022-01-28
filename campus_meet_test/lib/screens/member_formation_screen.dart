import 'package:flutter/material.dart';

class MemberFomationScreen extends StatefulWidget {
  const MemberFomationScreen({Key? key}) : super(key: key);

  @override
  State<MemberFomationScreen> createState() => _MemberFomationScreenState();
}

class _MemberFomationScreenState extends State<MemberFomationScreen> {
  // 추후 친구목록 DB.length 로 수정
  List<bool> select = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<int> selectedUserIndex = [];

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
            TextButton(
                onPressed: () {
                  Navigator.pop(context, selectedUserIndex);
                },
                child: Text(
                  "완료",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: <Widget>[
                  // 검색 기능 어케 추가 ???
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "이름을 입력하세요...",
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                            color: Colors.pink,
                            icon: Icon(Icons.search),
                            onPressed: () {}),
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 5, top: 5, right: 5),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.pink,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.pink,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: select.indexOf(true) == -1
                  ? SizedBox.shrink()
                  : Container(
                      height: 100,
                      child: ListView.builder(
                          itemCount: selectedUserIndex.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.pink,
                                      radius: 25,
                                    ),
                                  ),
                                  Text("이름 ${selectedUserIndex[index]} "),
                                ],
                              );
                          }),
                    ),
            ),

            Divider(thickness: 5),

            // 친구 목록 렌더링 컬럼 > 로우 > 이미지, 이름, 아이콘버튼
            Expanded(
              child: ListView.builder(
                itemCount: 20, // 추후 친구목록 DB.length 로 수정
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
                      Text("이름 ${index} "),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if(!select[index]){
                                selectedUserIndex.add(index);
                                select[index] = !select[index];
                              } else {
                                selectedUserIndex.remove(index);
                                select[index] = !select[index];
                              }
                            });
                          },
                          icon: select[index]
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
          ],
        ),
      ),
    );
  }
}
