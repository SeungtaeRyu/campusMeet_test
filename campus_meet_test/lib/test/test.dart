
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(SettingUnivPage());
}

class SettingUnivPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}


class _State extends State<SettingUnivPage> {
  TextEditingController univController = TextEditingController();
  List<String> univ = ['명지대 인문캠퍼스', "명지대 자연캠퍼스", "단국대", "용인대", "용인대2"];
  List<String> search_univ = [];
  List<String> search_univ_result = [];
  late final String title;
  final List<int> _header = List.generate(9, (index) => index + 1);
  final List<int> _body = List.generate(9, (index) => index + 1);



  @override
  Widget build(BuildContext context) {
    Color color = Color(0xffff375c);

    print(search_univ_result);
    print(search_univ_result.length);
    return MaterialApp(
      title: 'Fetch Data Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('학교선택'),
          backgroundColor: color,
        ),


      // ),
        body: Column(
          children: [
            Container(
              height: 100, // 높이 안주고 자동으로 할당 하는 방법
              color: Colors.pink,
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Wrap(
                    children: [
                      Column(
                        children: [
                          Container(color: Colors.blue, child: CircleAvatar(
                            radius: 25,
                          ),),
                          // Text("${index}"),
                          // Container(color: Colors.blue, child: Text("3 "),),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        )
        // Container(
        //   child: SingleChildScrollView(
        //     child: Wrap(
        //       children: [
        //         Container(
        //           color: Colors.pink,
        //           width: 300,
        //           height: 200,
        //           // width: MediaQuery.of(context).size.width*0.5,
        //           child: ListView(
        //             shrinkWrap: true,
        //             physics: NeverScrollableScrollPhysics(),
        //             scrollDirection: Axis.horizontal,
        //             children: [
        //             Container(color: Colors.blue, child: Text("50000 "),),
        //             Container(child: Text("50000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //             Container(child: Text("50000000000000 "),),
        //           ],),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}