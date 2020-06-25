
import 'package:flutter/material.dart';
import 'package:my_colle/Style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'dto/ColleDetail.dart';

class UserVoiceList extends StatefulWidget {
  @override
  _UserVoiceListState createState() => _UserVoiceListState();
}

class _UserVoiceListState extends State<UserVoiceList> {
  Size size;

  @override
  Widget build([BuildContext context]) {

    // 画面サイズ
    this.size = MediaQuery.of(context).size;

    // // userVoiceのリストを取得(今は固定)
    // UserVoiceDao dao = new UserVoiceDao();
    // List<UserVoice> userVoiceList = dao.getUserVoiceListByItemId(this.itemId); // ユーザーNoはなんとなく

    // // リスト表示用のWidgetリスト作成
    // List<Widget> userVoiceWidgetList = <Widget>[];
    // userVoiceList.forEach((UserVoice userVoice) {
    //   userVoiceWidgetList.add(createUserVoiceWidget(userVoice));
    // });

    return Scaffold(
      appBar: AppBar(
        // title: Center(
        //   child: Text(
        //     'User\'s Voice',
        //     // style: PsStyle.bigTytleStyle
        //   ),
        // ),
      ),
      body: Container(
        width: this.size.width,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        // child: ListView(children: userVoiceWidgetList),
        child: _UserVoiceList(),
      ),
    );
  }

  Widget _UserVoiceList() {
    ColleDetail colleDetail = ModalRoute.of(context).settings.arguments;

    // 画面サイズ
    this.size = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('myroom')
        .document(colleDetail.myroomId)
        .collection('items')
        .document(colleDetail.collection.collectionId)
        .collection('comments')
        .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error:');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('Loading...');
          default:
            return ListView(
              children: snapshot.data.documents.map((doc) {
                return createUserVoiceWidget(doc);
              }).toList(),
            );
        }
      },
    );
  }

  /// userVoiceのWidget作成
  ///
  Widget createUserVoiceWidget(DocumentSnapshot doc) {
    return Container(
      // height: 100,
      width: this.size.width,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff0070c0)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(doc.data["userName"], style: Style.userVoiceNameText,),

          Text(doc.data["commentText"], style: Style.userVoiceText,),
          Style.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                // child: Text(doc["postDatetime"], style: TextStyle(color: Color(0xffbbbbbb))),
                child: Text(convertTimestampToString(doc.data["postDatetime"]), style: TextStyle(color: Color(0xffbbbbbb))),
              ),
              createReplyButton(doc.data["userId"]),
            ],
          ),
        ],
      ),
    );
  }

  /// Timestamp → String変換
  String convertTimestampToString(Timestamp timestamp) {
    var format = DateFormat('yyyy/MM/dd HH:mm');
    return format.format(timestamp.toDate().add(Duration(hours: 9)));
  }

  /// 返信ボタン作成
  /// (ユーザNoは画面遷移に使うかもだから、一応引数)
  Widget createReplyButton(String userNo) {
    return FlatButton(
      child: Container(
        width: 60.0,
        height: 30.0,
        child: Center(child: Text("返信", style: Style.replyButtonText,)),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff59a2d6)),
          color: Color(0xff59a2d6),
        ),
      ),
      padding: EdgeInsets.all(0.0),
      onPressed: () {
        // 返信投稿に遷移
        // return TextField(
        //   obscureText: false,
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(),
        //     labelText: '返信',
        //   ),
        // );
      },
    );
  }
}