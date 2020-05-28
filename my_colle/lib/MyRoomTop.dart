import 'package:flutter/material.dart';

class MyRoomTop extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    String roomName = ModalRoute.of(context).settings.arguments;
    String userName = "Mr.J";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/myRoomTop.jpg"),
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
                  child: Text(roomName,
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height*0.63),
              Container(
                color: Colors.blue.withOpacity(0.7),
                width: screenSize.width,
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.symmetric(vertical: screenSize.height*0.05, horizontal: screenSize.width*0.1),
                child: Center(
                  child: Text("Presented by " + userName,
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
    );
  }
}
