import 'package:flutter/material.dart';

class MyPageEditKeywordScreen extends StatefulWidget {
  const MyPageEditKeywordScreen({Key? key}) : super(key: key);

  @override
  _MyPageEditKeywordScreenState createState() => _MyPageEditKeywordScreenState();
}

class _MyPageEditKeywordScreenState extends State<MyPageEditKeywordScreen> {
  String question = 'DB에서 받을 질문이름';
  List<String> keywords = ['키워드1', '키워드2', '키워드3', '키워드4', '키워드5', '...'];
  List<bool> selects = [false, false, false, false, false, false];
  List<String> data = [];

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
              Navigator.pop(context, []);
            }),
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.of(context).size.width * 0.1,
        elevation: 0.0,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 5),
            child: TextButton(
              onPressed: () {
                print(data);
              },
              child: Text(
                "완료",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Builder(
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight!,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Q. ", style: TextStyle(color: Colors.pink, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("${question}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15)),
                  Expanded(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 15,
                      children: List.generate(
                        keywords.length,
                        (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if(!selects[index]) {
                                  selects[index] = true;
                                  data.add(keywords[index]);
                                } else {
                                  selects[index] = false;
                                  data.remove(keywords[index]);
                                }
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: selects[index]? Colors.pink : Colors.grey.shade200),
                                child: Text("# ${keywords[index]}", style: TextStyle(color: selects[index] ? Colors.white : Colors.grey.shade500))),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.25,
                    // padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                                Navigator.pop(context, []);
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
                                Navigator.pop(context, data);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
