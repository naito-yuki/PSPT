import 'package:flutter/material.dart';
import 'package:my_colle/dto/MyRoom.dart';

class MyRoomTop extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    // 画面サイズの取得
    Size screenSize = MediaQuery.of(context).size;
    // 前画面からのデータ受取
    MyRoom myRoom = ModalRoute.of(context).settings.arguments;    
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(myRoom.imageUrl), // 背景画面の設定
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                Container(
                  color: Colors.red.withOpacity(0.7),
                  width: screenSize.width,
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: screenSize.height*0.07, horizontal: screenSize.width*0.06),
                  child: Center(
                    child: Text(myRoom.roomName, 
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height*0.5),
                Container(
                  color: Colors.blue.withOpacity(0.7),
                  width: screenSize.width,
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: screenSize.height*0.05, horizontal: screenSize.width*0.1),
                  child: Center(
                    child: Text("Presented by " + myRoom.userName, 
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/ColleLst', arguments: myRoom);
        },
      ),
    );
  }
}
