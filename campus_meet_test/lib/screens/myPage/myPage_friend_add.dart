import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class MyPageFriendAddScreen extends StatefulWidget {
  const MyPageFriendAddScreen({Key? key}) : super(key: key);

  @override
  _MyPageFriendAddScreenState createState() => _MyPageFriendAddScreenState();
}

class _MyPageFriendAddScreenState extends State<MyPageFriendAddScreen> {
  final TextEditingController _search = TextEditingController();
  bool isAdd = false;
  String _searchText = "";
  List<String> emailList = ['dbtmdxo1992@gmail.com', 'jhs60110@gmail.com'];
  bool isValid = false;
  bool isFirstSearch = false;

  _MyPageFriendAddScreenState() {
    _search.addListener(() {
        _searchText = _search.text;
        print(_searchText);
    });
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
        centerTitle: true,
        elevation: 0.0,
        title: Text('친구 초대', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                TextFormField(
                  cursorColor: Colors.grey,
                  keyboardType: TextInputType.name,
                  controller: _search,
                  autofocus: true,
                  // textInputAction: TextInputAction.go,
                  // 엔터키 입력 시
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).unfocus();
                    if(_searchText != '') {
                      isFirstSearch = true;
                      int count = 0;
                      for (String email in emailList){
                        if (email == _searchText){
                          setState(() {
                            isValid = true;
                          });
                        } else {
                          count++;
                        }
                      }
                      if (count == emailList.length) {
                        setState(() {
                          isValid = false;
                        });
                      }
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "이메일을 입력하세요...",
                    fillColor: Colors.white,
                    suffixIcon: IconButton(color: Colors.pink, icon: Icon(Icons.search), onPressed: () {
                      FocusScope.of(context).unfocus();
                      if(_searchText != '') {
                        isFirstSearch = true;
                        int count = 0;
                        for (String email in emailList){
                          if (email == _searchText){
                            setState(() {
                              isValid = true;
                            });
                          } else {
                            count++;
                          }
                        }
                        if (count == emailList.length) {
                          setState(() {
                            isValid = false;
                          });
                        }
                      }
                    }),
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
                Padding(padding: EdgeInsets.only(bottom: 15)),
                Container(
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.pink),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('My ID', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text('MyEmail@mju.ac.kr', style: TextStyle(color: Colors.white))],
                  ),
                ),

                Visibility(
                  visible: isFirstSearch,
                  child: Container(
                    height: 450,
                    child: isValid ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.pink,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 30)),
                        Text('이름', style: TextStyle(fontSize: 21)),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        InkWell(
                          onTap: (){
                            setState(() {
                              isAdd = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.pink,
                                ),
                                color: isAdd ? Colors.pink : Colors.white
                            ),
                            child: Text(isAdd ? '추가 완료' : '친구 추가', style: TextStyle(color: isAdd ? Colors.white : Colors.pink, fontSize: 19)),
                          ),
                        )
                      ],
                    ) : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.grey.shade300,
                          child: CircleAvatar(
                            radius: 78,
                            backgroundColor: Colors.white,
                            child: Text('!', style: TextStyle(fontSize: 50, color: Colors.grey.shade300)),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 30)),
                        Text('검색 결과가 없습니다.', style: TextStyle(fontSize: 19, color: Colors.grey.shade500))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
