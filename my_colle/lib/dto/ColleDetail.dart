import 'package:my_colle/dto/Collection.dart';

class ColleDetail {
  Collection collection;
  String myroomId;
  String commentId;
  
  ColleDetail(Collection collection, String myroomId) {
    this.collection = collection;
    this.myroomId = myroomId;
  }
}