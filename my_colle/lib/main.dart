import 'package:flutter/material.dart';
import 'package:my_colle/Top.dart';
import 'package:my_colle/CreateMyRoom.dart';
import 'package:my_colle/CollectionDetail.dart';
import 'package:my_colle/CollectionList.dart';
import 'package:my_colle/UserVoiceList.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Top(),
        '/CreMyRm': (context) => CreateMyRoom(),
        '/ColleDtl': (context) => UserVoiceList(),
      },
    );
  }
}
