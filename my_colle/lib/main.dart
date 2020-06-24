import 'package:flutter/material.dart';
import 'package:my_colle/Login.dart';
import 'package:my_colle/Top.dart';
import 'package:my_colle/CategoryList.dart';
import 'package:my_colle/CategoryDetailList.dart';
import 'package:my_colle/MyRoomTop.dart';
import 'package:my_colle/CollectionList.dart';
import 'package:my_colle/CollectionDetail.dart';
import 'package:my_colle/UserVoiceList.dart';
import 'package:my_colle/CreateMyRoom.dart';
import 'package:my_colle/CollectionPost.dart';
import 'package:my_colle/TestDB.dart';
import 'package:my_colle/TestStorage.dart';

import 'Auth.dart';

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
        '/ColleLst':(context) => CollectionList(userId: Auth.authResult.user.uid,),
        '/ColleDtl': (context) => CollectionDetail(),
        '/UsrVcLst': (context) => UserVoiceList(),
        '/CreMyRm': (context) => CreateMyRoom(),
        '/CollePst':(context) => CollectionPost(),
        '/TestDB':(context) => TestDB(),
        '/TestStorage':(context) => TestStorage(),
      },
    );
  }
}
