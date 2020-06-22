import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:my_colle/Style.dart';
import 'package:my_colle/Data.dart';
import 'package:my_colle/Auth.dart';

class CreateMyRoom extends StatefulWidget {
  @override
  _CreateMyRoomState createState() => _CreateMyRoomState();
}

class _CreateMyRoomState extends State<CreateMyRoom> {
  String _category = Data.categoryList[0];
  String _title;
  String _body;
  String _imageURL;
  File _imageFile;

  void _setTitle(String str) {
    setState(() {
      _title = str;
    });
  }

  void _setBody(String str) {
    setState(() {
      _body = str;
    });
  }

  void _getImageFromDevice(ImageSource source) async {
    var imageFile = await ImagePicker.pickImage(source: source);
    if (imageFile == null) {
      return;
    }
    setState(() {
      this._imageFile = imageFile;
    });
  }

  Future<String> uploadMyRoomImage() async {
    StorageReference storageReference = FirebaseStorage.instance
      .ref()
      .child('myroom/${Auth.authResult.user.uid}${Path.extension(_imageFile.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_imageFile);
    await uploadTask.onComplete;
    return await storageReference.getDownloadURL();
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
                  value: _category,
                  onChanged: (String newValue) {
                    setState(() {
                      _category = newValue;
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
                  maxLines: 1,
                  onChanged: _setTitle,
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
                  maxLines: null,
                  onChanged: _setBody,
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
              (_imageFile == null)
              ? SizedBox(height: 200.0)
              : Image.file(
                _imageFile,
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
                onPressed: () async {
                  _imageURL = await uploadMyRoomImage();
                  await Firestore.instance.collection('myroom')
                  .document(Auth.authResult.user.uid)
                  .setData({
                    'category': _category,
                    'title': _title,
                    'body': _body,
                    'imageURL': _imageURL,
                    'user': Auth.authResult.user.uid,
                  });
                  Navigator.popAndPushNamed(
                    context,
                    '/MyRmTop',
                    arguments: _title,
                  );
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
