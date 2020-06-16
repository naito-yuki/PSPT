import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_colle/Style.dart';
//import 'package:my_colle/Data.dart';

class CollectionPost extends StatefulWidget {
  @override
  _CollectionPostState createState() => _CollectionPostState();
}

class _CollectionPostState extends State<CollectionPost> {
  String titleText;
  File imageFile;

  void setTitleText(String str) {
    setState(() {
      titleText = str;
    });
  }

  void _getImageFromDevice(ImageSource source) async {
    var imageFile = await ImagePicker.pickImage(source: source);
    if (imageFile == null) {
      return;
    }
    setState(() {
      this.imageFile = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            child: Image.asset(
              'images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'タイトル',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                color: Colors.white,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  onChanged: setTitleText,
                  onSubmitted: setTitleText,
                ),
              ),
              Text(
                '説明',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                color: Colors.white,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '画像',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    child: Container(
                      child: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffFFFFFF)),
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffad0000).withOpacity(0.9),
                      ),
                      padding: EdgeInsets.all(5.0),
                    ),
                    onPressed: () {
                      _getImageFromDevice(ImageSource.gallery);
                    },
                  ),
                ],
              ),
              (imageFile == null)
              ? SizedBox(height: 200.0)
              : Image.file(imageFile,
                height: 200.0,
                width: 200.0,
              ),
              FlatButton(
                child: Container(
                  width: 100.0,
                  child: Center(
                    child: Text(
                      '出展',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 20.0,
                        fontFamily: Style.font,
                        locale: Locale("ja", "JP"),
                      ),
                    ),
                  ), 
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffFFFFFF)),
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffad0000).withOpacity(0.9),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context,'/ColleLst',);
                },
                padding: EdgeInsets.all(0.0),
              ),
            ],
          ),
        ],
      )
    );
  }
}
