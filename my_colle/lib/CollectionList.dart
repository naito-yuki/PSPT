import 'package:flutter/material.dart';
import 'package:my_colle/dto/Collection.dart';
import 'package:my_colle/Style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_colle/dto/ColleDetail.dart';
import 'package:my_colle/dto/MyRoom.dart';

class CollectionList extends StatelessWidget {

//NAITO START
  String myRoomId;
//NAITO END

  Size size;
  String userId;
  BuildContext context;
  List<Collection> collectionList = new List<Collection>();

 CollectionList({Key key, this.userId}): super(key: key);
  
  @override
  Widget build([BuildContext context]) {

    //画面サイズ
    this.size = MediaQuery.of(context).size;
    this.context = context;
    
    MyRoom myRoom = ModalRoute.of(context).settings.arguments;
    String myroomId = myRoom.documentId;
    String roomUserId = myRoom.user;

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('myroom')
      .document(myroomId)
      .collection('items').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            Widget plusButton;
            if(this.userId == roomUserId) {
              plusButton = FlatButton(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffFFFFFF)),
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffd96666).withOpacity(0.75),
                  ),
                  child: Center(child:Text("+", style: Style.plusButtonText)), 
                ),
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  Navigator.pushNamed(context,'/CollePst',);
                },
              );
            }

            return Scaffold(
              appBar: AppBar(),
              body: Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage('images/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView(children: snapshot.data.documents.map((DocumentSnapshot doc) {
                  return createCollectionWidget(new Collection(doc.documentID, doc["imageURL"], doc["title"], doc["body"]), myroomId);
              }).toList(),
              ),
              ),
              floatingActionButton: plusButton,
            );
          }
        }
      );
    }
    
  Widget createCollectionWidget(Collection collection, String myroomId) {
    return FlatButton(
      child: Container(
        width: this.size.width,
        child: Row(
          children: <Widget>[
            Column (
              children: <Widget>[
                Style.height(),
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(collection.imageUrl),
                    )
                  ),
                ),
                Style.height(4),
              ],
            ),

            Container(
              height: 100,
              width: 279,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffcf3e3e)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(collection.collectionName, style: Style.titleText,),
                  Text(collection.description, style: Style.text,),
                ],
              ),
            ),
            Style.height(),
          ],
        ),
      ),
      onPressed: () {
          // collection詳細画面に遷移
          Navigator.pushNamed(
            this.context, 
            '/ColleDtl',
            arguments: new ColleDetail(collection, myroomId)
          );
      },
    );
  }
}