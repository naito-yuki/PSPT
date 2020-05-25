import 'package:my_colle/dto/UserVoice.dart';

class UserVoiceDao {
  // UserVoiceDao() {
  // }
  
  // ユーザーNoでcollectionを取得(今は固定)
  List<UserVoice> getUserVoiceListByCollectionNo(int collectionNo) {
    List<UserVoice> collectionList = new List<UserVoice>();
    
    // DBの中身を想定
    collectionList.add(new UserVoice(1, "坂田", collectionNo, "すばらしい。イベントやりましょう", "2020/5/22 15:00"));
    collectionList.add(new UserVoice(2, "佐々木", collectionNo, "私は買いそびれてしまいました。", "2020/5/22 14:00"));
    collectionList.add(new UserVoice(3, "桜井", collectionNo, "2枚持っていらっしゃるなら、是非1枚譲っていただけないでしょうか？", "2020/5/22 13:00"));
    collectionList.add(new UserVoice(1, "坂田", collectionNo, "私はこのリマスター版を持っています。よろしければ、私のルームに遊びに来てください。\nhttp://******", "2020/5/22 12:00"));
    
    return collectionList;
  }
}