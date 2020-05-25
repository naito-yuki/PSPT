import 'package:flutter/material.dart';

class CollectionDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('images/meat_the_beatles.jpg'),
          Card(
            child: Column(
              children: <Widget>[
                Text('超レアなブートレッグ版',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    decoration: TextDecoration.underline, 
                  ),
                ),
                Text('*****************************\n**********************'),
              ],
            ),
          ),
          RaisedButton(
            child: Text('Users Voice\n<他ユーザからのコメント欄>'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      ),
    );
  }
}
