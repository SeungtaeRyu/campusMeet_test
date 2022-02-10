import 'package:flutter/material.dart';

class MeetingRequest2 extends StatefulWidget {
  const MeetingRequest2({Key? key, required this.data}) : super(key: key);
  final List<String> data;

  @override
  _MeetingRequest2State createState() => _MeetingRequest2State();
}

class _MeetingRequest2State extends State<MeetingRequest2> {
  List<double> position = [];
  TextEditingController appealController = TextEditingController();
  final int textMaxLength = 20;
  String textValue = "";

  @override
  void initState() {
    super.initState();

    for(double i =0; i < widget.data.length + 1; i++){

    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width-130-40;
    for(double i=0; i < widget.data.length + 1; i++){
      position.add( width * i / (widget.data.length));
    }

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
        toolbarHeight: MediaQuery.of(context).size.width * 0.1,
        elevation: 0.0,
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
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height- Scaffold.of(context).appBarMaxHeight!,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(flex: 3, child: Container()),
                      Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.blue,
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Stack(
                          children: List.generate(widget.data.length+1, (index) {
                            return Positioned(
                              left: position[index],
                              // top: 35,
                              child: CircleAvatar(
                                radius: 65,
                                backgroundColor: Colors.pink,
                                child: CircleAvatar(
                                  radius: 63,
                                  backgroundColor: Colors.grey.shade500,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Text("상대 팀에게 어필하고 싶은 말 한 마디를 적어주세요!", style: TextStyle(fontSize: 15),),
                      Container(
                        // color: Colors.pink,
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        height: 5 * 24.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200)
                        ),
                        child: Stack(
                          children: [
                            TextFormField(
                              maxLength: textMaxLength,
                              maxLines: 5,
                              onChanged: (value) {
                                setState(() {
                                  textValue = value;
                                });
                              },
                              controller: appealController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(10),
                                counterText: "",
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400),borderRadius: BorderRadius.circular(10),),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400),borderRadius: BorderRadius.circular(10),),
                              ),
                            ),
                            Positioned(
                              right: 10,
                                bottom: 15,
                                child: Text("${textValue.length}/${textMaxLength}",style: TextStyle(color: Colors.grey.shade400),))
                          ],
                        ),
                      ),
                      Expanded(flex: 7, child: Container(),),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
