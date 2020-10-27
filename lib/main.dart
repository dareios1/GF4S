import 'package:flutter/material.dart';

import 'father_character_page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Growth Facilitator for Students',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Growth Facilitator for Students'),
        ),
        body: Center(
          child: FatherCharacterPage1(),
        ),
      ),
    );
  }
}

class FatherCharacterPage1 extends StatefulWidget {
  @override
  _FatherCharacterPage1State createState() => _FatherCharacterPage1State();
}

class _FatherCharacterPage1State extends State<FatherCharacterPage1> {
  String _choices1 = '未選択';
  String _choices2 = '未選択';

  void _handleRadioButton(String choices1) => setState(() {
        _choices1 = choices1;
      });

  void _handleRadioButton2(String choices2) => setState(() {
        _choices2 = choices2;
      });

  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  'この性格診断は「エニアグラム」を用いて行います。20歳以下だった時にどうだったかを考えるようにしてください。自分に最も当てはまるものを、質問群Ⅰ・質問群Ⅱからそれぞれ1つずつ選びチェックを入れて送信ボタンを押してください。',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 30.0)),
                Text(
                  '質問群Ⅰ：' + _choices1,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Radio(
                activeColor: Colors.blueAccent,
                value: 'A',
                groupValue: _choices1,
                onChanged: _handleRadioButton,
              ),
              Text('A.欲しいものは遠慮しすぎずに手に入れる。'),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                activeColor: Colors.blueAccent,
                value: 'B',
                groupValue: _choices1,
                onChanged: _handleRadioButton,
              ),
              Text('B.自分と周囲とのバランスを大切にする。'),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                activeColor: Colors.blueAccent,
                value: 'C',
                groupValue: _choices1,
                onChanged: _handleRadioButton,
              ),
              Text('C.つい自分の中の世界にひたりがちになる。'),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          Center(
            child: Text(
              '質問群Ⅱ：' + _choices2,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: <Widget>[
              Radio(
                activeColor: Colors.redAccent,
                value: 'X',
                groupValue: _choices2,
                onChanged: _handleRadioButton2,
              ),
              Text('X.楽観的すぎて問題になることがある。'),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                activeColor: Colors.redAccent,
                value: 'Y',
                groupValue: _choices2,
                onChanged: _handleRadioButton2,
              ),
              Text('Y.冷静沈着で合理的な人と思われる。'),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                activeColor: Colors.redAccent,
                value: 'Z',
                groupValue: _choices2,
                onChanged: _handleRadioButton2,
              ),
              Text('Z.気持ちを発散したら、気がおさまる。'),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          RaisedButton(
            child: const Text(
              '送信',
              style: TextStyle(fontSize: 18),
            ),
            color: Colors.green,
            shape: const StadiumBorder(),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FatherCharacterPage2(),
                  ));
            },
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
        ],
      ),
    );
  }
}
