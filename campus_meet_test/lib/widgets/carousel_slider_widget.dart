import 'package:campus_meet_test/common/custom_icons_icons.dart';
import 'package:campus_meet_test/models/User/find_user_by_id_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

class CarouselImage extends StatefulWidget {
  const CarouselImage({Key? key, required this.searchedUser}) : super(key: key);
  final FindUserById searchedUser;


  @override
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<String> imgList = ['images/user1_profile.jpg', 'images/user1_profile2.jpg', 'images/user1_profile3.jpg', 'images/user1_profile4.jpg', 'images/user1_profile5.jpg'];
  int userId_image_length = 5;
  List<bool> like = [false, false, false, false, false];
  int _currentPage = 0;
  late bool isImage;

  @override
  void initState() {
    super.initState();
    isImage = true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        isImage
            ? CarouselSlider(
                items: imgList
                    .map((item) => Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: (MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top) * 0.5 + 20,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top) * 0.5 + 20,
                color: Colors.grey.shade300,
                child: Icon(CustomIcons.my_page, size: 200,),
              ),
        Positioned(
          bottom: 0,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("${widget.searchedUser.name} ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, height: 1)),
                    Text("(${int.parse(DateFormat('yyyy').format(DateTime.now())) - int.parse(DateFormat('yyyy').format(widget.searchedUser.birthDate)) + 1})", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Row(
                  children: [
                    Text("${widget.searchedUser.univ.name} ", style: TextStyle(fontSize: 16)),
                    Text("${widget.searchedUser.entryYear}학번", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Visibility(
                  visible: isImage,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: makeIndicator(like, _currentPage),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> makeIndicator(List<bool> like, int currentPage) {
    List<Widget> results = [];
    for (var i = 0; i < like.length; i++) {
      results.add(
        Container(
          width: (MediaQuery.of(context).size.width - 40) / like.length - 8,
          height: 8,
          margin: EdgeInsets.fromLTRB(4, 5, 4, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _currentPage == i ? Colors.pink : Colors.grey.shade500,
          ),
        ),
      );
    }
    return results;
  }
}
