import 'package:flutter/material.dart';
import 'package:my_colle/Login.dart';
import 'package:my_colle/Top.dart';
import 'package:my_colle/CategoryList.dart';
import 'package:my_colle/CategoryDetailList.dart';
import 'package:my_colle/MyRoomTop.dart';
import 'package:my_colle/CollectionList.dart';
import 'package:my_colle/CollectionDetail.dart';
import 'package:my_colle/UserVoiceDetail.dart';
import 'package:my_colle/UserVoiceList.dart';
import 'package:my_colle/CreateMyRoom.dart';
import 'package:my_colle/CollectionPost.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'マイコレ',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/Login',
      routes: {
        '/Login': (context) => Login(),
        '/Top': (context) => Top(),
        '/CtgrLst': (context) => CategoryList(),
        '/CtgDtlLst': (context) => CategoryDetailList(),
        '/MyRmTop': (context) => MyRoomTop(),
        '/ColleLst': (context) => CollectionList(),
        '/ColleDtl': (context) => CollectionDetail(),
        '/UsrVcLst': (context) => UserVoiceList(),
        '/UsrVcDtl': (context) => UserVoiceDetail(),
        '/CreMyRm': (context) => CreateMyRoom(),
        '/CollePst': (context) => CollectionPost(),
      },
    );
  }
}
