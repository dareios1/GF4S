import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Color kAccentColor = Color(0xFFFE7C64);
const Color kBackgroundColor = Color(0xFF19283D);
const Color kTextColorPrimary = Color(0xFFECEFF1);
const Color kTextColorSecondary = Color(0xFFB0BEC5);
const Color kButtonColorPrimary = Color(0xFFECEFF1);
const Color kButtonTextColorPrimary = Color(0xFF455A64);
const Color kIconColor = Color(0xFF455A64);

void main() {
  runApp(MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// 更新可能なデータ
class UserState extends ChangeNotifier {
  FirebaseUser user;
  void setUser(FirebaseUser newUser) {
    user = newUser;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  // ユーザーの情報を管理するデータ
  final UserState userState = UserState();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserState>.value(
      value: userState,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KAIG',
        theme: ThemeData.dark().copyWith(
          accentColor: kAccentColor,
        ),
        home: LoginPage(),
      ),
    );
  }
}

// ログイン画面
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ヘッダー
              _Header(),
              // フォーム
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'E-mail'),
                      onChanged: (String value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(height: 48),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      onChanged: (String value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    SizedBox(height: 24),
                    Text(
                      infoText,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: kTextColorSecondary),
                    ),
                    SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        color: kButtonColorPrimary,
                        splashColor: kButtonTextColorPrimary,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () async {
                          try {
                            // メール/パスワードでユーザー登録
                            final FirebaseAuth auth = FirebaseAuth.instance;
                            final AuthResult result =
                                await auth.createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            final FirebaseUser user = result.user;
                            // ユーザー情報を更新
                            userState.setUser(user);
                            // ユーザー登録に成功した場合
                            // チャット画面に遷移＋ログイン画面を破棄
                            await Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                                return HomePage();
                              }),
                            );
                          } catch (e) {
                            // ユーザー登録に失敗した場合
                            setState(() {
                              infoText = "登録に失敗しました：${e.message}";
                            });
                          }
                        },
                        child: Text(
                          'Register',
                          style: Theme.of(context).textTheme.button.copyWith(
                              color: kButtonTextColorPrimary, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'OR',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: kTextColorSecondary),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        color: kButtonColorPrimary,
                        splashColor: kButtonTextColorPrimary,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () async {
                          try {
                            // メール/パスワードでログイン
                            final FirebaseAuth auth = FirebaseAuth.instance;
                            final AuthResult result =
                                await auth.signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            final FirebaseUser user = result.user;
                            // ユーザー情報を更新
                            userState.setUser(user);
                            // ログインに成功した場合
                            // チャット画面に遷移＋ログイン画面を破棄
                            await Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                                return HomePage();
                              }),
                            );
                          } catch (e) {
                            // ログインに失敗した場合
                            setState(() {
                              infoText = "ログインに失敗しました：${e.message}";
                            });
                          }
                        },
                        child: Text(
                          'Log in',
                          style: Theme.of(context).textTheme.button.copyWith(
                              color: kButtonTextColorPrimary, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // フッター
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 64),
                child: _Footer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ログイン画面　ヘッダーの背景のカーブ
class _HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height,
        size.width,
        size.height * 0.5,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// ログイン画面　ヘッダーの背景
class _HeaderBackground extends StatelessWidget {
  final double height;

  const _HeaderBackground({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // ヘッダーの背景のカーブ
      clipper: _HeaderCurveClipper(),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            colors: [
              Color(0xFF00B8D4),
              Color(0xFF00E5FF),
            ],
            stops: [0, 1],
          ),
        ),
      ),
    );
  }
}

// ログイン画面　ヘッダーのタイトル
class _HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'K A I G',
          style: Theme.of(context).textTheme.headline4.copyWith(
                color: kTextColorPrimary,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: 4),
        Text(
          'Self-Disclosure',
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: kTextColorPrimary),
        ),
      ],
    );
  }
}

// ログイン画面　ヘッダーの土台
class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = 320;
    return Container(
      height: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            // ヘッダーの背景
            child: _HeaderBackground(height: height),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 128),
              // ヘッダーのタイトル
              child: _HeaderTitle(),
            ),
          ),
        ],
      ),
    );
  }
}

// ログイン画面　フッター
class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'KAIG & Co.',
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: kTextColorSecondary),
        ),
      ],
    );
  }
}

// HOME画面　土台
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final FirebaseUser user = userState.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HOME",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.cyan,
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
      body: Row(
        children: [
          Expanded(
            child: PostList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blueAccent,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.blueAccent),
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

// HOME画面　土台
class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView(
              children: [
                _PostGreen(),
                _PostRed(),
                _PostGreen(),
                _PostRed(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// HOME画面　パーツ
class _Post extends StatelessWidget {
  final String name;
  final String message;
  final String textReason;
  final Color colorPrimary;
  final Color colorPositive;
  final String textPositive;
  final Color colorNegative;
  final String textNegative;

  const _Post({
    Key key,
    @required this.name,
    @required this.message,
    @required this.textReason,
    @required this.colorPrimary,
    @required this.colorPositive,
    @required this.textPositive,
    @required this.colorNegative,
    @required this.textNegative,
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
              title: Text(name),
              subtitle: Text('2 min ago'),
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
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: colorPrimary, width: 2),
                      ),
                    ),
                    child: Text(
                      textReason,
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: FlatButton(
                      textColor: colorNegative,
                      onPressed: () {},
                      child: Text(textNegative),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: FlatButton(
                      color: colorPositive.withOpacity(0.2),
                      textColor: colorPositive,
                      onPressed: () {},
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

class _PostGreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Post(
      name: 'お父さんページ',
      message: 'お父さんはこちらを選択してください。',
      textReason: 'Report Details',
      colorPrimary: Colors.greenAccent,
      colorPositive: Colors.greenAccent,
      textPositive: 'SELECT',
      colorNegative: Colors.greenAccent,
      textNegative: 'Archive',
    );
  }
}

class _PostRed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Post(
      name: 'お母さんページ',
      message: 'お母さんはこちらを選択してください。',
      textReason: 'Pending Reason',
      colorPrimary: Colors.deepOrangeAccent,
      colorPositive: Colors.deepOrangeAccent,
      textPositive: 'SELECT',
      colorNegative: Colors.deepOrangeAccent,
      textNegative: 'Decline',
    );
  }
}
