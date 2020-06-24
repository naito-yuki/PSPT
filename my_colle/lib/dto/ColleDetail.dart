import 'package:my_colle/dto/Collection.dart';

class ColleDetail {
  Collection collection;
  String collectionId;
  
  ColleDetail(Collection collection, String collectionId) {
    this.collection = collection;
    this.collectionId = collectionId;
  }
}