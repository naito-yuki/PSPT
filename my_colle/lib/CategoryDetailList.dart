import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_colle/dto/MyRoom.dart';

class CategoryDetailList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categorytitle = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: new AppBar(),
      body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage('images/top.png'),
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
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
              __CategoryDetailListState(),
              Container(
                height: 510,
                child: _CategoryDetailListState(),
              )
            ],
          )),
    );
  }
}

class _CategoryDetailListState extends StatelessWidget {
  // String subcategory = "";
  var hashMap = new Map();
  @override
  Widget build(BuildContext context) {
    var categorytitle = ModalRoute.of(context).settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('myroom')
          .where("category", isEqualTo: categorytitle)
          // .orderBy("subcategory")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error:');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            // {
            //   var list = snapshot.data.documents
            //       .map((DocumentSnapshot document) => document["subcategory"])
            //       .toList();
            //   int i = 0;
            //   list.forEach((element) {
            //     if (subcategory != element) i = 0;
            //     i++;
            //     hashMap.update(
            //       element,
            //       (existingValue) => i,
            //       ifAbsent: () => i,
            //     );
            //     subcategory = element;
            //   });
            // }
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                // {
                //   if (subcategory != document["subcategory"]) {
                //     subcategory = document["subcategory"];
                //     return InkWell(
                //         child: Column(
                //       children: <Widget>[
                //         Container(
                //             height: 35,
                //             child: ListTile(
                //               title: new Text(
                //                   "　${document['subcategory']}・・・・・${hashMap[document['subcategory']].toString()}",
                //                   style: TextStyle(
                //                     fontSize: 16,
                //                   )),
                //               dense: true,
                //             ),
                //             decoration: BoxDecoration(
                //               color: Colors.black.withOpacity(0.0),
                //             )),
                //         Container(
                //           child: Card(
                //             child: ListTile(
                //               title: new Text(
                //                 document['title'],
                //                 style: TextStyle(
                //                   color: Colors.red,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               subtitle: new Text(document['body']),
                //               leading: Icon(Icons.person),
                //               onTap: () {
                //                 Navigator.pushNamed(context, '/MyRmTop',
                //                     arguments: new MyRoom(
                //                         document["user"],
                //                         "Jack",
                //                         document['title'],
                //                         document["imageURL"],
                //                         document.documentID));
                //               },
                //             ),
                //           ),
                //         )
                //       ],
                //     ));
                //   }
                // }
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
                      onTap: () async {
                        DocumentSnapshot myroomDoc = await Firestore.instance.collection('myroom')
                        .document(document.documentID).get();;
                        DocumentSnapshot userDoc = await Firestore.instance.collection('user')
                        .document(document["user"]).get();
                        MyRoom myRoom = MyRoom(
                          document["user"],
                          userDoc.data['name'],
                          document['title'],
                          document["imageURL"],
                          document.documentID
                        );
                        Navigator.pushNamed(
                          context,
                          '/MyRmTop',
                          arguments: myRoom,
                        );
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

class __CategoryDetailListState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categorytitle = ModalRoute.of(context).settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('myroom')
          .where("category", isEqualTo: categorytitle)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error:');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 40,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "・$categorytitle" +
                        "・・・・・・" +
                        "${snapshot.data.documents.length.toString()}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}
