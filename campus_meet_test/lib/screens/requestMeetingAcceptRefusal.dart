import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// 페이지 2분할
class requestMeetingARScreen extends StatefulWidget {
  @override
  _requestMeetingARScreenState createState() => _requestMeetingARScreenState();
}

class _requestMeetingARScreenState extends State<requestMeetingARScreen> {
  List<String> proposer = ['1', '2', '3'];
  List<bool> like = [false, false, false];
  int _currentPage = 0;
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment(-0.8, -0.6),
              child: Text(
                '미팅신청이 들어왔어요!',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w700,
                  fontSize: 21,
                ),
              ),
            ),
            Container(
              alignment: Alignment(-0.8, -0.6),
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                '미팅 신청은 거절 후 되돌릴 수 없으며\n'
                '승낙 시 받으신 미팅 신청은 모두 자동으로 삭제됩니다 😊',
                style: TextStyle(
                  color: Color(0xff7C7C7C),
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.0),
              height: 280,
              //color: Colors.red,
              child: CarouselSlider(
                items: List.generate(proposer.length, (index) {
                  return Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 0.5,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.center ,
                children: makeIndicator(like, _currentPage),
              ),
            ),
            Container(
              alignment: Alignment(0.0, -0.6),
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                '어필문구',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              width: 320,
              decoration: BoxDecoration(
                  // color:Colors.grey ,
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300))),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 46,
                    width: 162,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: Color(0xffff375c),
                      ),
                    ),
                    child: OutlinedButton(
                      onPressed: () async {},
                      child: Text(
                        '다음 기회에!',
                        style: TextStyle(
                          color: Color(0xffff375c),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 46,
                    width: 162,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: Color(0xffff375c),
                      ),
                    ),
                    child: OutlinedButton(
                      onPressed: () async {},
                      child: Text(
                        '네 좋아요!',
                        style: TextStyle(
                          color: Color(0xffff375c),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> makeIndicator(List list, int _currentPage) {
    List<Widget> results = [];
    for (var i = 0; i < list.length; i++) {
      results.add(
        Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? Colors.pink : Colors.grey.shade500,
          ),
        ),
      );
    }

    return results;
  }
}
