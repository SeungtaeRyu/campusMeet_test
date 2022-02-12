import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImage extends StatefulWidget {
  const CarouselImage({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<String> imgList = ['images/user1_profile.jpg', 'images/user1_profile2.jpg', 'images/user1_profile3.jpg', 'images/user1_profile4.jpg', 'images/user1_profile5.jpg'];
  int userId_image_length = 5;
  List<bool> like = [false, false, false, false, false];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarouselSlider(
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
                })),
        Positioned(
          bottom: 0,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("이름", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text("대학교와 학번", style: TextStyle(fontSize: 16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: makeIndicator(like, _currentPage),
                ),
              ],
            ),
          ),
        )
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
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
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
