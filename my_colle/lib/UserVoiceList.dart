import 'package:flutter/material.dart';
import 'package:my_colle/dto/UserVoice.dart';
import 'package:my_colle/dao/UserVoiceDao.dart';
import 'package:my_colle/Style.dart';

class UserVoiceList extends StatelessWidget {
  
  Size size;
  String itemId;
  
  UserVoiceList({Key key, this.itemId}): super(key: key);
  
  @override
  Widget build([BuildContext context]) {
    
    // 画面サイズ
    this.size = MediaQuery.of(context).size;
    
    // userVoiceのリストを取得(今は固定)
    UserVoiceDao dao = new UserVoiceDao();
    List<UserVoice> userVoiceList = dao.getUserVoiceListByItemId(this.itemId); // ユーザーNoはなんとなく
    
    // リスト表示用のWidgetリスト作成
    List<Widget> userVoiceWidgetList = <Widget>[];
    userVoiceList.forEach((UserVoice userVoice) {
      userVoiceWidgetList.add(createUserVoiceWidget(userVoice));
    });
    
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
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(children: userVoiceWidgetList),
      ),

    );
  }
  
  /// userVoiceのWidget作成
  /// 
  Widget createUserVoiceWidget(UserVoice userVoice) {
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
          Text(userVoice.userName, style: Style.userVoiceNameText,),
          
          Text(userVoice.comment, style: Style.userVoiceText,),
          Style.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(userVoice.postTime, style: TextStyle(color: Color(0xffbbbbbb))),
              ),
              createReplyButton(userVoice.userId),
            ],
          ),
        ],
      ),
    );
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
      },
    );
  }
}