import 'package:my_colle/dto/Collection.dart';

class CollectionDao {
  
  // ユーザーNoでcollectionを取得(今は固定)
  List<Collection> getCollectionListByUserNo() {
    List<Collection> collectionList = new List<Collection>();

    // DBの中身を想定
    // collectionList.add(new Collection(1, 'images/meat_the_beatles.jpg', "超レアなブートレッグ版", "*****************************\n**********************"));
    // collectionList.add(new Collection(2, 'images/beatles.jpg', "**********", "*********************"));
    // collectionList.add(new Collection(3, 'images/beatles.jpg', "**********", "*********************"));
    // collectionList.add(new Collection(4, 'images/beatles.jpg', "**********", "*********************"));
    // collectionList.add(new Collection(5, 'images/beatles.jpg', "**********", "*********************"));
    // collectionList.add(new Collection(6, 'images/beatles.jpg', "**********", "*********************"));
    // collectionList.add(new Collection(7, 'images/beatles.jpg', "**********", "*********************"));
    
    return collectionList;
  }
}