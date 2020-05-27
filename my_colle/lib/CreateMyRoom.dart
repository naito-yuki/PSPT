import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_colle/Style.dart';
import 'package:my_colle/Data.dart';

class CreateMyRoom extends StatefulWidget {
  @override
  _CreateMyRoomState createState() => _CreateMyRoomState();
}

class _CreateMyRoomState extends State<CreateMyRoom> {
  File imageFile;
  String categoryVal = Data.categoryList[1];

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
                'カテゴリ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                color: Colors.white,
                child: DropdownButton<String>(
                  value: categoryVal,
                  onChanged: (String newValue) {
                    setState(() {
                      categoryVal = newValue;
                    });
                  },
                  items: Data.categoryList.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,),
                      );
                    }
                  ).toList(),
                ),
              ),
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
                    'トップページ画像',
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
              ? Icon(Icons.no_sim)
              : Image.file(imageFile,
                height: 200.0,
                width: 200.0,
              ),
              FlatButton(
                child: Container(
                  width: 100.0,
                  child: Center(
                    child: Text(
                      ' 作成',
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
                  Navigator.pushNamed(context, '/CreMyRm');
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
