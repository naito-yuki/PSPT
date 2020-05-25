import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_colle/Data.dart';

class CreateMyRoom extends StatefulWidget {
  @override
  _CreateMyRoomState createState() => _CreateMyRoomState();
}

class _CreateMyRoomState extends State<CreateMyRoom> {
  File imageFile;
  String categoryVal = Data.categoryList[1];

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
//           Column(
//             children: <Widget>[
//               Text('カテゴリ'),
//               DropdownButton<String>(
//                 value: categoryVal,
//                 onChanged: (String newValue) {
//                   setState(() {
//                     categoryVal = newValue;
//                   });
//                 },
//                 items: Data.categoryList.map<DropdownMenuItem<String>>(
//                    (String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }
//                 ).toList(),
//               ),
//               Text('タイトル'),
//               TextField(
//                 keyboardType: TextInputType.multiline,
//                 maxLines: 1,
//               ),
//               Text('説明'),
//               TextField(
//                 keyboardType: TextInputType.multiline,
//                 maxLines: null,
//               ),
//               Text('トップページ画像'),
//               Image.asset('images/meat_the_beatles.jpg'),
//             ],
//           ),
          // (imageFile != null)
//
        ],
      )
    );
  }
}
