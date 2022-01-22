import 'dart:io';
import 'package:campus_meet_test/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.6,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.pink,
              radius: 70,
              child: InkWell(
                onTap: widget.user.profileImage != ""
                    ? () {
                        showBottomSheet(context);
                      }
                    : () {},
                child: _image == null
                    ? CircleAvatar(
                        backgroundColor: Colors.pink,
                        backgroundImage:
                            AssetImage('images/' + widget.user.profileImage),
                        radius: 68,
                        child: widget.user.profileImage != ""
                            ? renderCameraIcon()
                            : Container(),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.pink,
                        backgroundImage: FileImage(_image as File, scale: 1.0),
                        radius: 68,
                        child: widget.user.profileImage != ""
                            ? renderCameraIcon()
                            : Container(),
                      ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Text(
                widget.user.name,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderCameraIcon() {
    return const Align(
      alignment: Alignment.bottomRight,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  showBottomSheet(BuildContext context) {
    final action = CupertinoActionSheet(
      title: Text("프로필 사진 설정", style: TextStyle(fontSize: 10)),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("카메라로 찍기", style: TextStyle(fontSize: 15)),
          onPressed: () {
            getImage(ImageSource.camera);
            Navigator.pop(context);
          },
        ),
        CupertinoActionSheetAction(
          child: Text("앨범에서 선택", style: TextStyle(fontSize: 15)),
          onPressed: () {
            getImage(ImageSource.gallery);
            Navigator.pop(context);
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("취소", style: TextStyle(fontSize: 15)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    showCupertinoModalPopup(context: context, builder: (context) => action);
  }

  Future getImage(ImageSource imageSource) async {
    PickedFile image = await ImagePicker().getImage(source: imageSource);

    if(image.path != null) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 120,
                  child: CircleAvatar(
                    backgroundColor: Colors.pink,
                    backgroundImage:
                    FileImage(File(image.path)),
                    radius: 116,
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("취소")),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    setState(() {
                      _image = File(image.path);
                    });
                  },
                  child: Text("적용"))
            ],
          );
        },
      );
    }
    else {
      Navigator.pop(context);
    }
  }
}