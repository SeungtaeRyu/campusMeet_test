import 'package:flutter/material.dart';

class MyPageEditMajorScreen extends StatefulWidget {
  const MyPageEditMajorScreen({Key? key}) : super(key: key);

  @override
  _MyPageEditMajorScreenState createState() => _MyPageEditMajorScreenState();
}

class _MyPageEditMajorScreenState extends State<MyPageEditMajorScreen> {
  final TextEditingController _search = TextEditingController();
  String _searchText = "";

  List<String> majorList = ["디지털미디어학과", "디지털콘텐츠디자인학과", "멀티디자인학과", "융합디자인학과"];

  _MyPageEditMajorScreenState() {
    _search.addListener(() {
      setState(() {
        _searchText = _search.text;
      });
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
              Navigator.pop(context, "");
            }),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Builder(builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight!,
            child: Column(
              children: [
                TextFormField(
                  cursorColor: Colors.grey,
                  keyboardType: TextInputType.name,
                  controller: _search,
                  autofocus: true,
                  // 엔터키 입력 시
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: "학과명을 입력하세요...",
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                        color: Colors.pink,
                        icon: Icon(Icons.search),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
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

                Padding(padding: EdgeInsets.only(bottom: 40)),

                Expanded(child: _searchText.length != 0 ? buildSearchList() : Container(),)
              ],
            ),
          );
        }),
      ),
    );
  }

  buildSearchList() {
    List<String> searchResults = [];
    for (String d in majorList) {
      if (d.contains(_searchText)) {
        searchResults.add(d);
      }
    }

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (){
            Navigator.pop(context, searchResults[index]);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
            child: Text("${searchResults[index]}", style: TextStyle(fontSize: 16),),
          ),
        );
      },
    );
  }
}
