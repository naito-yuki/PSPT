import 'package:flutter/material.dart';


// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

class CategoryList extends StatelessWidget {
  List<String> textlist = [
    '・家電、AV、カメラ',
    '・音楽、CD、レコード',
    '・本、雑誌、漫画',
    '・映画',
    '・キャラクター関連',
    '・鉄道、航空、車、バイク',
    '・ミリタリー',
    '・ファッション',
    '・アクセサリー、時計',
    '・住まい、インテリア',
    '・自然科学',
    '・スポーツ',
    '・食品、飲料',
    '・エンタテインメントグッズ',
    '・記念品、切手、コイン系',
    '・アート絵画工芸品',
    '・おまけ、懸賞品系',
  ];

  List<String> subTextlist = [
    'テレビ、ラジオ/ラジカセ、オーディオ、スピーカー、CDプレーヤー、レコードプレーヤー、カメラ、双眼鏡、望遠鏡',
    'CD、レコード、カセットテープ、DVD、ビデオ、楽器クラシック、電子楽器、チケット半券',
    '初版本、絵本・児童書、雑誌、漫画、コミック、写真集、古書/古文書、原画',
    'DVD、ビデオテープ、レーザーディスク、チケット半券、ポスター、映画関連グッズ',
    'フィギュア、カード、玩具、人形、ぬいぐるみ、テレビゲーム、グッズ全般、コスプレ衣装',
    '鉄道模型、ジオラマ、飛行機模型、自動車模型、バイク模型、プラレール、ミニカー、バイク、プラモデル',
    '電動ガン、ガスガン、エアガン、モデルガン、戦闘服/制服、微章/ワッペン、ライター、ラジコン、プラモデル',
    'シューズ、香水/フレグランス、バッグ、財布、キーケース、眼鏡/サングラス、マフラー、ジーンズ',
    '指輪、ネックレス、イヤリング、ピアス、ブローチ、ヘアアクセサリー、腕時計、懐中時計、置時計/掛時計',
    '家具、インテリア小物、照明、アンティーク家具、椅子、ドレッサー、鏡',
    '化石、岩石/鉱物、昆虫標本、貝、魚拓/剝製、バードウォッチング、骨格標本、ドライフラワー、押し花',
    'スニーカー、スポーツ系ウェア、自転車、アウトドアグッズ、サイングッズ、フィッシング/釣竿、チケット半券',
    'ワイン、ウイスキー系、各種ノベルティ、空き缶、駄菓子、珈琲/お茶/紅茶、缶詰、グラス、お皿等食器',
    'カード、著名人サイン、各種グッズ、カレンダー、セル画、テレホンカード、ポスター、生写真',
    '切手、記念物グッズ、コイン、万年筆/文具、ライター、タイピン/カフス、文鎮、クリスタルガラス、記念/限定商品',
    '絵画、オブジェ/彫刻、工芸品、書、版画',
    'カード、キャンペーングッズ、ミニチュアトイ、コースター、コップ、缶バッジ、ステッカー、Tシャツ、タオル',
  ];

  List<IconData> iconlist = [
    Icons.photo_camera,
    Icons.music_note,
    Icons.book,
    Icons.movie,
    Icons.pets,
    Icons.airplanemode_active,
    Icons.person,
    Icons.shopping_cart,
    Icons.watch,
    Icons.event_seat,
    Icons.local_florist,
    Icons.pool,
    Icons.fastfood,
    Icons.videogame_asset,
    Icons.monetization_on,
    Icons.account_balance,
    Icons.category,
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Container(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Text(
        //           'MY ROOM',
        //           style: TextStyle(
        //             fontSize: 35,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ))
        //   ],
        // ),
      ),
      body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "出展カテゴリー一覧",
                  style: TextStyle(
                    fontSize: 25,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 550,
                child: ListView(
                  children: List.generate(textlist.length, (index) {
                    return InkWell(
                      child: Card(
                        child: ListTile(
                          title: Text(
                            textlist[index],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            subTextlist[index],
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),  
                          leading: Icon(iconlist[index]),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                            context, '/CtgDtlLst',
                            arguments: textlist[index]);
                      },
                    );
                  }),
                ),
              )
            ],
          )),
    );
  }
}
