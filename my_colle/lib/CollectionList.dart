import 'package:flutter/material.dart';
import 'package:my_colle/dto/Collection.dart';
import 'package:my_colle/dao/CollectionDao.dart';
import 'package:my_colle/Style.dart';

class CollectionList extends StatelessWidget {
  
  Size size;
  int userNo;
  
  CollectionList({Key key, this.userNo}): super(key: key);
  
  @override
  Widget build([BuildContext context]) {
    
    // 画面サイズ
    this.size = MediaQuery.of(context).size;
    
    // collectionのリストを取得(今は固定)
    CollectionDao dao = new CollectionDao();
    List<Collection> collectionList = dao.getCollectionListByUserNo(this.userNo); // ユーザーNoはなんとなく
    
    // リスト表示用のWidgetリスト作成
    List<Widget> collectionWidgetList = <Widget>[];
    collectionList.forEach((Collection collection) {
      collectionWidgetList.add(createCollectionWidget(collection));
    });
    
    // 自分のcollection一覧の場合、追加ボタンを表示
    Widget plusButton;
    if(this.userNo == 1) {
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
          // collection追加画面に遷移
        },
      );
      
    }
    
    return MaterialApp(
      theme: Theme.of(context),
      home: Scaffold(
        body: ListView(children: collectionWidgetList),
        floatingActionButton: plusButton,
      ),
    );
  }
  
  Widget createCollectionWidget(Collection collection) {
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
                      image: AssetImage(collection.imageUrl)
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
      },
    );
  }
}