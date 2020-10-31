import 'package:flutter/material.dart';

import 'father_character_page3.dart';

class FatherCharacterPage2 extends StatelessWidget {
  // 引数から選択肢を受け取る
  const FatherCharacterPage2({
    Key key,
    @required this.choices1,
    @required this.choices2,
  }) : super(key: key);

  final String choices1;
  final String choices2;

  // タイプ別のデータを定義
  final Map<String, Map<String, String>> typeDataList = const {
    'TYPE_1': {
      'title': 'タイプ１【XXXする人】',
      'body': '活動的で、...',
    },
    'TYPE_2': {
      'title': 'タイプ2【XXXする人】',
      'body': '活動的で、...',
    },
    'TYPE_3': {
      'title': 'タイプ3【XXXする人】',
      'body': '活動的で、...',
    },
    'TYPE_4': {
      'title': 'タイプ4【XXXする人】',
      'body': '活動的で、...',
    },
    'TYPE_5': {
      'title': 'タイプ5【XXXする人】',
      'body': '活動的で、...',
    },
    'TYPE_6': {
      'title': 'タイプ6【XXXする人】',
      'body': '活動的で、...',
    },
    'TYPE_7': {
      'title': 'タイプ7【XXXする人】',
      'body': '活動的で、...',
    },
    'TYPE_8': {
      'title': 'タイプ8【XXXする人】',
      'body': '活動的で、...',
    },
    'TYPE_9': {
      'title': 'タイプ9【XXXする人】',
      'body': '活動的で、...',
    },
    'TYPE_ERROR': {
      'title': 'エラー',
      'body': 'エラー',
    },
  };

  // 選択肢を元にタイプを判定
  String getType() {
    if (choices1 == 'A' && choices2 == 'X') return 'TYPE_1';
    if (choices1 == 'A' && choices2 == 'Y') return 'TYPE_2';
    if (choices1 == 'A' && choices2 == 'Z') return 'TYPE_3';
    if (choices1 == 'B' && choices2 == 'X') return 'TYPE_4';
    if (choices1 == 'B' && choices2 == 'Y') return 'TYPE_5';
    if (choices1 == 'B' && choices2 == 'Z') return 'TYPE_6';
    if (choices1 == 'C' && choices2 == 'X') return 'TYPE_7';
    if (choices1 == 'C' && choices2 == 'Y') return 'TYPE_8';
    if (choices1 == 'C' && choices2 == 'Z') return 'TYPE_9';
    return 'TYPE_ERROR';
  }

  @override
  Widget build(BuildContext context) {
    // 表示に使用するデータを取得
    final typeData = typeDataList[getType()];

    return Scaffold(
      appBar: AppBar(
        title: Text("Growth Facilitator for Students"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'お父さんページ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    '信頼関係づくりステージ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    '性格診断テスト',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    '診断結果',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    typeData['title'],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    typeData['body'],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    '…',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                ],
              ),
            ),
            RaisedButton(
              child: const Text(
                '保存',
                style: TextStyle(fontSize: 18),
              ),
              color: Colors.green,
              shape: const StadiumBorder(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FatherCharacterPage3(),
                    ));
              },
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
          ],
        ),
      ),
    );
  }
}
