
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_colle/Style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'dto/ColleDetail.dart';
import 'Auth.dart';

class UserVoiceList extends StatefulWidget {
  @override
  _UserVoiceListState createState() => _UserVoiceListState();
}

class _UserVoiceListState extends State<UserVoiceList> {
  Size size;
  bool _loading = false;
  String _commentText;
  String _userId;
  String _userName;
  ColleDetail _colleDetail;
  
  void _setCommenttText(String str) {
    setState(() {
      _commentText = str;
    });
  }

  @override
  Widget build([BuildContext context]) {
    
    FirebaseAuth.instance.currentUser().then((user) {
      this._userId = user.uid;
      this._userName = user.email.split("@")[0];
    });

    // 画面サイズ
    this.size = MediaQuery.of(context).size;
    this._colleDetail = ModalRoute.of(context).settings.arguments;

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
      body: Stack(
        children: [
          Container(
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
          _loading
          ? BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 0.1,
              sigmaY: 0.1,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          )
          : Container(),
          _loading
          ? Center(
            child: CircularProgressIndicator(),
          )
          : Container(),
      
        ],
      ),
      floatingActionButton: _createPlusButton(),
    );
  }

  Widget _UserVoiceList() {
    
    // 画面サイズ
    this.size = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('myroom')
        .document(this._colleDetail.myroomId)
        .collection('items')
        .document(this._colleDetail.collection.collectionId)
        .collection('comments')
        .orderBy('postDatetime', descending: true)
        .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error:');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('Loading...');
          default:
            return ListView(
              children: snapshot.data.documents.map((doc) {
                return _createUserVoiceWidget(doc);
              }).toList(),
            );
        }
      },
    );
  }

  /// userVoiceのWidget作成
  ///
  Widget _createUserVoiceWidget(DocumentSnapshot doc) {
    return Column(
      children: [
        Container(
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
                  _createReplyButton(doc.documentID),
                ],
              ),
            ],
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('myroom')
            .document(this._colleDetail.myroomId)
            .collection('items')
            .document(this._colleDetail.collection.collectionId)
            .collection('comments')
            .document(doc.documentID)
            .collection('comments')
            .orderBy('postDatetime', descending: false)
            .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Text('Error:');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text('Loading...');
              default:
                return 
                  Container(
                    // width: this.size.width,
                    height: snapshot.data.documents.toList().length * 135.0,
                    // alignment: Alignment.topCenter,
                    child: ListView(
                      children: snapshot.data.documents.map((doc2) {
                        return _createUserVoiceWidget2(doc2, parentDocId: doc.documentID);
                      }).toList(),
                    ),
                  );
            }
          },
        ),
      ],
    );
  }
  
  /// 返信行の作成
  /// 
  Widget _createUserVoiceWidget2(DocumentSnapshot doc,{String parentDocId}) {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: this.size.width - 20,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(left: 18.0),
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
                  parentDocId == null 
                  ? _createReplyButton(doc.documentID)
                  : _createReplyButton(parentDocId),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
        

  /// Timestamp → String変換
  String convertTimestampToString(Timestamp timestamp) {
    var format = DateFormat('yyyy/MM/dd HH:mm');
    return format.format(timestamp.toDate().add(Duration(hours: 9)));
  }
  
  /// 投稿ダイアログ出力用ボタン
  Widget _createPlusButton() {
    return FlatButton(
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
        _openModalBottomSheet();
      },
    );
  }

  /// 投稿ボタン作成
  /// 
  Widget _createSubmitButton({String docId}) {
    return FlatButton(
      child: Container(
        width: 100,
        height: 60,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffFFFFFF)),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffd96666).withOpacity(0.75),
        ),
        child: Center(
          child:Text("投稿", 
          style: TextStyle(
            fontSize: 18,
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.bold,
          )
        )), 
      ),
      padding: EdgeInsets.all(0.0),
      onPressed: () async {
        setState(() {
          _loading = true;
        });
        if (this._commentText == null || this._commentText.isEmpty) {
          setState(() {
            _loading = false;
          });
          _buildDialog(context);
        } else {
          if(docId == null || docId.isEmpty){
            await Firestore.instance.collection('myroom')
              .document(this._colleDetail.myroomId)
              .collection('items')
              .document(this._colleDetail.collection.collectionId)
              .collection('comments')
              .add({
                'userId': this._userId,
                'userName': this._userName,
                'commentText': this._commentText,
                'postDatetime': DateTime.now(),
            });
          }else {
            await Firestore.instance.collection('myroom')
              .document(this._colleDetail.myroomId)
              .collection('items')
              .document(this._colleDetail.collection.collectionId)
              .collection('comments')
              .document(docId)
              .collection('comments')
              .add({
                'userId': this._userId,
                'userName': this._userName,
                'commentText': this._commentText,
                'postDatetime': DateTime.now(),
            });
          }
          
          _loading = false;
          Navigator.pop(context);
        }
        this._commentText = "";
      },
    );
  }

  /// 返信ボタン作成
  /// (ユーザNoは画面遷移に使うかもだから、一応引数)
  Widget _createReplyButton(String docId) {
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
      onPressed: () => _openModalBottomSheet(docId: docId),
    );
  }
  
  /// 返信用、投稿用ダイアログ出力
  ///
  void _openModalBottomSheet({String docId}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    // width: this.size.width - 150,
                    height: 100.0,
                    margin: EdgeInsets.all(5.0),
                    child: TextField(
                      textAlign: TextAlign.left,
                      maxLines: 3,
                      maxLength: 50,
                      onChanged: _setCommenttText,
                    ),  
                  ),
                ),
                (docId == null || docId.isEmpty) ?
                  _createSubmitButton()
                  : _createSubmitButton(docId: docId),
              ],
            ),
            Expanded(
              child: Container(
                // color: Colors.amber,
                width: 100,
              ),
            ),
          ],  
        );        
      }
    );
  }
  
  /// 未入力ダイアログ
  /// 
  _buildDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('コメントが未入力です。'),
          actions: <Widget>[
            FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}