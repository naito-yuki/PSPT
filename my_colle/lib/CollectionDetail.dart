import 'package:flutter/material.dart';
import 'package:my_colle/dto/Collection.dart';

class CollectionDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Collection collection = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(collection.imageUrl),
          Card(
            child: Column(
              children: <Widget>[
                Text(collection.collectionName,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    decoration: TextDecoration.underline, 
                  ),
                ),
                Text(collection.description),
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
