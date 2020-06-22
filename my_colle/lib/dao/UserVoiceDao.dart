import 'package:my_colle/dto/UserVoice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserVoiceDao {
  // UserVoiceDao() {
  // }
  var firestore = Firestore.instance;
  
  // ユーザーNoでcollectionを取得(今は固定)
  List<UserVoice> getUserVoiceListByItemId(String itemId) {
    
    List<UserVoice> userVoiceList = new List<UserVoice>();
    // var snapshots = 
    var snapshots = firestore
      .collection('myroom')
      .document('myroom_sample')
      .collection('items')
      .document('collection_sample')
      .collection('comments')
      .snapshots();
    // .forEach((data) {
    //     for(var doc in data.documents) {
    //       print(doc["commentText"].toString());
    //       userVoiceList.add(new UserVoice(doc["userId"].toString(), doc["userName"].toString(), doc["commentText"].toString(), "2020/06/12 13:00"));
    //     }
    //   }
    // );
    
    // snapshots.forEach((data) =>
    //   data.documents.forEach((doc) {
    //     print(doc["commentText"].toString());
    //     var userVoice = new UserVoice(doc["userId"].toString(), doc["userName"].toString(), doc["commentText"].toString(), "2020/06/12 13:00");
    //     userVoiceList.add(userVoice);
    //   })
    // );
    
    
    snapshots.listen((data) => data.documents.forEach((doc) {
      userVoiceList.add(new UserVoice(doc["userId"].toString(), doc["userName"].toString(), doc["commentText"].toString(), "2020/06/12 13:00"));
    }));
  
    // DBの中身を想定
    // collectionList.add(new UserVoice("03", "桜井", "2枚持っていらっしゃるなら、是非1枚譲っていただけないでしょうか？", "2020/5/22 13:00"));
    // collectionList.add(new UserVoice("01", "坂田", "私はこのリマスター版を持っています。よろしければ、私のルームに遊びに来てください。\nhttp://******", "2020/5/22 12:00"));
    
    return userVoiceList;
  }
}