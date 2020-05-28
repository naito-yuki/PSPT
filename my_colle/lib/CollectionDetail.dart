import 'package:flutter/material.dart';
import 'package:my_colle/dto/Collection.dart';

class CollectionDetail extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(collection.collectionName,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    decoration: TextDecoration.underline, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(collection.description,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                ),
              ],
            ),
          ),
          RaisedButton(
            child: Text('　　　　Users Voice　　　　\n（他ユーザからのコメント欄）',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            color: Colors.blue,
            textColor: Colors.white,
            shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.pushNamed(
                this.context, 
                '/UsrVcLst',
                arguments: collection
              );
            },
          ),
        ],
      ),
      ),
    );
  }
}
