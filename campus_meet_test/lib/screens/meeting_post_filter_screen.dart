import 'package:flutter/material.dart';

class MeetingFilterScreen extends StatefulWidget {
  const MeetingFilterScreen({Key? key}) : super(key: key);

  @override
  State<MeetingFilterScreen> createState() => _MeetingFilterScreenState();
}

class _MeetingFilterScreenState extends State<MeetingFilterScreen> {
  double numMember = 2;
  TextEditingController studuntIDController1 = TextEditingController();
  TextEditingController studuntIDController2 = TextEditingController();
  TextEditingController ageController1 = TextEditingController();
  TextEditingController ageController2 = TextEditingController();

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
          centerTitle: true,
          elevation: 0.0,
          title: Text('검색 필터',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: <Widget>[
                      // 인원수 필터
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(color: Colors.grey.shade300))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("인원수"),
                            ),
                            SliderTheme(
                              data: SliderThemeData(
                                trackShape: CustomTrackShape(),
                              ),
                              child: Slider(
                                value: numMember,
                                onChanged: (newnumMember) {
                                  setState(() {
                                    numMember = newnumMember;
                                  });
                                },
                                min: 2,
                                max: 5,
                                divisions: 3,
                                activeColor: Colors.pink,
                                inactiveColor: Colors.grey,
                                thumbColor: Colors.pink,
                                label: "${numMember.round()}",
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("2"),
                                  Text("3"),
                                  Text("4"),
                                  Text("5"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 지역 필터
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(color: Colors.grey.shade300))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("지역 필터"),
                            ),
                            // 지역필터 버튼 구현해야함! API도 쓸수도?
                            Container(
                              child: Text("button"),
                            ),
                          ],
                        ),
                      ),

                      // 학번 필터 -> 텍스트폼필드 포커스 해제하는법 추가하기!
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(color: Colors.grey.shade300))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("학번 필터"),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: TextFormField(
                                      controller: studuntIDController1,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        border: OutlineInputBorder(),
                                        labelText: '제한 없음',
                                      ),
                                    ),
                                    ),
                                  Text("  ~  "),
                                  Expanded(
                                    child: TextFormField(
                                      controller: studuntIDController2,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        border: OutlineInputBorder(),
                                        labelText: '22',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 나이 필터
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(color: Colors.grey.shade300))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("나이 필터"),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: TextFormField(
                                      controller: ageController1,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        border: OutlineInputBorder(),
                                        labelText: '19',
                                      ),
                                    ),
                                  ),
                                  Text("  ~  "),
                                  Expanded(
                                    child: TextFormField(
                                      controller: ageController2,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        border: OutlineInputBorder(),
                                        labelText: '제한 없음',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.2,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text("초기화"),
                      onPressed: () {
                        setState(() {
                          numMember = 2;
                          // 지역 필터 변수도 추가예정
                          studuntIDController1.text = "";
                          studuntIDController2.text = "";
                          ageController1.text = "";
                          ageController2.text = "";
                        });
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 15)),
                  Expanded(
                    child: ElevatedButton(
                      child: Text("적용"),
                      onPressed: () {
                        // 인풋데이터들 보내기 & 컨트롤러 dispose 해야하나??
                      },
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// Slider width 부모 컨테이너의 width만큼 할당
class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
