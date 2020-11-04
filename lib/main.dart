import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 右上に表示される"debug"ラベルを消す
      debugShowCheckedModeBanner: false,
      title: 'Growth Facilitator for Students',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Growth Facilitator for Students'),
          backgroundColor: Colors.purpleAccent,
        ),
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Growth Facilitator for Students',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
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
                trailing: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
        body: Center(
          child: FatherCharacterPage1(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blueAccent,
              ),
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
              title: Text(
                'Teacher',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
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

  void _handleRadioButton1(String choices1) => setState(() {
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
                onChanged: _handleRadioButton1,
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
                onChanged: _handleRadioButton1,
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
                onChanged: _handleRadioButton1,
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
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            color: Colors.purpleAccent,
            shape: const StadiumBorder(),
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
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
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
          '理想や理念、倫理基準が高く、理性的。間違うことを恐れ、正しくありたい。健全な状態で、思慮分別があり、理想を現実にするための努力を惜しまない。誠実で、公平、バランス感覚がある。通常、現状に満足できず、物事は常に少しでも改善の余地があると考えがち。とらわれが強くなると、批判的にものごとを見、完璧主義が行きすぎる。自己批判が強く、内面の理想的な基準に照らして、自らを叱咤激励する。ハードワークになりがちで、リラックスしにくい。不健全になるにつれ、他の人（とくに身内）や物事の至らないところが気になって、自己正当化や非難が強まる。他の人は自分ほどきちんとできず、自分だけが責任を負っていると思いがち。柔軟性に欠け、怒りや正義感がエネルギーとなる。強迫的になる。タイプ1の本質は、知恵。',
    },
    'TYPE_2': {
      'type': 'タイプ2【助ける人】',
      'type_detail':
          '人とのつながりを大切にし、思いやりがあり、面倒見がいい。贈り物をする場合は 、相手にもっともふさわしいものを探し出す。自分が愛される価値のないことを恐れ 、無条件に愛されたいと願う。健全な状態では、見返りを求めることなく、真に寛大な「与える人」。だがとらわれが強くなるにつれ、自分勝手な「思いやりマニュアル」にしたがって、相手の実際のニーズを確かめることなく、援助しようとする。そしておせっかいになり、自己犠牲を払って恩を売り、所有欲が強くなる。自分自身の問題やニーズを認めようとせず、助けを受けることが苦手（「自分は大丈夫」）。不健全な状態で、自分の親切が思ったように評価されない場合、相手を敵視し、強く非難する。人が自分から去ることのないよう、強迫的に愛を求める。ストレスは、心理的問題よりも、身体症状として出やすい。最終的には心身共に消耗し、人に面倒を見てもらわざるを得なくなる。タイプ2の本質は、無条件の愛。',
    },
    'TYPE_3': {
      'type': 'タイプ3【達成する人】',
      'type_detail':
          '成功志向で、実利的。自分に価値がないことを恐れ、人からほめられることをして、価値を感じたい。目標実現のため、ハードに働く。健全な状態において、自分の価値を心から信じ、ベストの自分になる。明確な目標設定により、物事を実現する力がある。またその目標に向かって、他の人のやる気を引き出すこともできる。自信をもち、プレゼンテーションがうまい。その反面、とらわれが強くなると、競争心や上昇志向、ステータス志向が強まる。自分より下と感じる者に対し、横柄な態度を取ることもある。成功した自己イメージにこだわり、自分の素直な気持ちや本当に求めているものを感じたり、親密な関係をもつことが難しい。また、不健全な状態では、実際の自分の実力以上に良く見せようとして嘘をつくことも厭わないが、内面の空虚感が高まる。自分の悩みを隠したり、自分を拒否したと思われるものを攻撃する。タイプ3の本質は、真正。',
    },
    'TYPE_4': {
      'type': 'タイプ4【個性を求める人】',
      'type_detail':
          '繊細で、直感的で、感受性豊か。自分に生きている意味がないことを恐れ、存在意義を見つけたい。健全な状態で、人生の深さや美しさに触れ、それを創造的に表現する。きわめて個人的なことを語っていても、普遍的な価値をもつことが多い。通常の状態では、美しいものに囲まれ、耽美的な空想に耽ることで、自分らしいムードを保つ。とらわれが強まるにつれ、人生に対し、斜に構える。気分にムラがあり、自意識が強い。人と一定の距離を置くがかえって注意を引く。自分が特別であり、理解されにくいと思う一方、平凡な人生へのひそやかなあこがれもある。自分と同じ価値を共有したり、自分を救ってくれる「理想的な相手」にあこがれるが、近くにいるとあらが見えるので、遠ざける。そして離れては引き寄せるということを繰り返す。不健全になると、自己憐憫や他人への妬み、嗜癖などの自己放縦に走ったり、鬱的になる。タイプ4の本質は、美と創造。',
    },
    'TYPE_5': {
      'type': 'タイプ5【調べる人】',
      'type_detail':
          '集中的に頭を使う、観察者。自分が無能であることを恐れ、有能でありたい。そのために得意な知識や技能をもっていることが重要になる。健全な状態で、未来を見通す、先駆的なヴィジョンをもつ。洞察力が鋭く、ものごとに巻き込まれずに、全体を見通す力がある。好奇心にあふれ、斬新な発想をもつ。通常の状態で、典型的な思考型で、理性的。感情表現や人間関係は得意な方ではない。まわりの環境を理解し、解明することで、圧倒されないようにする。興味をもったことに関し、集中的に知識を習得し、没頭する。とらわれが強くなるにつれ、知識や技能を身につけることで初めて、世の中と関われると考えがち。すべてを構想したり、納得してからでないと、行動できない。自分が他人に依存しない代わりに、自分も依存されたくない。自分の知性を鼻にかけ、挑発的な皮肉を言う。不健全になると孤立して、エキセントリックなニヒリストとなる。タイプ5の本質は、知。',
    },
    'TYPE_6': {
      'type': 'タイプ6【信頼を求める人】',
      'type_detail':
          '安全志向で、自分が何を信じることができるか、ということが重要な人生のテーマ。信頼できる人物や考え方を求めるが、本当に信頼できるか、疑う気持ちと、忠実であろうとする気持ちの間を揺れ動く。権威をもつ者に、従うか、反発するかのどちらかになりやすい。独力ではやっていけないことを恐れ、同意やサポートをまわりから得たい。自分に対する周りのさまざまな期待に合わせようとし、優柔不断になる。思考が活発なときと、感情的になるときの両方がある。雑念に悩まされやすく、頭の中をからっぽにするのが苦手。健全な状態で、外側にあるものではなく、自らの内に勇気と信頼を見いだす。愛情深く、仲間のために忠実かつ献身的で、真剣に関わる努力家。関心のあることを追求したり、用意周到に準備する能力もある。とらわれが強まるにつれ、不安が高じてルールや枠、原理を頑なに守ろうとしたり、最悪の事態を考える。パラノイアになる。「敵」をつくりだして、攻撃する。タイプ6の本質は、勇気。',
    },
    'TYPE_7': {
      'type': 'タイプ7【熱中する人】',
      'type_detail':
          '活動的で、もっとも外向的。冒険や楽しいこと、刺激的なことに熱中し、自由を好む。必要なものを奪われ、痛みを感じることを恐れ、幸福で充足していたい。健全な状態で、感謝や生きる喜びで満たされる。肯定的で創造的なヴィジョンを考え出す。周りの人を楽しませることで、自分も楽しくなる。楽観的だが、実行能力もある。通常の状態で、さまざまな計画を立てるだけで楽しく、忙しい。話の中心になり、冗談を飛ばして場を盛り上げる。多才な反面、腰を落ちつけて集中しにくい。とらわれが強まるにつれ、「今、ここ」にあるものより、もっといいものがあるのではと考える。また、たくさん計画したことをなかなか実行できなくて、苦しむ。不健全になると、きわめて衝動的で無責任になり、どんなことをしてでも苦痛から逃がれようとする。快楽や嗜癖、物質主義に走ったり、躁鬱的になる。財政的破綻や病気にも至る。タイプ7の本質は、喜びと感謝。',
    },
    'TYPE_8': {
      'type': 'タイプ8【挑戦する人】',
      'type_detail':
          '強く腹が据わっていて、遠慮せず、はっきりものを言う。他人に支配されることを恐れ、自分が支配し、仕切りたがる。現実的で、マイウェイ（わが道を行く）。健全な状態で、心が広く、面倒見がいい。弱い立場の者を守る。自然な自信と力、リーダーシップを備えていて、決断力に富む。エネルギーに満ちあふれていて、行動的。リスクや挑戦を恐れない。性格のとらわれが強くなるにつれ、自慢したり、強がりを言う。世間のルールや常識に構わず力づくでも自分のやりたいことを通す。自分の弱さは決して認めないで、相手の弱点をつついて、支配したり、操作する。不健全になるとお金や権力、名声など、力を誇示したり、闘争的・破壊的になる。タイプ8の本質は、「慈愛を伴う力」。',
    },
    'TYPE_9': {
      'type': 'タイプ9【平和を好む人】',
      'type_detail':
          '穏やかで、人に安心感を与え、気持ちをなごませる。人から見捨てられることを恐れ、平和や快適であること、また、一体感を好む。健全な状態で、平和で安定した心を保つ。周囲に緊張や葛藤がある場合は、公平な立場で辛抱強く仲裁に入る。想像力に富み、楽観的なヴィジョンをもつ。性格のとらわれが強くなると、表面的にまわりに合わせ、葛藤を避け、実態よりもいい方に理想化して考えてしまう。頑固なまでに現状維持。自分は成長するに値しないと思いがちで、変化へ向けての積極的な行動を起こせない。怒りや不満を直接表現せずに、暗黙の抵抗で示す。不健全なとき、まわりの人から気持ちが離れ、問題に直面することなく、自分を麻痺させて、心地良い空想や嗜癖、フテ寝などに走る。抑鬱や無感覚になる。タイプ9の本質は、「平和」。',
    },
    'TYPE_ERROR': {
      'type': 'エラー',
      'type_detail': 'エラー',
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

  @override
  Widget build(BuildContext context) {
    // 表示に使用するデータを取得
    final typeData = typeDataList[getType()];

    return Scaffold(
      appBar: AppBar(
        title: Text("Growth Facilitator for Students"),
        backgroundColor: Colors.purpleAccent,
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
                    typeData['type'],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    typeData['type_detail'],
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
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              color: Colors.purpleAccent,
              shape: const StadiumBorder(),
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
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
          ],
        ),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Growth Facilitator for Students"),
        backgroundColor: Colors.purpleAccent,
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
                    '診断結果を保存しました',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    type,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    type_detail,
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
                '面談テーマルーレットに進む',
                style: TextStyle(fontSize: 18),
              ),
              color: Colors.grey,
              shape: const StadiumBorder(),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => FatherInterviewRoulettePage1(),
                //     ));
              },
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

class FatherInterviewRoulettePage1 {}
