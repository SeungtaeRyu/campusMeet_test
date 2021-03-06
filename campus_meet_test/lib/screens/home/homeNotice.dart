import 'package:campus_meet_test/models/notice_model.dart';
import 'package:flutter/material.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  List<Notice> notices = [
    Notice.fromMap({
      'emoji': '๐',
      'title': '์ ํํฐ ์ ์ฒญ',
      'header': '\'๋ฐฅ ํ๋ผ ํ๊ณ ์ถ์ ์ฌ๋\' ์นด๋๊ฐ ๋์ฐฉํ์ด์!',
      'paragraph': '[๋ฐฉํ 3์ผ๋จ์ ํ๋๋ค์๋๋ค] ๋๋ฅผ ๋ง์์ ๋ค์ดํ ์ฌ๋์ด ๋๊ตฌ์ธ์ง ํ์ธํด๋ณด์ธ์ :)',
      'date': '8์ 21์ผ',
    }),
    Notice.fromMap({
      'emoji': '๐ฌ',
      'title': '๋งค์นญ ์๋ฃ',
      'header': '๋๊ตฐ๊ฐ์๊ฒ ๋ฏธํ ์ ์ฒญ์ด ์์ด์!',
      'paragraph': '[๋ฐฉํ 3์ผ๋จ์ ํ๋๋ค์๋๋ค] ์์ฑ๋ ์ฑํ๋ฐฉ์ ํตํด ๋ํ๋ฅผ ๋๋๊ณ , ๋ฏธํ ์ผ์ ์ ๋ฑ๋กํด๋ณด์ธ์!',
      'date': '8์ 18์ผ',
    }),
    Notice.fromMap({
      'emoji': '๐',
      'title': '๋ฏธํ ์ ์ฒญ',
      'header': '๋๊ตฐ๊ฐ์๊ฒ ๋ฏธํ ์ ์ฒญ์ด ์์ด์!',
      'paragraph': '[์ ํฌ ์ด๋์ ๋๋!!] ๋ฉค๋ฒ๋ค์ ํ๋กํ์ ์ดํด๋ณด๊ณ , ๋ฏธํ ์งํ ์ฌ๋ถ๋ฅผ ์ ํํด์ฃผ์ธ์ :)',
      'date': '8์ 18์ผ',
    }),
    Notice.fromMap({
      'emoji': '๐',
      'title': '๋ฏธํ ์ ์ฒญ',
      'header': '๋๊ตฐ๊ฐ์๊ฒ ๋ฏธํ ์ ์ฒญ์ด ์์ด์!',
      'paragraph': '[์ ํฌ ์์ด๋ ๋ฎ์์ด์] ๋ฉค๋ฒ๋ค์ ํ๋กํ์ ์ดํด๋ณด๊ณ , ๋ฏธํ ์งํ ์ฌ๋ถ๋ฅผ ์ ํํด์ฃผ์ธ์ :)',
      'date': '8์ 18์ผ',
    }),
    Notice.fromMap({
      'emoji': '๐',
      'title': '๋ฏธํ ์ ์ฒญ',
      'header': '๋๊ตฐ๊ฐ์๊ฒ ๋ฏธํ ์ ์ฒญ์ด ์์ด์!',
      'paragraph': '[์ ํฌ ์์ด๋ ๋ฎ์์ด์] ๋ฉค๋ฒ๋ค์ ํ๋กํ์ ์ดํด๋ณด๊ณ , ๋ฏธํ ์งํ ์ฌ๋ถ๋ฅผ ์ ํํด์ฃผ์ธ์ :)',
      'date': '8์ 18์ผ',
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
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
            title: Text('์๋ฆผ',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            bottom: TabBar(
              indicatorColor: Colors.pink,
              tabs: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.1,
                  child: Text(
                    'ํ๋ ์๋ฆผ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.1,
                  child: Text(
                    '์์คํ ์๋ฆผ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              ListView.separated(
                itemCount: notices.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            child: Text(notices[index].emoji)),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                notices[index].title,
                                style: TextStyle(fontSize: 12, color: Colors.grey)),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(notices[index].header,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(
                                notices[index].paragraph,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12, color: Colors.black)),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(notices[index].date,
                              style: TextStyle(fontSize: 12, color: Colors.grey))
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
