import 'package:my_colle/dto/Collection.dart';

class CollectionDao {
  // CollectionDao() {
  // }
  
  // ユーザーNoでcollectionを取得(今は固定)
  List<Collection> getCollectionListByUserNo(int userNo) {
    List<Collection> collectionList = new List<Collection>();
    
    // DBの中身を想定
    collectionList.add(new Collection(1, userNo, 'images/beatles.jpg', "**********", "*********************"));
    collectionList.add(new Collection(2, userNo, 'images/beatles.jpg', "**********", "*********************"));
    collectionList.add(new Collection(3, userNo, 'images/beatles.jpg', "**********", "*********************"));
    collectionList.add(new Collection(4, userNo, 'images/beatles.jpg', "**********", "*********************"));
    collectionList.add(new Collection(5, userNo, 'images/beatles.jpg', "**********", "*********************"));
    collectionList.add(new Collection(6, userNo, 'images/beatles.jpg', "**********", "*********************"));
    collectionList.add(new Collection(7, userNo, 'images/beatles.jpg', "**********", "*********************"));
    
    return collectionList;
  }
}