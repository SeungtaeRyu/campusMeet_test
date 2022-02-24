import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class HomeSearchScreen extends StatefulWidget {
  const HomeSearchScreen({Key? key}) : super(key: key);

  @override
  _HomeSearchScreenState createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends State<HomeSearchScreen> {
  final TextEditingController _search = TextEditingController();
  bool isAdd = false;
  String _searchText = "";
  bool isValid = true;
  bool isFirstSearch = false;

  _HomeSearchScreenState() {
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
        title: Text('검색', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: TextFormField(
                cursorColor: Colors.grey,
                keyboardType: TextInputType.name,
                controller: _search,
                autofocus: true,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                  if(_searchText != "") {
                    setState(() {
                      isFirstSearch = true;
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: "검색어를 입력하세요...",
                  hintStyle: TextStyle(fontSize: 16),
                  fillColor: Colors.white,
                  suffixIcon: IconButton(color: Colors.pink, icon: Icon(Icons.search), onPressed: () {
                    FocusScope.of(context).unfocus();
                    if(_searchText != "") {
                      setState(() {
                        isFirstSearch = true;
                      });
                    }
                  }),
                  contentPadding: EdgeInsets.only(left: 15, bottom: 5, top: 5, right: 5),
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
            Visibility(
              visible: !isFirstSearch,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey.shade200),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.pink,
                      size: 18,
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Expanded(
                      child: Text(
                        '입력하신 검색어와 일치하는 제목과 키워드를 가진 미팅글을 찾아드릴게요!',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isFirstSearch,
              child: !isValid ? Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey.shade200),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.pink,
                      size: 18,
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Expanded(
                      child: Text(
                        '입력하신 검색어와 일치하는 제목과 키워드를 가진 미팅글이 없습니다',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                ),
              ) : Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        renderMeetingPost(),
                        renderMeetingPost(),
                        renderMeetingPost(),
                        renderMeetingPost(),
                        Padding(padding: EdgeInsets.only(bottom: 10))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget renderMeetingPost() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          offset: const Offset(5, 5),
          blurRadius: 5.0,
          // spreadRadius: 4,
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "방학 3일 남은 한량들입니다",
            style: TextStyle(fontSize: 16),
          ),
          Padding(padding: EdgeInsets.only(bottom: 5)),
          Text(
            "location · n분전",
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
                child: Text("# keywords[index]", style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
                child: Text("# keywords[index]", style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
                child: Text("# keywords[index]", style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Row(
            children: [
              Text("명지대학교 20학번 박선호 ", style: TextStyle(fontSize: 14),),
              Icon(CustomIcons.my_page, size: 14, color: Colors.pink,),
              Text("3", style: TextStyle(color: Colors.pink),)
            ],
          )
        ],
      ),
    );
  }
}
