import 'package:campus_meet_test/widgets/carousel_slider.dart';
import 'package:campus_meet_test/widgets/renderOtherPersonProfile.dart';
import 'package:flutter/material.dart';

class OtherPersonProfileScreen extends StatefulWidget {
  const OtherPersonProfileScreen({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  _OtherPersonProfileScreenState createState() => _OtherPersonProfileScreenState();
}

class _OtherPersonProfileScreenState extends State<OtherPersonProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(height: MediaQuery.of(context).viewPadding.top),
          Container(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top,
            child: Stack(
              children: <Widget>[
                CarouselImage(userId: widget.userId),
                TopBar(),
                Positioned(
                  bottom: 0,
                  child: RenderOtherPersonProfile(userId: widget.userId),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
