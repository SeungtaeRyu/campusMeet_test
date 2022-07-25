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
    double width = MediaQuery.of(context).size.width;
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
                  fontSize: width*0.06,
                ),
              ),
            ),
            Container(
              alignment: Alignment(-0.8, -0.6),
              margin: EdgeInsets.only(left: width*0.03, top: width*0.02),
              child: Text(
                '미팅 신청은 거절 후 되돌릴 수 없으며\n'
                '승낙 시 받으신 미팅 신청은 모두 자동으로 삭제됩니다 😊',
                style: TextStyle(
                  color: Color(0xff7C7C7C),
                  fontSize: width*0.033,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30.0),
              height: MediaQuery.of(context).size.width * 0.8,
              //color: Colors.red,
              child: CarouselSlider(
                items: List.generate(proposer.length, (index) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          // width: MediaQuery.of(context).size.width * 0.46,
                          height: MediaQuery.of(context).size.width * 0.49,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            ),
                          ),
                        ),
                        Container(),
                      ],
                    ),
                    // width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.only(
                        right: width * 0.01, left: width * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(8, 14),
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                  );
                }),
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.width * 0.8,
                  enlargeCenterPage: true,
                  viewportFraction: 0.68, //width
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
              ),
            ),
            Container(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: makeIndicator(like, _currentPage),
              ),
            ),
            Container(
              alignment: Alignment(0.0, -0.6),
              margin: EdgeInsets.only(top: width*0.01, bottom: width*0.01),
              child: Text(
                '어필문구',
                style: TextStyle(
                  fontSize: width*0.05,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  // color:Colors.grey ,
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300))),
            ),
            Container(
              margin: EdgeInsets.only(top: width * 0.12),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.047),
                    height: MediaQuery.of(context).size.width * 0.12,
                    width: MediaQuery.of(context).size.width * 0.42,
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
                          fontSize: width * 0.043,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width * 0.04),
                    height: MediaQuery.of(context).size.width * 0.12,
                    width: MediaQuery.of(context).size.width * 0.42,
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
                          fontSize: width * 0.043,
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
          height: MediaQuery.of(context).size.width * 0.02,
          width: MediaQuery.of(context).size.width * 0.02,
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
