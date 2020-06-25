import 'package:flutter/material.dart';
//import 'package:my_colle/dto/Collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_colle/dto/ColleDetail.dart';

class CollectionDetail extends StatelessWidget {
  BuildContext context;
  
    // var snapshots = Firestore.instance
    //   .collection('myroom')
    //   .document('myroom_sample') // ここはカテゴリリストからパラメータをもらう
    //   .collection('items')
    //   .document('collection_sample') // ここはカテゴリリストからパラメータをもらう
    //   //.where("title", isEqualTo: "超レアなブートレッグ版")) // ここはカテゴリリストからパラメータをもらう
    //   .snapshots();

    //ここに何を指定して、collection.imageUrl、collection.collectionName、collection.descriptionを渡すか
   // snapshots.listen((data) => data.documents.forEach((doc) => 
   //   print(doc["imageUrl"],doc["title"],doc["body"])
      // collectionList.add(new UserVoice(doc["userId"], doc["userName"], doc["text"], doc["postDatetime"].toString()))
   // ));

  @override
  Widget build(BuildContext context) {
    this.context = context;
    //ColleDetailを受け取る
    ColleDetail colleDetail = ModalRoute.of(context).settings.arguments;
    //roomのドキュメントIDの取得法
    //⇒colleDetail.myroomId
    //Collection collection = ModalRoute.of(context).settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('myroom')
      .document(colleDetail.myroomId)
      .collection('items').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
          //   Widget plusButton;
          //   if(this.userId == roomUserId) {
          //     plusButton = FlatButton(
          //       child: Container(
          //         width: 80,
          //         height: 80,
          //         decoration: BoxDecoration(
          //           border: Border.all(color: Color(0xffFFFFFF)),
          //           borderRadius: BorderRadius.circular(10),
          //           color: Color(0xffd96666).withOpacity(0.75),
          //         ),
          //         child: Center(child:Text("+", style: Style.plusButtonText)), 
          //       ),
          //       padding: EdgeInsets.all(0.0),
          //       onPressed: () {
          //         Navigator.pushNamed(context,'/CollePst',);
          //       },
          //     );
          //   }

         return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Image 
          Image.network(colleDetail.collection.imageUrl),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // タイトル
                Text(colleDetail.collection.collectionName,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    decoration: TextDecoration.underline, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // 説明文
                Text(colleDetail.collection.description,
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
                arguments: colleDetail
              );
            },
          ),
        ],
      ),
      ),
      ),
    );
          // }
        }
    });
    
  }
}