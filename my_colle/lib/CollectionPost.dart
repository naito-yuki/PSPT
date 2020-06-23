import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:my_colle/Style.dart';
import 'package:my_colle/Auth.dart';
import 'package:intl/intl.dart';

class CollectionPost extends StatefulWidget {
  @override
  _CollectionPostState createState() => _CollectionPostState();
}

class _CollectionPostState extends State<CollectionPost> {
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

  Future<String> _uploadMyRoomImage() async {
    String strDateTime = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
    StorageReference storageReference = FirebaseStorage.instance
      .ref()
      .child('items/${Auth.authResult.user.uid}/$strDateTime${Path.extension(_imageFile.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_imageFile);
    await uploadTask.onComplete;
    return await storageReference.getDownloadURL();
  }

  bool _isNull() {
    if (_title == null || _title.isEmpty ||
        _body == null || _body.isEmpty ||
        _imageFile == null) {
      return true;
    }
    return false;
  }

  _buildDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('未入力の項目があります。'),
          actions: <Widget>[
            FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
              (_imageFile == null)
              ? SizedBox(height: 200.0)
              : Image.file(_imageFile,
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
                onPressed: () async {
                  if (_isNull()) {
                    _buildDialog(context);
                  } else {
                    _imageURL = await _uploadMyRoomImage();
                    await Firestore.instance.collection('myroom')
                    .document(Auth.authResult.user.uid)
                    .collection('items')
                    .add({
                      'title': _title,
                      'body': _body,
                      'imageURL': _imageURL,
                    });
                    Navigator.popAndPushNamed(context,'/ColleLst',);
                  }
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
