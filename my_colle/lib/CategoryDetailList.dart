import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         //primarySwatch: Colors.red,
//         primaryColor: Colors.red[600],
//       ),
//       home: new MyHomePage(),
//     );
//   }
// }

class CategoryDetailList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categorytitle =ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: new AppBar(),
      body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "出展カテゴリー",
                  style: TextStyle(
                    fontSize: 25,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 40,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "・$categorytitle・・・・・・・・・15",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 30,
                    //padding: const EdgeInsets.all(8.0),

                    child: Text(
                      "      　レコード・・・・・・・・・8",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 480,
                child: _CategoryDetailListState(),
              )
            ],
          )),
    );
  }
}

class _CategoryDetailListState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categorytitle =ModalRoute.of(context).settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('myroom').where("category", isEqualTo: categorytitle).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error:');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return InkWell(
                  child: Card(
                    child: ListTile(
                      title: new Text(
                        document['title'],
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: new Text(document['body']),
                      leading: Icon(Icons.person),
                      onTap: () {
                        Navigator.pushNamed(
                          context, '/MyRmTop',
                          arguments: document['title']);
                      },
                    ),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
