import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
              Text('カテゴリ'),
              DropdownButton<String>(
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
                      child: Text(value),
                    );
                  }
                ).toList(),
              ),
              Text('タイトル'),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 1,
              ),
              Text('説明'),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              Row(
                children: <Widget>[
                  Text('トップページ画像'),
                  RaisedButton(
                    child: Icon(Icons.add_photo_alternate),
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
              RaisedButton(
                child: Text('作成'),
                onPressed: () {
                }
              ),
            ],
          ),

        ],
      )
    );
  }
}
