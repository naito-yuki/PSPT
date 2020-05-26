import 'package:flutter/material.dart';
import 'package:my_colle/Style.dart';

class Top extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    this.size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(),
      endDrawer: Drawer(),
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            child: Image.asset(
              'images/top.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Style.height(this.size.height/6.8),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      '集めるだけじゃ、もったいない。',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: Style.font,
                        locale: Locale("ja", "JP"),
                      ),
                    ),
                    Text(
                      'マイコレ',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 70.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: Style.font,
                        locale: Locale("ja", "JP"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      '<今月の特集>',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 22.0,
                        fontFamily: Style.font,
                        locale: Locale("ja", "JP"),
                      ),
                    ),
                    Text(
                      'カメラ、双眼鏡 特集',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 22.0,
                        fontFamily: Style.font,
                        locale: Locale("ja", "JP"),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xffad0000).withOpacity(0.9),
                ),
                width: this.size.width - 20,
              ),
              Style.height(this.size.height/3.4),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Container(
                        width: 180.0,
                        child: Center(
                          child: Text(
                            ' みんなの\nMY ROOM',
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/ColleDtl');
                      },
                      padding: EdgeInsets.all(0.0),
                    ),
                    Style.width(8),
                    FlatButton(
                      child: Container(
                        width: 180.0,
                        child: Center(
                          child: Text(
                            ' わたしの\nMY ROOM',
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/ColleDtl');
                      },
                      padding: EdgeInsets.all(0.0),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(2.0),
                width: this.size.width - 20,
                decoration: BoxDecoration(
                  color: Color(0xffad0000).withOpacity(0.9),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}