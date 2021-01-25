import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

const kColorPurple = Color(0xFF8337EC);
const kColorPink = Color(0xFFFF006F);
const kColorIndicatorBegin = kColorPink;
const kColorIndicatorEnd = kColorPurple;
const kColorTitle = Color(0xFF616161);
const kColorText = Color(0xFF9E9E9E);
const kElevation = 4.0;

// HOME画面　土台
class FatherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final FirebaseUser user = userState.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お父さんページ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: kButtonColorPrimary,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              // ユーザー情報を表示
              child: Text(
                'ログイン情報：${user.email}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: kButtonColorPrimary,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people),
              title: Text("お父さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("性格診断テスト"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("面談テーマルーレット"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("自己開示アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("お子さん別アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text("お母さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.directions_walk),
              title: Text("生徒さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("教師一覧ページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("ログアウト"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () async {
                  // ログアウト処理
                  // 内部で保持しているログイン情報等が初期化される
                  // （現時点ではログアウト時はこの処理を呼び出せばOK）
                  await FirebaseAuth.instance.signOut();
                  // ログイン画面に遷移＋画面を破棄
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        _PageGreen(),
                        _PageRed(),
                        _PageBlue(),
                        _PageOrange(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.cyan,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_people,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Father',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pregnant_woman,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Mother',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_walk,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Student',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Teacher',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

// HOME画面　パーツ
class _Page1 extends StatelessWidget {
  final String name;
  final String message;
  final Color colorPrimary;
  final Color colorPositive;
  final String textPositive;

  const _Page1({
    Key key,
    @required this.name,
    @required this.message,
    @required this.colorPrimary,
    @required this.colorPositive,
    @required this.textPositive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 8,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            ListTile(
              leading: ClipOval(
                child: Container(
                  color: colorPrimary,
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      name.substring(0, 1),
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
              title: Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 72),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorPrimary, width: 4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(child: Text(message)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      color: colorPositive.withOpacity(0.2),
                      textColor: colorPositive,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FatherCharacterPage1(),
                            ));
                      },
                      child: Text(textPositive),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Page2 extends StatelessWidget {
  final String name;
  final String message;
  final Color colorPrimary;
  final Color colorPositive;
  final String textPositive;

  const _Page2({
    Key key,
    @required this.name,
    @required this.message,
    @required this.colorPrimary,
    @required this.colorPositive,
    @required this.textPositive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 8,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            ListTile(
              leading: ClipOval(
                child: Container(
                  color: colorPrimary,
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      name.substring(0, 1),
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
              title: Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 72),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorPrimary, width: 4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(child: Text(message)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      color: colorPositive.withOpacity(0.2),
                      textColor: colorPositive,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FatherInterviewRoulettePage1(),
                            ));
                      },
                      child: Text(textPositive),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Page3 extends StatelessWidget {
  final String name;
  final String message;
  final Color colorPrimary;
  final Color colorPositive;
  final String textPositive;

  const _Page3({
    Key key,
    @required this.name,
    @required this.message,
    @required this.colorPrimary,
    @required this.colorPositive,
    @required this.textPositive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 8,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            ListTile(
              leading: ClipOval(
                child: Container(
                  color: colorPrimary,
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      name.substring(0, 1),
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
              title: Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 72),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorPrimary, width: 4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(child: Text(message)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      color: colorPositive.withOpacity(0.2),
                      textColor: colorPositive,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FatherSelfDisclosurePage1(),
                            ));
                      },
                      child: Text(textPositive),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Page4 extends StatelessWidget {
  final String name;
  final String message;
  final Color colorPrimary;
  final Color colorPositive;
  final String textPositive;

  const _Page4({
    Key key,
    @required this.name,
    @required this.message,
    @required this.colorPrimary,
    @required this.colorPositive,
    @required this.textPositive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 8,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            ListTile(
              leading: ClipOval(
                child: Container(
                  color: colorPrimary,
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      name.substring(0, 1),
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
              title: Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 72),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorPrimary, width: 4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(child: Text(message)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      color: colorPositive.withOpacity(0.2),
                      textColor: colorPositive,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FatherCharacterPage1(),
                            ));
                      },
                      child: Text(textPositive),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageGreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Page1(
      name: '性格診断テスト',
      message: 'エニアグラムを用いた性格診断テスト',
      colorPrimary: Colors.greenAccent[400],
      colorPositive: Colors.greenAccent[400],
      textPositive: 'SELECT',
    );
  }
}

class _PageRed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Page2(
      name: '面談テーマルーレット',
      message: '面談当日のテーマをランダムに決定',
      colorPrimary: Colors.redAccent,
      colorPositive: Colors.redAccent,
      textPositive: 'SELECT',
    );
  }
}

class _PageBlue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Page3(
      name: '自己開示アンケート',
      message: 'お父さん自身の自己開示を促すアンケート',
      colorPrimary: Colors.blueAccent,
      colorPositive: Colors.blueAccent,
      textPositive: 'SELECT',
    );
  }
}

class _PageOrange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Page4(
      name: 'お子さん別アンケート',
      message: '将来の希望を理解するためのアンケート',
      colorPrimary: Colors.orangeAccent[400],
      colorPositive: Colors.orangeAccent[400],
      textPositive: 'SELECT',
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

  void _handleRadioButton1(String choices1) => setState(() {
        _choices1 = choices1;
      });
  void _handleRadioButton2(String choices2) => setState(() {
        _choices2 = choices2;
      });

  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final FirebaseUser user = userState.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お父さんページ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: kButtonColorPrimary,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              // ユーザー情報を表示
              child: Text(
                'ログイン情報：${user.email}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people),
              title: Text("お父さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("性格診断テスト"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("面談テーマルーレット"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("自己開示アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("お子さん別アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text("お母さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.directions_walk),
              title: Text("生徒さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("教師一覧ページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("ログアウト"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () async {
                  // ログアウト処理
                  // 内部で保持しているログイン情報等が初期化される
                  // （現時点ではログアウト時はこの処理を呼び出せばOK）
                  await FirebaseAuth.instance.signOut();
                  // ログイン画面に遷移＋画面を破棄
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '信頼関係づくりステージ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: Colors.cyan,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Text(
                    '性格診断テストⅠ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'エニアグラムの「QUEST(簡易分類テスト)」を用いて性格タイプの絞り込みを行います。１０代の頃を思い出して答えてください。ご自身に最も当てはまるものを、質問群Ⅰ・質問群Ⅱからそれぞれ１つずつ選びチェックを入れて送信ボタンを押してください。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 8, left: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '質問群Ⅰ：' + _choices1,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.grey[100],
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.greenAccent[400],
                                  value: 'A',
                                  groupValue: _choices1,
                                  onChanged: _handleRadioButton1,
                                ),
                                Text(
                                  'A.欲しいものは遠慮しすぎずに手に入れる。',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            color: Colors.grey[100],
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.redAccent,
                                  value: 'B',
                                  groupValue: _choices1,
                                  onChanged: _handleRadioButton1,
                                ),
                                Text(
                                  'B.自分と周囲とのバランスを大切にする。',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            color: Colors.grey[100],
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.blueAccent,
                                  value: 'C',
                                  groupValue: _choices1,
                                  onChanged: _handleRadioButton1,
                                ),
                                Text(
                                  'C.つい自分の中の世界にひたりがちになる。',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 8, left: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                '質問群Ⅱ：' + _choices2,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 'X',
                            groupValue: _choices2,
                            onChanged: _handleRadioButton2,
                          ),
                          Text(
                            'X.楽観的すぎて問題になることがある。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 'Y',
                            groupValue: _choices2,
                            onChanged: _handleRadioButton2,
                          ),
                          Text(
                            'Y.冷静沈着で合理的な人と思われる。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 'Z',
                            groupValue: _choices2,
                            onChanged: _handleRadioButton2,
                          ),
                          Text(
                            'Z.気持ちを発散したら、気がおさまる。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  '送信',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
                color: kButtonColorPrimary,
                splashColor: kButtonTextColorPrimary,
                padding: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // 引数から選択肢を渡す
                        builder: (context) => FatherCharacterPage2(
                          choices1: _choices1,
                          choices2: _choices2,
                        ),
                      ));
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.cyan,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_people,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Father',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pregnant_woman,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Mother',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_walk,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Student',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Teacher',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

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
      'type': 'タイプ１【改革する人】',
      'type_detail':
          '理想や理念、倫理基準が高く、理性的。間違うことを恐れ、正しくありたい。健全な状態で、思慮分別があり、理想を現実にするための努力を惜しまない。誠実で、公平、バランス感覚がある。通常、現状に満足できず、物事は常に少しでも改善の余地があると考えがち。とらわれが強くなると、批判的にものごとを見、完璧主義が行きすぎる。自己批判が強く、内面の理想的な基準に照らして、自らを叱咤激励する。ハードワークになりがちで、リラックスしにくい。不健全になるにつれ、他の人（とくに身内）や物事の至らないところが気になって、自己正当化や非難が強まる。他の人は自分ほどきちんとできず、自分だけが責任を負っていると思いがち。柔軟性に欠け、怒りや正義感がエネルギーとなる。強迫的になる。タイプ１の本質は、知恵。',
    },
    'TYPE_2': {
      'type': 'タイプ２【助ける人】',
      'type_detail':
          '人とのつながりを大切にし、思いやりがあり、面倒見がいい。贈り物をする場合は 、相手にもっともふさわしいものを探し出す。自分が愛される価値のないことを恐れ 、無条件に愛されたいと願う。健全な状態では、見返りを求めることなく、真に寛大な「与える人」。だがとらわれが強くなるにつれ、自分勝手な「思いやりマニュアル」にしたがって、相手の実際のニーズを確かめることなく、援助しようとする。そしておせっかいになり、自己犠牲を払って恩を売り、所有欲が強くなる。自分自身の問題やニーズを認めようとせず、助けを受けることが苦手（「自分は大丈夫」）。不健全な状態で、自分の親切が思ったように評価されない場合、相手を敵視し、強く非難する。人が自分から去ることのないよう、強迫的に愛を求める。ストレスは、心理的問題よりも、身体症状として出やすい。最終的には心身共に消耗し、人に面倒を見てもらわざるを得なくなる。タイプ２の本質は、無条件の愛。',
    },
    'TYPE_3': {
      'type': 'タイプ３【達成する人】',
      'type_detail':
          '成功志向で、実利的。自分に価値がないことを恐れ、人からほめられることをして、価値を感じたい。目標実現のため、ハードに働く。健全な状態において、自分の価値を心から信じ、ベストの自分になる。明確な目標設定により、物事を実現する力がある。またその目標に向かって、他の人のやる気を引き出すこともできる。自信をもち、プレゼンテーションがうまい。その反面、とらわれが強くなると、競争心や上昇志向、ステータス志向が強まる。自分より下と感じる者に対し、横柄な態度を取ることもある。成功した自己イメージにこだわり、自分の素直な気持ちや本当に求めているものを感じたり、親密な関係をもつことが難しい。また、不健全な状態では、実際の自分の実力以上に良く見せようとして嘘をつくことも厭わないが、内面の空虚感が高まる。自分の悩みを隠したり、自分を拒否したと思われるものを攻撃する。タイプ３の本質は、真正。',
    },
    'TYPE_4': {
      'type': 'タイプ４【個性を求める人】',
      'type_detail':
          '繊細で、直感的で、感受性豊か。自分に生きている意味がないことを恐れ、存在意義を見つけたい。健全な状態で、人生の深さや美しさに触れ、それを創造的に表現する。きわめて個人的なことを語っていても、普遍的な価値をもつことが多い。通常の状態では、美しいものに囲まれ、耽美的な空想に耽ることで、自分らしいムードを保つ。とらわれが強まるにつれ、人生に対し、斜に構える。気分にムラがあり、自意識が強い。人と一定の距離を置くがかえって注意を引く。自分が特別であり、理解されにくいと思う一方、平凡な人生へのひそやかなあこがれもある。自分と同じ価値を共有したり、自分を救ってくれる「理想的な相手」にあこがれるが、近くにいるとあらが見えるので、遠ざける。そして離れては引き寄せるということを繰り返す。不健全になると、自己憐憫や他人への妬み、嗜癖などの自己放縦に走ったり、鬱的になる。タイプ４の本質は、美と創造。',
    },
    'TYPE_5': {
      'type': 'タイプ５【調べる人】',
      'type_detail':
          '集中的に頭を使う、観察者。自分が無能であることを恐れ、有能でありたい。そのために得意な知識や技能をもっていることが重要になる。健全な状態で、未来を見通す、先駆的なヴィジョンをもつ。洞察力が鋭く、ものごとに巻き込まれずに、全体を見通す力がある。好奇心にあふれ、斬新な発想をもつ。通常の状態で、典型的な思考型で、理性的。感情表現や人間関係は得意な方ではない。まわりの環境を理解し、解明することで、圧倒されないようにする。興味をもったことに関し、集中的に知識を習得し、没頭する。とらわれが強くなるにつれ、知識や技能を身につけることで初めて、世の中と関われると考えがち。すべてを構想したり、納得してからでないと、行動できない。自分が他人に依存しない代わりに、自分も依存されたくない。自分の知性を鼻にかけ、挑発的な皮肉を言う。不健全になると孤立して、エキセントリックなニヒリストとなる。タイプ５の本質は、知。',
    },
    'TYPE_6': {
      'type': 'タイプ６【信頼を求める人】',
      'type_detail':
          '安全志向で、自分が何を信じることができるか、ということが重要な人生のテーマ。信頼できる人物や考え方を求めるが、本当に信頼できるか、疑う気持ちと、忠実であろうとする気持ちの間を揺れ動く。権威をもつ者に、従うか、反発するかのどちらかになりやすい。独力ではやっていけないことを恐れ、同意やサポートをまわりから得たい。自分に対する周りのさまざまな期待に合わせようとし、優柔不断になる。思考が活発なときと、感情的になるときの両方がある。雑念に悩まされやすく、頭の中をからっぽにするのが苦手。健全な状態で、外側にあるものではなく、自らの内に勇気と信頼を見いだす。愛情深く、仲間のために忠実かつ献身的で、真剣に関わる努力家。関心のあることを追求したり、用意周到に準備する能力もある。とらわれが強まるにつれ、不安が高じてルールや枠、原理を頑なに守ろうとしたり、最悪の事態を考える。パラノイアになる。「敵」をつくりだして、攻撃する。タイプ６の本質は、勇気。',
    },
    'TYPE_7': {
      'type': 'タイプ７【熱中する人】',
      'type_detail':
          '活動的で、もっとも外向的。冒険や楽しいこと、刺激的なことに熱中し、自由を好む。必要なものを奪われ、痛みを感じることを恐れ、幸福で充足していたい。健全な状態で、感謝や生きる喜びで満たされる。肯定的で創造的なヴィジョンを考え出す。周りの人を楽しませることで、自分も楽しくなる。楽観的だが、実行能力もある。通常の状態で、さまざまな計画を立てるだけで楽しく、忙しい。話の中心になり、冗談を飛ばして場を盛り上げる。多才な反面、腰を落ちつけて集中しにくい。とらわれが強まるにつれ、「今、ここ」にあるものより、もっといいものがあるのではと考える。また、たくさん計画したことをなかなか実行できなくて、苦しむ。不健全になると、きわめて衝動的で無責任になり、どんなことをしてでも苦痛から逃がれようとする。快楽や嗜癖、物質主義に走ったり、躁鬱的になる。財政的破綻や病気にも至る。タイプ７の本質は、喜びと感謝。',
    },
    'TYPE_8': {
      'type': 'タイプ８【挑戦する人】',
      'type_detail':
          '強く腹が据わっていて、遠慮せず、はっきりものを言う。他人に支配されることを恐れ、自分が支配し、仕切りたがる。現実的で、マイウェイ（わが道を行く）。健全な状態で、心が広く、面倒見がいい。弱い立場の者を守る。自然な自信と力、リーダーシップを備えていて、決断力に富む。エネルギーに満ちあふれていて、行動的。リスクや挑戦を恐れない。性格のとらわれが強くなるにつれ、自慢したり、強がりを言う。世間のルールや常識に構わず力づくでも自分のやりたいことを通す。自分の弱さは決して認めないで、相手の弱点をつついて、支配したり、操作する。不健全になるとお金や権力、名声など、力を誇示したり、闘争的・破壊的になる。タイプ８の本質は、「慈愛を伴う力」。',
    },
    'TYPE_9': {
      'type': 'タイプ９【平和を好む人】',
      'type_detail':
          '穏やかで、人に安心感を与え、気持ちをなごませる。人から見捨てられることを恐れ、平和や快適であること、また、一体感を好む。健全な状態で、平和で安定した心を保つ。周囲に緊張や葛藤がある場合は、公平な立場で辛抱強く仲裁に入る。想像力に富み、楽観的なヴィジョンをもつ。性格のとらわれが強くなると、表面的にまわりに合わせ、葛藤を避け、実態よりもいい方に理想化して考えてしまう。頑固なまでに現状維持。自分は成長するに値しないと思いがちで、変化へ向けての積極的な行動を起こせない。怒りや不満を直接表現せずに、暗黙の抵抗で示す。不健全なとき、まわりの人から気持ちが離れ、問題に直面することなく、自分を麻痺させて、心地良い空想や嗜癖、フテ寝などに走る。抑鬱や無感覚になる。タイプ９の本質は、「平和」。',
    },
    'TYPE_ERROR': {
      'type': '選択肢を選んでください。',
      'type_detail': '選択肢を選んでください。',
    },
  };

  // 選択肢を元にタイプを判定
  String getType() {
    if (choices1 == 'A' && choices2 == 'X') return 'TYPE_7';
    if (choices1 == 'A' && choices2 == 'Y') return 'TYPE_3';
    if (choices1 == 'A' && choices2 == 'Z') return 'TYPE_8';
    if (choices1 == 'B' && choices2 == 'X') return 'TYPE_2';
    if (choices1 == 'B' && choices2 == 'Y') return 'TYPE_1';
    if (choices1 == 'B' && choices2 == 'Z') return 'TYPE_6';
    if (choices1 == 'C' && choices2 == 'X') return 'TYPE_9';
    if (choices1 == 'C' && choices2 == 'Y') return 'TYPE_5';
    if (choices1 == 'C' && choices2 == 'Z') return 'TYPE_4';
    return 'TYPE_ERROR';
  }

  // テキストフィールドのステートを管理
  // final _stateController = TextEditingController();
  //
  // @override
  // void initState() {
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   this._stateController.dispose();
  //   super.dispose();
  // }

  // SaveボタンがおされたらFirestoreに値を保存
  // void saveOnPressed() {
  //   Firestore.instance
  //       .document("sample/sandwichData")
  //       .updateData({"hotDogStatus": _stateController.text})
  //       .then((value) => print("success"))
  //       .catchError((value) => print("error $value"));
  // }

  @override
  Widget build(BuildContext context) {
    // 表示に使用するデータを取得
    final typeData = typeDataList[getType()];
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final FirebaseUser user = userState.user;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お父さんページ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.cyan,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'ログイン情報：${user.email}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people),
              title: Text("お父さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("性格診断テスト"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("面談テーマルーレット"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("自己開示アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("お子さん別アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text("お母さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.directions_walk),
              title: Text("生徒さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("教師一覧ページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("ログアウト"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () async {
                  // ログアウト処理
                  // 内部で保持しているログイン情報等が初期化される
                  // （現時点ではログアウト時はこの処理を呼び出せばOK）
                  await FirebaseAuth.instance.signOut();
                  // ログイン画面に遷移＋画面を破棄
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '信頼関係づくりステージ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: Colors.cyan,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Text(
                    '性格診断テストⅠ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
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
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        ListTile(
                          leading: ClipOval(
                            child: Container(
                              color: Colors.lightBlueAccent,
                              width: 48,
                              height: 48,
                              child: Center(
                                child: Text(
                                  typeData['type'].substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            typeData['type'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.lightBlueAccent, width: 4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                  child: Text(
                                typeData['type_detail'],
                                style: TextStyle(fontSize: 18),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      child: Text(
                        '保存',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.white, fontSize: 18),
                      ),
                      color: kButtonColorPrimary,
                      splashColor: kButtonTextColorPrimary,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // onPressed: () async {
                      // // ドキュメント作成
                      // await Firestore.instance
                      //     .collection('users')
                      //     .document('id_abc')
                      //     .setData({'title': 'title', 'body': 'body'});
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FatherCharacterPage3(
                                type: typeData['type'],
                                type_detail: typeData['type_detail'],
                              ),
                            ));
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        ListTile(
                          leading: ClipOval(
                            child: Container(
                              color: Colors.greenAccent[400],
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Text(
                                  '１'.substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'タイプ１【改革する人】',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        ListTile(
                          leading: ClipOval(
                            child: Container(
                              color: Colors.redAccent,
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Text(
                                  '２'.substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'タイプ２【助ける人】',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        ListTile(
                          leading: ClipOval(
                            child: Container(
                              color: Colors.blueAccent,
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Text(
                                  '３'.substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'タイプ３【達成する人】',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        ListTile(
                          leading: ClipOval(
                            child: Container(
                              color: Colors.orangeAccent[400],
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Text(
                                  '４'.substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'タイプ４【個性を求める人】',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        ListTile(
                          leading: ClipOval(
                            child: Container(
                              color: Colors.lightGreenAccent[400],
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Text(
                                  '５'.substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'タイプ５【調べる人】',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        ListTile(
                          leading: ClipOval(
                            child: Container(
                              color: Colors.pinkAccent,
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Text(
                                  '６'.substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'タイプ６【信頼を求める人】',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        ListTile(
                          leading: ClipOval(
                            child: Container(
                              color: Colors.lightBlueAccent,
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Text(
                                  '７'.substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'タイプ７【熱中する人】',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        ListTile(
                          leading: ClipOval(
                            child: Container(
                              color: Colors.deepOrangeAccent[400],
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Text(
                                  '８'.substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'タイプ８【挑戦する人】',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        ListTile(
                          leading: ClipOval(
                            child: Container(
                              color: Colors.green[400],
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Text(
                                  '９'.substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'タイプ９【平和を好む人】',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.cyan,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_people,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Father',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pregnant_woman,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Mother',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_walk,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Student',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Teacher',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class FatherCharacterPage3 extends StatelessWidget {
  final String type;
  // ignore: non_constant_identifier_names
  final String type_detail;

  const FatherCharacterPage3({
    Key key,
    this.type,
    // ignore: non_constant_identifier_names
    this.type_detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final FirebaseUser user = userState.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お父さんページ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.cyan,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'ログイン情報：${user.email}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people),
              title: Text("お父さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("性格診断テスト"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("面談テーマルーレット"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("自己開示アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("お子さん別アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text("お母さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.directions_walk),
              title: Text("生徒さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("教師一覧ページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("ログアウト"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () async {
                  // ログアウト処理
                  // 内部で保持しているログイン情報等が初期化される
                  // （現時点ではログアウト時はこの処理を呼び出せばOK）
                  await FirebaseAuth.instance.signOut();
                  // ログイン画面に遷移＋画面を破棄
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '信頼関係づくりステージ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: Colors.cyan,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Text(
                    '性格診断テストⅠ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    '診断結果を保存しました',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        ListTile(
                          leading: ClipOval(
                            child: Container(
                              color: Colors.lightBlueAccent,
                              width: 48,
                              height: 48,
                              child: Center(
                                child: Text(
                                  type.substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            type,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.lightBlueAccent, width: 4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                  child: Text(
                                type_detail,
                                style: TextStyle(fontSize: 18),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  'より深く診断する',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
                color: Colors.purpleAccent,
                splashColor: kButtonTextColorPrimary,
                padding: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FatherCharacterPage4(),
                      ));
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10.0)),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  '面談テーマルーレットに進む',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
                color: kButtonColorPrimary,
                splashColor: kButtonTextColorPrimary,
                padding: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FatherInterviewRoulettePage1(),
                      ));
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.cyan,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_people,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Father',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pregnant_woman,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Mother',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_walk,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Student',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Teacher',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class FatherCharacterPage4 extends StatefulWidget {
  @override
  _FatherCharacterPage4State createState() => _FatherCharacterPage4State();
}

class _FatherCharacterPage4State extends State<FatherCharacterPage4> {
  num _choicesQ1;
  num _choicesQ2;
  num _choicesQ3;
  num _choicesQ4;
  num _choicesQ5;
  num _choicesQ6;
  num _choicesQ7;
  num _choicesQ8;
  num _choicesQ9;
  num _choicesQ10;
  num _choicesQ11;
  num _choicesQ12;
  num _choicesQ13;
  num _choicesQ14;
  num _choicesQ15;

  void _handleRadioButtonQ1(num choicesQ1) => setState(() {
        _choicesQ1 = choicesQ1;
      });
  void _handleRadioButtonQ2(num choicesQ2) => setState(() {
        _choicesQ2 = choicesQ2;
      });
  void _handleRadioButtonQ3(num choicesQ3) => setState(() {
        _choicesQ3 = choicesQ3;
      });
  void _handleRadioButtonQ4(num choicesQ4) => setState(() {
        _choicesQ4 = choicesQ4;
      });
  void _handleRadioButtonQ5(num choicesQ5) => setState(() {
        _choicesQ5 = choicesQ5;
      });
  void _handleRadioButtonQ6(num choicesQ6) => setState(() {
        _choicesQ6 = choicesQ6;
      });
  void _handleRadioButtonQ7(num choicesQ7) => setState(() {
        _choicesQ7 = choicesQ7;
      });
  void _handleRadioButtonQ8(num choicesQ8) => setState(() {
        _choicesQ8 = choicesQ8;
      });
  void _handleRadioButtonQ9(num choicesQ9) => setState(() {
        _choicesQ9 = choicesQ9;
      });
  void _handleRadioButtonQ10(num choicesQ10) => setState(() {
        _choicesQ10 = choicesQ10;
      });
  void _handleRadioButtonQ11(num choicesQ11) => setState(() {
        _choicesQ11 = choicesQ11;
      });
  void _handleRadioButtonQ12(num choicesQ12) => setState(() {
        _choicesQ12 = choicesQ12;
      });
  void _handleRadioButtonQ13(num choicesQ13) => setState(() {
        _choicesQ13 = choicesQ13;
      });
  void _handleRadioButtonQ14(num choicesQ14) => setState(() {
        _choicesQ14 = choicesQ14;
      });
  void _handleRadioButtonQ15(num choicesQ15) => setState(() {
        _choicesQ15 = choicesQ15;
      });

  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final FirebaseUser user = userState.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お父さんページ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: kButtonColorPrimary,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              // ユーザー情報を表示
              child: Text(
                'ログイン情報：${user.email}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people),
              title: Text("お父さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("性格診断テスト"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("面談テーマルーレット"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("自己開示アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("お子さん別アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text("お母さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.directions_walk),
              title: Text("生徒さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("教師一覧ページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("ログアウト"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () async {
                  // ログアウト処理
                  // 内部で保持しているログイン情報等が初期化される
                  // （現時点ではログアウト時はこの処理を呼び出せばOK）
                  await FirebaseAuth.instance.signOut();
                  // ログイン画面に遷移＋画面を破棄
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '信頼関係づくりステージ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: Colors.cyan,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Text(
                    '性格診断テストⅡ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'QUEST(簡易分類テスト)で絞り込んだ性格タイプの可能性を上げるために、TAS(タイプ別態度分類テスト)でさらに１５の質問を行います。これにより、信憑性のある性格診断を行うことができます。以下の各質問でご自身に最も合っているものに１つずつチェックを入れて、最後に送信ボタンを押してください。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q1】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '旅行したり様々な食べ物や人々、体験に出合うことが好きだ。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.grey[100],
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.greenAccent[400],
                                  value: 1,
                                  groupValue: _choicesQ1,
                                  onChanged: _handleRadioButtonQ1,
                                ),
                                Text(
                                  'まったくそうではない。',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            color: Colors.grey[100],
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.redAccent,
                                  value: 2,
                                  groupValue: _choicesQ1,
                                  onChanged: _handleRadioButtonQ1,
                                ),
                                Text(
                                  'めったにそうではない。',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            color: Colors.grey[100],
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.blueAccent,
                                  value: 3,
                                  groupValue: _choicesQ1,
                                  onChanged: _handleRadioButtonQ1,
                                ),
                                Text(
                                  '多少そうである。',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            color: Colors.grey[100],
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.orangeAccent,
                                  value: 4,
                                  groupValue: _choicesQ1,
                                  onChanged: _handleRadioButtonQ1,
                                ),
                                Text(
                                  '概してそうである。',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            color: Colors.grey[100],
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.lightGreenAccent,
                                  value: 5,
                                  groupValue: _choicesQ1,
                                  onChanged: _handleRadioButtonQ1,
                                ),
                                Text(
                                  'まさにそうである。',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q2】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'カレンダーはいつも予定でいっぱいになっている。そのようにしておきたい。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.grey[100],
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.greenAccent[400],
                                  value: 1,
                                  groupValue: _choicesQ2,
                                  onChanged: _handleRadioButtonQ2,
                                ),
                                Text(
                                  'まったくそうではない。',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            color: Colors.grey[100],
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.redAccent,
                                  value: 2,
                                  groupValue: _choicesQ2,
                                  onChanged: _handleRadioButtonQ2,
                                ),
                                Text(
                                  'めったにそうではない。',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            color: Colors.grey[100],
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.blueAccent,
                                  value: 3,
                                  groupValue: _choicesQ2,
                                  onChanged: _handleRadioButtonQ2,
                                ),
                                Text(
                                  '多少そうである。',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            color: Colors.grey[100],
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.orangeAccent,
                                  value: 4,
                                  groupValue: _choicesQ2,
                                  onChanged: _handleRadioButtonQ2,
                                ),
                                Text(
                                  '概してそうである。',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            color: Colors.grey[100],
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.lightGreenAccent,
                                  value: 5,
                                  groupValue: _choicesQ2,
                                  onChanged: _handleRadioButtonQ2,
                                ),
                                Text(
                                  'まさにそうである。',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '【Q3】',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '冒険を避けて安楽でいるよりも興奮と変化が重要である。ただし、快適さを拒むことはない。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 1,
                            groupValue: _choicesQ3,
                            onChanged: _handleRadioButtonQ3,
                          ),
                          Text(
                            'まったくそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: _choicesQ3,
                            onChanged: _handleRadioButtonQ3,
                          ),
                          Text(
                            'めったにそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 3,
                            groupValue: _choicesQ3,
                            onChanged: _handleRadioButtonQ3,
                          ),
                          Text(
                            '多少そうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.orangeAccent,
                            value: 4,
                            groupValue: _choicesQ3,
                            onChanged: _handleRadioButtonQ3,
                          ),
                          Text(
                            '概してそうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.lightGreenAccent,
                            value: 5,
                            groupValue: _choicesQ3,
                            onChanged: _handleRadioButtonQ3,
                          ),
                          Text(
                            'まさにそうである。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '【Q4】',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '頭の中でいつもおしゃべりしている。ときには一度に十のことを考えている感じがする。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 1,
                            groupValue: _choicesQ4,
                            onChanged: _handleRadioButtonQ4,
                          ),
                          Text(
                            'まったくそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: _choicesQ4,
                            onChanged: _handleRadioButtonQ4,
                          ),
                          Text(
                            'めったにそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 3,
                            groupValue: _choicesQ4,
                            onChanged: _handleRadioButtonQ4,
                          ),
                          Text(
                            '多少そうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.orangeAccent,
                            value: 4,
                            groupValue: _choicesQ4,
                            onChanged: _handleRadioButtonQ4,
                          ),
                          Text(
                            '概してそうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.lightGreenAccent,
                            value: 5,
                            groupValue: _choicesQ4,
                            onChanged: _handleRadioButtonQ4,
                          ),
                          Text(
                            'まさにそうである。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '【Q5】',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '絶対に耐えられないのは退屈することだ。自分が退屈な存在であると他の人に感じさせたくない。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 1,
                            groupValue: _choicesQ5,
                            onChanged: _handleRadioButtonQ5,
                          ),
                          Text(
                            'まったくそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: _choicesQ5,
                            onChanged: _handleRadioButtonQ5,
                          ),
                          Text(
                            'めったにそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 3,
                            groupValue: _choicesQ5,
                            onChanged: _handleRadioButtonQ5,
                          ),
                          Text(
                            '多少そうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.orangeAccent,
                            value: 4,
                            groupValue: _choicesQ5,
                            onChanged: _handleRadioButtonQ5,
                          ),
                          Text(
                            '概してそうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.lightGreenAccent,
                            value: 5,
                            groupValue: _choicesQ5,
                            onChanged: _handleRadioButtonQ5,
                          ),
                          Text(
                            'まさにそうである。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '【Q6】',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '恋愛関係にあるときは相手にかなり忠実である。だが、関係が終われば先に進む。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 1,
                            groupValue: _choicesQ6,
                            onChanged: _handleRadioButtonQ6,
                          ),
                          Text(
                            'まったくそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: _choicesQ6,
                            onChanged: _handleRadioButtonQ6,
                          ),
                          Text(
                            'めったにそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 3,
                            groupValue: _choicesQ6,
                            onChanged: _handleRadioButtonQ6,
                          ),
                          Text(
                            '多少そうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.orangeAccent,
                            value: 4,
                            groupValue: _choicesQ6,
                            onChanged: _handleRadioButtonQ6,
                          ),
                          Text(
                            '概してそうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.lightGreenAccent,
                            value: 5,
                            groupValue: _choicesQ6,
                            onChanged: _handleRadioButtonQ6,
                          ),
                          Text(
                            'まさにそうである。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '【Q7】',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '好奇心と冒険心がある。新しいものや面白いものを試してみるのは、友人関係の中で自分が最初だ。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 1,
                            groupValue: _choicesQ7,
                            onChanged: _handleRadioButtonQ7,
                          ),
                          Text(
                            'まったくそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: _choicesQ7,
                            onChanged: _handleRadioButtonQ7,
                          ),
                          Text(
                            'めったにそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 3,
                            groupValue: _choicesQ7,
                            onChanged: _handleRadioButtonQ7,
                          ),
                          Text(
                            '多少そうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.orangeAccent,
                            value: 4,
                            groupValue: _choicesQ7,
                            onChanged: _handleRadioButtonQ7,
                          ),
                          Text(
                            '概してそうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.lightGreenAccent,
                            value: 5,
                            groupValue: _choicesQ7,
                            onChanged: _handleRadioButtonQ7,
                          ),
                          Text(
                            'まさにそうである。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '【Q8】',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'していることが楽しくなくなったらやめる。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 1,
                            groupValue: _choicesQ8,
                            onChanged: _handleRadioButtonQ8,
                          ),
                          Text(
                            'まったくそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: _choicesQ8,
                            onChanged: _handleRadioButtonQ8,
                          ),
                          Text(
                            'めったにそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 3,
                            groupValue: _choicesQ8,
                            onChanged: _handleRadioButtonQ8,
                          ),
                          Text(
                            '多少そうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.orangeAccent,
                            value: 4,
                            groupValue: _choicesQ8,
                            onChanged: _handleRadioButtonQ8,
                          ),
                          Text(
                            '概してそうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.lightGreenAccent,
                            value: 5,
                            groupValue: _choicesQ8,
                            onChanged: _handleRadioButtonQ8,
                          ),
                          Text(
                            'まさにそうである。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '【Q9】',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '単に「楽しい人」ということはない。シリアスで暗い側面さえある。ただ、あまりそちらには行きたくない。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 1,
                            groupValue: _choicesQ9,
                            onChanged: _handleRadioButtonQ9,
                          ),
                          Text(
                            'まったくそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: _choicesQ9,
                            onChanged: _handleRadioButtonQ9,
                          ),
                          Text(
                            'めったにそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 3,
                            groupValue: _choicesQ9,
                            onChanged: _handleRadioButtonQ9,
                          ),
                          Text(
                            '多少そうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.orangeAccent,
                            value: 4,
                            groupValue: _choicesQ9,
                            onChanged: _handleRadioButtonQ9,
                          ),
                          Text(
                            '概してそうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.lightGreenAccent,
                            value: 5,
                            groupValue: _choicesQ9,
                            onChanged: _handleRadioButtonQ9,
                          ),
                          Text(
                            'まさにそうである。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '【Q10】',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '大きな構想を描く方が得意で、詳細を詰めるのはあまりうまくない。新しいアイデアを出す方が、それを遂行することに関わるよりも楽しい。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 1,
                            groupValue: _choicesQ10,
                            onChanged: _handleRadioButtonQ10,
                          ),
                          Text(
                            'まったくそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: _choicesQ10,
                            onChanged: _handleRadioButtonQ10,
                          ),
                          Text(
                            'めったにそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 3,
                            groupValue: _choicesQ10,
                            onChanged: _handleRadioButtonQ10,
                          ),
                          Text(
                            '多少そうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.orangeAccent,
                            value: 4,
                            groupValue: _choicesQ10,
                            onChanged: _handleRadioButtonQ10,
                          ),
                          Text(
                            '概してそうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.lightGreenAccent,
                            value: 5,
                            groupValue: _choicesQ10,
                            onChanged: _handleRadioButtonQ10,
                          ),
                          Text(
                            'まさにそうである。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '【Q11】',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '本当に何かを欲しいとき、いつも手に入れる方法を見つける。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 1,
                            groupValue: _choicesQ11,
                            onChanged: _handleRadioButtonQ11,
                          ),
                          Text(
                            'まったくそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: _choicesQ11,
                            onChanged: _handleRadioButtonQ11,
                          ),
                          Text(
                            'めったにそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 3,
                            groupValue: _choicesQ11,
                            onChanged: _handleRadioButtonQ11,
                          ),
                          Text(
                            '多少そうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.orangeAccent,
                            value: 4,
                            groupValue: _choicesQ11,
                            onChanged: _handleRadioButtonQ11,
                          ),
                          Text(
                            '概してそうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.lightGreenAccent,
                            value: 5,
                            groupValue: _choicesQ11,
                            onChanged: _handleRadioButtonQ11,
                          ),
                          Text(
                            'まさにそうである。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '【Q12】',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'ときどき落ち込むできごとがあるが、すぐにまた立ち直る。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 1,
                            groupValue: _choicesQ12,
                            onChanged: _handleRadioButtonQ12,
                          ),
                          Text(
                            'まったくそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: _choicesQ12,
                            onChanged: _handleRadioButtonQ12,
                          ),
                          Text(
                            'めったにそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 3,
                            groupValue: _choicesQ12,
                            onChanged: _handleRadioButtonQ12,
                          ),
                          Text(
                            '多少そうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.orangeAccent,
                            value: 4,
                            groupValue: _choicesQ12,
                            onChanged: _handleRadioButtonQ12,
                          ),
                          Text(
                            '概してそうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.lightGreenAccent,
                            value: 5,
                            groupValue: _choicesQ12,
                            onChanged: _handleRadioButtonQ12,
                          ),
                          Text(
                            'まさにそうである。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '【Q13】',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '私の主な問題のひとつは、気が散りやすく散漫になることだ。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 1,
                            groupValue: _choicesQ13,
                            onChanged: _handleRadioButtonQ13,
                          ),
                          Text(
                            'まったくそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: _choicesQ13,
                            onChanged: _handleRadioButtonQ13,
                          ),
                          Text(
                            'めったにそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 3,
                            groupValue: _choicesQ13,
                            onChanged: _handleRadioButtonQ13,
                          ),
                          Text(
                            '多少そうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.orangeAccent,
                            value: 4,
                            groupValue: _choicesQ13,
                            onChanged: _handleRadioButtonQ13,
                          ),
                          Text(
                            '概してそうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.lightGreenAccent,
                            value: 5,
                            groupValue: _choicesQ13,
                            onChanged: _handleRadioButtonQ13,
                          ),
                          Text(
                            'まさにそうである。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '【Q14】',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'おそらくお金を使いすぎる傾向がある。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 1,
                            groupValue: _choicesQ14,
                            onChanged: _handleRadioButtonQ14,
                          ),
                          Text(
                            'まったくそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: _choicesQ14,
                            onChanged: _handleRadioButtonQ14,
                          ),
                          Text(
                            'めったにそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 3,
                            groupValue: _choicesQ14,
                            onChanged: _handleRadioButtonQ14,
                          ),
                          Text(
                            '多少そうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.orangeAccent,
                            value: 4,
                            groupValue: _choicesQ14,
                            onChanged: _handleRadioButtonQ14,
                          ),
                          Text(
                            '概してそうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.lightGreenAccent,
                            value: 5,
                            groupValue: _choicesQ14,
                            onChanged: _handleRadioButtonQ14,
                          ),
                          Text(
                            'まさにそうである。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '【Q15】',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '私が行こうとしているところに行きたいと思ってくれるのなら、他の人たちが一緒に来てくれるのは素晴らしいことである。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.greenAccent[400],
                            value: 1,
                            groupValue: _choicesQ15,
                            onChanged: _handleRadioButtonQ15,
                          ),
                          Text(
                            'まったくそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: _choicesQ15,
                            onChanged: _handleRadioButtonQ15,
                          ),
                          Text(
                            'めったにそうではない。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.blueAccent,
                            value: 3,
                            groupValue: _choicesQ15,
                            onChanged: _handleRadioButtonQ15,
                          ),
                          Text(
                            '多少そうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.orangeAccent,
                            value: 4,
                            groupValue: _choicesQ15,
                            onChanged: _handleRadioButtonQ15,
                          ),
                          Text(
                            '概してそうである。',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.lightGreenAccent,
                            value: 5,
                            groupValue: _choicesQ15,
                            onChanged: _handleRadioButtonQ15,
                          ),
                          Text(
                            'まさにそうである。',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  '送信',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
                color: kButtonColorPrimary,
                splashColor: kButtonTextColorPrimary,
                padding: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // 引数から選択肢を渡す
                        builder: (context) => FatherCharacterPage5(
                          choicesQ1: _choicesQ1,
                          choicesQ2: _choicesQ2,
                          choicesQ3: _choicesQ3,
                          choicesQ4: _choicesQ4,
                          choicesQ5: _choicesQ5,
                          choicesQ6: _choicesQ6,
                          choicesQ7: _choicesQ7,
                          choicesQ8: _choicesQ8,
                          choicesQ9: _choicesQ9,
                          choicesQ10: _choicesQ10,
                          choicesQ11: _choicesQ11,
                          choicesQ12: _choicesQ12,
                          choicesQ13: _choicesQ13,
                          choicesQ14: _choicesQ14,
                          choicesQ15: _choicesQ15,
                        ),
                      ));
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.cyan,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_people,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Father',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pregnant_woman,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Mother',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_walk,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Student',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Teacher',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class FatherCharacterPage5 extends StatelessWidget {
  // 引数から選択肢を受け取る
  FatherCharacterPage5({
    this.choicesQ1,
    this.choicesQ2,
    this.choicesQ3,
    this.choicesQ4,
    this.choicesQ5,
    this.choicesQ6,
    this.choicesQ7,
    this.choicesQ8,
    this.choicesQ9,
    this.choicesQ10,
    this.choicesQ11,
    this.choicesQ12,
    this.choicesQ13,
    this.choicesQ14,
    this.choicesQ15,
  }) : this.totalPoint = (choicesQ1 +
                choicesQ2 +
                choicesQ3 +
                choicesQ4 +
                choicesQ5 +
                choicesQ6 +
                choicesQ7 +
                choicesQ8 +
                choicesQ9 +
                choicesQ10 +
                choicesQ11 +
                choicesQ12 +
                choicesQ13 +
                choicesQ14 +
                choicesQ15) *
            1.33;

  final num choicesQ1;
  final num choicesQ2;
  final num choicesQ3;
  final num choicesQ4;
  final num choicesQ5;
  final num choicesQ6;
  final num choicesQ7;
  final num choicesQ8;
  final num choicesQ9;
  final num choicesQ10;
  final num choicesQ11;
  final num choicesQ12;
  final num choicesQ13;
  final num choicesQ14;
  final num choicesQ15;
  final num totalPoint;

  // FatherCharacterPage5({
  //   Key key,
  //   @required this.choicesQ1,
  //   @required this.choicesQ2,
  //   @required this.choicesQ3,
  //   @required this.choicesQ4,
  //   @required this.choicesQ5,
  //   @required this.choicesQ6,
  //   @required this.choicesQ7,
  //   @required this.choicesQ8,
  //   @required this.choicesQ9,
  //   @required this.choicesQ10,
  //   @required this.choicesQ11,
  //   @required this.choicesQ12,
  //   @required this.choicesQ13,
  //   @required this.choicesQ14,
  //   @required this.choicesQ15,
  // }) : super(key: key);

  // FatherCharacterPage5.a(
  //     num choicesQ1,
  //     num choicesQ2,
  //     num choicesQ3,
  //     num choicesQ4,
  //     num choicesQ5,
  //     num choicesQ6,
  //     num choicesQ7,
  //     num choicesQ8,
  //     num choicesQ9,
  //     num choicesQ10,
  //     num choicesQ11,
  //     num choicesQ12,
  //     num choicesQ13,
  //     num choicesQ14,
  //     num choicesQ15)
  //     : this.choicesQ1 = choicesQ1,
  //       this.choicesQ2 = choicesQ2,
  //       this.choicesQ3 = choicesQ3,
  //       this.choicesQ4 = choicesQ4,
  //       this.choicesQ5 = choicesQ5,
  //       this.choicesQ6 = choicesQ6,
  //       this.choicesQ7 = choicesQ7,
  //       this.choicesQ8 = choicesQ8,
  //       this.choicesQ9 = choicesQ9,
  //       this.choicesQ10 = choicesQ10,
  //       this.choicesQ11 = choicesQ11,
  //       this.choicesQ12 = choicesQ12,
  //       this.choicesQ13 = choicesQ13,
  //       this.choicesQ14 = choicesQ14,
  //       this.choicesQ15 = choicesQ15;
  //
  // final double totalPoint = (choicesQ1 +
  //         choicesQ2 +
  //         choicesQ3 +
  //         choicesQ4 +
  //         choicesQ5 +
  //         choicesQ6 +
  //         choicesQ7 +
  //         choicesQ8 +
  //         choicesQ9 +
  //         choicesQ10 +
  //         choicesQ11 +
  //         choicesQ12 +
  //         choicesQ13 +
  //         choicesQ14 +
  //         choicesQ15) *
  //     1.33;
  //
  // FatherCharacterPage5.b(
  //     {this.choicesQ1,
  //     this.choicesQ2,
  //     this.choicesQ3,
  //     this.choicesQ4,
  //     this.choicesQ5,
  //     this.choicesQ6,
  //     this.choicesQ7,
  //     this.choicesQ8,
  //     this.choicesQ9,
  //     this.choicesQ10,
  //     this.choicesQ11,
  //     this.choicesQ12,
  //     this.choicesQ13,
  //     this.choicesQ14,
  //     this.choicesQ15});

  // テキストフィールドのステートを管理
  // final _stateController = TextEditingController();
  //
  // @override
  // void initState() {
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   this._stateController.dispose();
  //   super.dispose();
  // }

  // SaveボタンがおされたらFirestoreに値を保存
  // void saveOnPressed() {
  //   Firestore.instance
  //       .document("sample/sandwichData")
  //       .updateData({"hotDogStatus": _stateController.text})
  //       .then((value) => print("success"))
  //       .catchError((value) => print("error $value"));
  // }

  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final FirebaseUser user = userState.user;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お父さんページ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.cyan,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'ログイン情報：${user.email}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people),
              title: Text("お父さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("性格診断テスト"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("面談テーマルーレット"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("自己開示アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("お子さん別アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text("お母さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.directions_walk),
              title: Text("生徒さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("教師一覧ページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("ログアウト"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () async {
                  // ログアウト処理
                  // 内部で保持しているログイン情報等が初期化される
                  // （現時点ではログアウト時はこの処理を呼び出せばOK）
                  await FirebaseAuth.instance.signOut();
                  // ログイン画面に遷移＋画面を破棄
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '信頼関係づくりステージ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: Colors.cyan,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Text(
                    '性格診断テストⅡ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    'タイプ７に関するTASの診断結果',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  BatteryLevelIndicator(),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  DataTable(columns: [
                    DataColumn(label: Text('割合')),
                    DataColumn(label: Text('タイプ７である可能性')),
                  ], rows: [
                    DataRow(cells: [
                      DataCell(Text('0〜20%')),
                      DataCell(Text('あなたは自己主張型(タイプ３・７・\n８)ではないでしょう')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('21〜40%')),
                      DataCell(Text('あなたはおそらくタイプ７ではない\nでしょう')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('41〜60%')),
                      DataCell(Text('あなたはおそらくタイプ７の側面を\n持つか、タイプ７の親を持ちます')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('61〜80%')),
                      DataCell(Text('あなたはタイプ７的要素を持ってい\nる可能性が高いでしょう')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('81〜100%')),
                      DataCell(Text('あなたはタイプ７です')),
                    ])
                  ]),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    '※タイプ７は、２・３・４と間違えやすい傾向があります',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  // Card(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(16),
                  //   ),
                  //   child: Container(
                  //     padding: EdgeInsets.all(16),
                  //     child: Column(
                  //       children: [
                  //         Container(
                  //           color: Colors.grey[100],
                  //           child: ListTile(
                  //             leading: Text('0〜20%'),
                  //             title: Text('あなたは自己主張型（タイプ３・７・８）ではないでしょう'),
                  //           ),
                  //         ),
                  //         SizedBox(height: 8),
                  //         Container(
                  //           color: Colors.grey[100],
                  //           child: ListTile(
                  //             leading: Text('21〜40%'),
                  //             title: Text('あなたはおそらくタイプ７ではないでしょう'),
                  //           ),
                  //         ),
                  //         SizedBox(height: 8),
                  //         Container(
                  //           color: Colors.grey[100],
                  //           child: ListTile(
                  //             leading: Text('41〜60%'),
                  //             title: Text(
                  //                 'あなたはおそらくタイプ７の側面を持っているか、タイプ７の親を持っているでしょう'),
                  //           ),
                  //         ),
                  //         SizedBox(height: 8),
                  //         Container(
                  //           color: Colors.grey[100],
                  //           child: ListTile(
                  //             leading: Text('61〜80%'),
                  //             title: Text('あなたはタイプ７的要素を持っている可能性が高いでしょう'),
                  //           ),
                  //         ),
                  //         SizedBox(height: 8),
                  //         Container(
                  //           color: Colors.grey[100],
                  //           child: ListTile(
                  //             leading: Text('81〜100%'),
                  //             title: Text('あなたはタイプ７です'),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      child: Text(
                        '保存',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.white, fontSize: 18),
                      ),
                      color: kButtonColorPrimary,
                      splashColor: kButtonTextColorPrimary,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // onPressed: () async {
                      // // ドキュメント作成
                      // await Firestore.instance
                      //     .collection('users')
                      //     .document('id_abc')
                      //     .setData({'title': 'title', 'body': 'body'});
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FatherCharacterPage6(
                                  // type: typeData['type'],
                                  // type_detail: typeData['type_detail'],
                                  ),
                            ));
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.cyan,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_people,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Father',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pregnant_woman,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Mother',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_walk,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Student',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Teacher',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

// インジケータ
class _BatteryLevelIndicatorPainter extends CustomPainter {
  final double percentage; // バッテリーレベルの割合
  final double textCircleRadius; // 内側に表示される白丸の半径

  _BatteryLevelIndicatorPainter({
    @required this.percentage,
    @required this.textCircleRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 1; i < (360 * percentage); i += 5) {
      final per = i / 360.0;
      // 割合（0~1.0）からグラデーション色に変換
      final color = ColorTween(
        begin: kColorIndicatorBegin,
        end: kColorIndicatorEnd,
      ).lerp(per);
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4;

      final spaceLen = 16; // 円とゲージ間の長さ
      final lineLen = 24; // ゲージの長さ
      final angle = (2 * pi * per) - (pi / 2); // 0時方向から開始するため-90度ずらす

      // 円の中心座標
      final offset0 = Offset(size.width * 0.5, size.height * 0.5);
      // 線の内側部分の座標
      final offset1 = offset0.translate(
        (textCircleRadius + spaceLen) * cos(angle),
        (textCircleRadius + spaceLen) * sin(angle),
      );
      // 線の外側部分の座標
      final offset2 = offset1.translate(
        lineLen * cos(angle),
        lineLen * sin(angle),
      );

      canvas.drawLine(offset1, offset2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BatteryLevelIndicator extends StatelessWidget {
  final percentage = 0.54;
  final size = 164.0;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BatteryLevelIndicatorPainter(
        percentage: percentage,
        textCircleRadius: size * 0.5,
      ),
      child: Container(
        padding: const EdgeInsets.all(64),
        child: Material(
          color: Colors.white,
          elevation: kElevation,
          borderRadius: BorderRadius.circular(size * 0.5),
          child: Container(
            width: size,
            height: size,
            child: Center(
              child: Text(
                '${percentage * 100}%',
                style: TextStyle(color: kColorPink, fontSize: 48),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FatherCharacterPage6 extends StatelessWidget {
  // final String type;
  // // ignore: non_constant_identifier_names
  // final String type_detail;
  //
  // const FatherCharacterPage3({
  //   Key key,
  //   this.type,
  //   // ignore: non_constant_identifier_names
  //   this.type_detail,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final FirebaseUser user = userState.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お父さんページ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.cyan,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'ログイン情報：${user.email}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people),
              title: Text("お父さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("性格診断テスト"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("面談テーマルーレット"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("自己開示アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("お子さん別アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text("お母さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.directions_walk),
              title: Text("生徒さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("教師一覧ページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("ログアウト"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () async {
                  // ログアウト処理
                  // 内部で保持しているログイン情報等が初期化される
                  // （現時点ではログアウト時はこの処理を呼び出せばOK）
                  await FirebaseAuth.instance.signOut();
                  // ログイン画面に遷移＋画面を破棄
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '信頼関係づくりステージ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: Colors.cyan,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Text(
                    '性格診断テストⅡ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    '診断結果を保存しました',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  BatteryLevelIndicator(),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  '面談テーマルーレットに進む',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
                color: kButtonColorPrimary,
                splashColor: kButtonTextColorPrimary,
                padding: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FatherInterviewRoulettePage1(),
                      ));
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  ListTile(
                    leading: ClipOval(
                      child: Container(
                        color: Colors.greenAccent[400],
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Text(
                            '１'.substring(0, 1),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'タイプ１【改革する人】',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  ListTile(
                    leading: ClipOval(
                      child: Container(
                        color: Colors.redAccent,
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Text(
                            '２'.substring(0, 1),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'タイプ２【助ける人】',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  ListTile(
                    leading: ClipOval(
                      child: Container(
                        color: Colors.blueAccent,
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Text(
                            '３'.substring(0, 1),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'タイプ３【達成する人】',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  ListTile(
                    leading: ClipOval(
                      child: Container(
                        color: Colors.orangeAccent[400],
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Text(
                            '４'.substring(0, 1),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'タイプ４【個性を求める人】',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  ListTile(
                    leading: ClipOval(
                      child: Container(
                        color: Colors.lightGreenAccent[400],
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Text(
                            '５'.substring(0, 1),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'タイプ５【調べる人】',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  ListTile(
                    leading: ClipOval(
                      child: Container(
                        color: Colors.pinkAccent,
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Text(
                            '６'.substring(0, 1),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'タイプ６【信頼を求める人】',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  ListTile(
                    leading: ClipOval(
                      child: Container(
                        color: Colors.lightBlueAccent,
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Text(
                            '７'.substring(0, 1),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'タイプ７【熱中する人】',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  ListTile(
                    leading: ClipOval(
                      child: Container(
                        color: Colors.deepOrangeAccent[400],
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Text(
                            '８'.substring(0, 1),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'タイプ８【挑戦する人】',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  ListTile(
                    leading: ClipOval(
                      child: Container(
                        color: Colors.green[400],
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Text(
                            '９'.substring(0, 1),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'タイプ９【平和を好む人】',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.cyan,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_people,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Father',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pregnant_woman,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Mother',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_walk,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Student',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Teacher',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class FatherInterviewRoulettePage1 extends StatefulWidget {
  @override
  _FatherInterviewRoulettePage1State createState() =>
      _FatherInterviewRoulettePage1State();
}

class _FatherInterviewRoulettePage1State
    extends State<FatherInterviewRoulettePage1> {
  String _theme;

  //配列からランダムに文字を選ぶ関数
  choices() {
    setState(() {
      List<String> words = [
        '子どもと同じくらいの歳の頃は、どんなことをしていたか',
        '両親との関係性',
        '学生時代の人生の分かれ道とは',
        '学生時代の恋愛について',
        'ずっと大切にしたい幸せな思い出について',
        '大人になって一番影響を与えてくれた人について',
        '人生で最高だと思った旅について',
        '人生で一番誇らしく思うこと',
        'いつも子どもに言いたかったけれど、なかなか言えなかったこと',
        '一番後悔していること',
        '人生でもっと時間を割くべきだったと思うこと',
        'もしすべてやり直せるとしたら、同じキャリアを選ぶか',
      ];
      _theme = words[Random().nextInt(words.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final FirebaseUser user = userState.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お父さんページ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.cyan,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'ログイン情報：${user.email}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people),
              title: Text("お父さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("性格診断テスト"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("面談テーマルーレット"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("自己開示アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("お子さん別アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text("お母さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.directions_walk),
              title: Text("生徒さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("教師一覧ページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("ログアウト"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () async {
                  // ログアウト処理
                  // 内部で保持しているログイン情報等が初期化される
                  // （現時点ではログアウト時はこの処理を呼び出せばOK）
                  await FirebaseAuth.instance.signOut();
                  // ログイン画面に遷移＋画面を破棄
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '信頼関係づくりステージ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: Colors.cyan,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Text(
                    '面談テーマルーレット',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'ここでは、面談当日のテーマをランダムに決定します。ルーレット開始ボタンを押した後、保存ボタンを押してください。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                          child: Text(
                            'ルーレット開始',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.white, fontSize: 18),
                          ),
                          color: kButtonColorPrimary,
                          splashColor: kButtonTextColorPrimary,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          onPressed: () {
                            choices();
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 30.0)),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: _theme,
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  '保存',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
                color: kButtonColorPrimary,
                splashColor: kButtonTextColorPrimary,
                padding: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                // onPressed: () async {
                // // ドキュメント作成
                // await Firestore.instance
                //     .collection('users')
                //     .document('id_abc')
                //     .setData({'title': 'title', 'body': 'body'});
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FatherInterviewRoulettePage2(theme: _theme),
                      ));
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.cyan,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_people,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Father',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pregnant_woman,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Mother',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_walk,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Student',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Teacher',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class FatherInterviewRoulettePage2 extends StatelessWidget {
  const FatherInterviewRoulettePage2({
    Key key,
    @required this.theme,
  }) : super(key: key);

  final String theme;

  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final FirebaseUser user = userState.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お父さんページ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.cyan,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'ログイン情報：${user.email}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people),
              title: Text("お父さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("性格診断テスト"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("面談テーマルーレット"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("自己開示アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("お子さん別アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text("お母さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.directions_walk),
              title: Text("生徒さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("教師一覧ページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("ログアウト"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () async {
                  // ログアウト処理
                  // 内部で保持しているログイン情報等が初期化される
                  // （現時点ではログアウト時はこの処理を呼び出せばOK）
                  await FirebaseAuth.instance.signOut();
                  // ログイン画面に遷移＋画面を破棄
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '信頼関係づくりステージ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: Colors.cyan,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Text(
                    '面談テーマルーレット',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    '結果を保存しました',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: theme,
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '面談当日、上記テーマについて５分程度でお話できるようにご準備をお願いいたします。信頼関係づくりステージは以上になります。お時間のある方は、成長促進ステージへお進みください。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  '自己開示アンケートに進む',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
                color: kButtonColorPrimary,
                splashColor: kButtonTextColorPrimary,
                padding: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FatherSelfDisclosurePage1(),
                      ));
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.cyan,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_people,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Father',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pregnant_woman,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Mother',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_walk,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Student',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Teacher',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class FatherSelfDisclosurePage1 extends StatefulWidget {
  @override
  _FatherSelfDisclosurePage1State createState() =>
      _FatherSelfDisclosurePage1State();
}

class _FatherSelfDisclosurePage1State extends State<FatherSelfDisclosurePage1> {
  String _contentsQ1 = '';
  String _contentsQ2 = '';
  String _contentsQ3 = '';
  String _contentsQ4 = '';
  String _contentsQ5 = '';
  String _contentsQ6 = '';
  String _contentsQ7 = '';

  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final FirebaseUser user = userState.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お父さんページ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.cyan,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'ログイン情報：${user.email}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people),
              title: Text("お父さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("性格診断テスト"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("面談テーマルーレット"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("自己開示アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("お子さん別アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text("お母さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.directions_walk),
              title: Text("生徒さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("教師一覧ページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("ログアウト"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () async {
                  // ログアウト処理
                  // 内部で保持しているログイン情報等が初期化される
                  // （現時点ではログアウト時はこの処理を呼び出せばOK）
                  await FirebaseAuth.instance.signOut();
                  // ログイン画面に遷移＋画面を破棄
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '成長促進ステージ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: Colors.cyan,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Text(
                    '自己開示アンケート',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'ここでは、さらなる相互理解を深めるため、保護者様自身の自己開示をアンケート形式でお願いします。可能な限りのご回答で構いません。入力後、送信ボタンを押してください。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q1】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '現在のお仕事の内容を簡単に教えてください。現在お仕事をされていない場合は、過去のお仕事の内容をご記入ください。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                              labelText: 'お仕事の内容',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                          onChanged: (String value) {
                            setState(() {
                              _contentsQ1 = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q2】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '何をしているときが一番楽しいか教えてください。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                              labelText: '楽しい瞬間',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                          onChanged: (String value) {
                            setState(() {
                              _contentsQ2 = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q3】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '好きな芸能人・歌手・スポーツ選手などはいますか。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                              labelText: '芸能人・歌手・スポーツ選手など',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                          onChanged: (String value) {
                            setState(() {
                              _contentsQ3 = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q4】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '学生時代、部活動・習い事は何をしていましたか(いくつかある場合はすべて答えてください)。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                              labelText: '部活動・習い事',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                          onChanged: (String value) {
                            setState(() {
                              _contentsQ4 = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q5】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '学生時代、将来やりたいことは何でしたか(いくつかある場合はすべて答えてください)。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                              labelText: '学生時代の夢',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                          onChanged: (String value) {
                            setState(() {
                              _contentsQ5 = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q6】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ご自分の長所は何だと思いますか。',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                              labelText: '長所',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                          onChanged: (String value) {
                            setState(() {
                              _contentsQ6 = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q7】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ご自分の短所は何だと思いますか。',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                              labelText: '短所',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                          onChanged: (String value) {
                            setState(() {
                              _contentsQ7 = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  '送信',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
                color: kButtonColorPrimary,
                splashColor: kButtonTextColorPrimary,
                padding: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // 引数から選択肢を渡す
                        builder: (context) => FatherSelfDisclosurePage2(
                          contentsQ1: _contentsQ1,
                          contentsQ2: _contentsQ2,
                          contentsQ3: _contentsQ3,
                          contentsQ4: _contentsQ4,
                          contentsQ5: _contentsQ5,
                          contentsQ6: _contentsQ6,
                          contentsQ7: _contentsQ7,
                        ),
                      ));
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.cyan,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_people,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Father',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pregnant_woman,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Mother',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_walk,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Student',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Teacher',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class FatherSelfDisclosurePage2 extends StatelessWidget {
  final String contentsQ1;
  final String contentsQ2;
  final String contentsQ3;
  final String contentsQ4;
  final String contentsQ5;
  final String contentsQ6;
  final String contentsQ7;

  const FatherSelfDisclosurePage2({
    Key key,
    this.contentsQ1,
    this.contentsQ2,
    this.contentsQ3,
    this.contentsQ4,
    this.contentsQ5,
    this.contentsQ6,
    this.contentsQ7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final FirebaseUser user = userState.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お父さんページ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.cyan,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'ログイン情報：${user.email}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people),
              title: Text("お父さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("性格診断テスト"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("面談テーマルーレット"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("自己開示アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("お子さん別アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text("お母さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.directions_walk),
              title: Text("生徒さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("教師一覧ページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("ログアウト"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () async {
                  // ログアウト処理
                  // 内部で保持しているログイン情報等が初期化される
                  // （現時点ではログアウト時はこの処理を呼び出せばOK）
                  await FirebaseAuth.instance.signOut();
                  // ログイン画面に遷移＋画面を破棄
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '成長促進ステージ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: Colors.cyan,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Text(
                    '自己開示アンケート',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '以下の内容でよろしければ保存ボタンを押してください。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q1】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '現在のお仕事の内容を簡単に教えてください。現在お仕事をされていない場合は、過去のお仕事の内容をご記入ください。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ1,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q2】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '何をしているときが一番楽しいか教えてください。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ2,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q3】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '好きな芸能人・歌手・スポーツ選手などはいますか。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ3,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q4】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '学生時代、部活動・習い事は何をしていましたか(いくつかある場合はすべて答えてください)。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ4,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q5】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '学生時代、将来やりたいことは何でしたか(いくつかある場合はすべて答えてください)。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ5,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q6】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ご自分の長所は何だと思いますか。',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ6,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q7】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ご自分の短所は何だと思いますか。',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ7,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  '保存',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
                color: kButtonColorPrimary,
                splashColor: kButtonTextColorPrimary,
                padding: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                // onPressed: () async {
                // // ドキュメント作成
                // await Firestore.instance
                //     .collection('users')
                //     .document('id_abc')
                //     .setData({'title': 'title', 'body': 'body'});
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FatherSelfDisclosurePage3(
                          contentsQ1: contentsQ1,
                          contentsQ2: contentsQ2,
                          contentsQ3: contentsQ3,
                          contentsQ4: contentsQ4,
                          contentsQ5: contentsQ5,
                          contentsQ6: contentsQ6,
                          contentsQ7: contentsQ7,
                        ),
                      ));
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.cyan,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_people,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Father',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pregnant_woman,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Mother',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_walk,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Student',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Teacher',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class FatherSelfDisclosurePage3 extends StatelessWidget {
  const FatherSelfDisclosurePage3({
    Key key,
    @required this.contentsQ1,
    @required this.contentsQ2,
    @required this.contentsQ3,
    @required this.contentsQ4,
    @required this.contentsQ5,
    @required this.contentsQ6,
    @required this.contentsQ7,
  }) : super(key: key);

  final String contentsQ1;
  final String contentsQ2;
  final String contentsQ3;
  final String contentsQ4;
  final String contentsQ5;
  final String contentsQ6;
  final String contentsQ7;

  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final FirebaseUser user = userState.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お父さんページ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.cyan,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'ログイン情報：${user.email}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people),
              title: Text("お父さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("性格診断テスト"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("面談テーマルーレット"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("自己開示アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 57.0)),
                  Text("お子さん別アンケート"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text("お母さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.directions_walk),
              title: Text("生徒さんページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("教師一覧ページ - HOME"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("ログアウト"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () async {
                  // ログアウト処理
                  // 内部で保持しているログイン情報等が初期化される
                  // （現時点ではログアウト時はこの処理を呼び出せばOK）
                  await FirebaseAuth.instance.signOut();
                  // ログイン画面に遷移＋画面を破棄
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '成長促進ステージ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: Colors.cyan,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Text(
                    '自己開示アンケート',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    'アンケート内容を保存しました。',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q1】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '現在のお仕事の内容を簡単に教えてください。現在お仕事をされていない場合は、過去のお仕事の内容をご記入ください。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ1,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q2】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '何をしているときが一番楽しいか教えてください。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ2,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q3】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '好きな芸能人・歌手・スポーツ選手などはいますか。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ3,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q4】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '学生時代、部活動・習い事は何をしていましたか(いくつかある場合はすべて答えてください)。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ4,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q5】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '学生時代、将来やりたいことは何でしたか(いくつかある場合はすべて答えてください)。',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ5,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q6】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ご自分の長所は何だと思いますか。',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ6,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '【Q7】',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ご自分の短所は何だと思いますか。',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contentsQ7,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  'お子さん別アンケートに進む',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
                color: kButtonColorPrimary,
                splashColor: kButtonTextColorPrimary,
                padding: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.cyan,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_people,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Father',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pregnant_woman,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Mother',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_walk,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Student',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Teacher',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
