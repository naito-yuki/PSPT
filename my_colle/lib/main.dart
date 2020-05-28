import 'package:flutter/material.dart';
import 'package:my_colle/Top.dart';
import 'package:my_colle/CategoryList.dart';
import 'package:my_colle/CategoryDetailList.dart';
import 'package:my_colle/MyRoomTop.dart';
import 'package:my_colle/CollectionList.dart';
import 'package:my_colle/CollectionDetail.dart';
import 'package:my_colle/UserVoiceList.dart';
import 'package:my_colle/CreateMyRoom.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => Top(),
        '/CtgrLst': (context) => CategoryList(),
        '/CtgDtlLst': (context) => CategoryDetailList(),
        '/MyRmTop': (context) => MyRoomTop(),
        '/ColleLst':(context) => CollectionList(),
        '/ColleDtl': (context) => CollectionDetail(),
        '/UsrVcLst': (context) => UserVoiceList(),
        '/CreMyRm': (context) => CreateMyRoom(),
      },
    );
  }
}
