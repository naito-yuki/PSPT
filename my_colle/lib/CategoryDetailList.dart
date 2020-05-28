import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         //primarySwatch: Colors.red,
//         primaryColor: Colors.red[600],
//       ),
//       home: new MyHomePage(),
//     );
//   }
// }

class CategoryDetailList extends StatefulWidget {
  @override
  _CategoryDetailListState createState() => new _CategoryDetailListState();
}

class _CategoryDetailListState extends State<CategoryDetailList> {
  List<String> textlist = [
    'ビートルズマニア向け',
    '洋楽ロックコレクション',
    '歌謡曲JPOPたくさん',
    'AOR、R&B、ソウル',
    'ヘヴィメタ',
    'ソウルソング',
    '昔懐かしいバラード',
    '人気のKPOP',
    '世界に1つだけの花'
  ];

  @override
  Widget build(BuildContext context) {
    var categorytitle =ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      appBar: new AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'MY ROOM',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
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
                  "出展カテゴリー",
                  style: TextStyle(
                    fontSize: 25,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 40,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "・$categorytitle・・・・・・・・・15",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 30,
                    //padding: const EdgeInsets.all(8.0),

                    child: Text(
                      "      　レコード・・・・・・・・・8",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 480,
                child: ListView(
                  children: List.generate(textlist.length, (index) {
                    return InkWell(
                      child: Card(
                        child: ListTile(
                          title: Text(
                            textlist[index],
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                              "********************************************************************************"),
                          leading: Icon(Icons.person),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                            context, '/MyRmTop',
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
