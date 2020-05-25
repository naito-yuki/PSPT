import 'package:flutter/material.dart';

class Top extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text('集めるだけじゃ、もったいない。'),
                    Text('マイコレ'),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text('<今月の特集>'),
                    Text('カメラ、双眼鏡 特集'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      child: Text('みんなの\nMY ROOM'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/ColleDtl');
                      }
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      child: Text('わたしの\nMY ROOM'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/CreMyRm');
                      }
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    );
  }
}
