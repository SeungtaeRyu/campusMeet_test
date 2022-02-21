import 'package:flutter/material.dart';

class MyPageFriendEditScreen extends StatefulWidget {
  const MyPageFriendEditScreen({Key? key}) : super(key: key);

  @override
  _MyPageFriendEditScreenState createState() => _MyPageFriendEditScreenState();
}

class _MyPageFriendEditScreenState extends State<MyPageFriendEditScreen> {
  List<String> friendName = ["도진", "해수", "해수2", "해수3", "해수4", "승태", "현재", "준우", "한비", "경민", "경진", "현민", "수진"];
  List<String> deleteFriend = [];
  List<bool> boolDeleteFriend = [];

  @override
  void initState() {
    super.initState();
    for(int i = 0; i < friendName.length; i++){
      boolDeleteFriend.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(deleteFriend);
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
        title: Text('편집', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
        actions: [
          Container(
              padding: EdgeInsets.only(right: 5),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "완료",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ))),
        ],
      ),
      body: Builder(builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight!,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: friendName.length, // 추후 친구목록 DB.length 로 수정
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.pink,
                      radius: 20,
                    ),
                  ),
                  Expanded(child: Text("${friendName[index]}")),
                  InkWell(
                    onTap: (){
                      setState(() {
                        if(!boolDeleteFriend[index]){
                          boolDeleteFriend[index] = true;
                          deleteFriend.add(friendName[index]);
                        } else {
                          boolDeleteFriend[index] = false;
                          deleteFriend.remove(friendName[index]);
                        }
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: Colors.pink,
                        ),
                        color: boolDeleteFriend[index] ? Colors.pink : Colors.white
                      ),
                      child: Text('삭제', style: TextStyle(color: boolDeleteFriend[index] ? Colors.white : Colors.pink, fontSize: 13)),
                    ),
                  )
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
