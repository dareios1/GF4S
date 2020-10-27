import 'package:flutter/material.dart';

class FatherCharacterPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    '診断結果を保存しました',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    'タイプ７【熱中する人】',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Text(
                    '活動的で、もっとも外向的。冒険や楽しいこと、刺激的なことに熱中し、自由を好む。必要なものを奪われ、痛みを感じることを恐れ、幸福で充足していたい。健全な状態で、感謝や生きる喜びで満たされる。肯定的で創造的なヴィジョンを考え出す。周りの人を楽しませることで、自分も楽しくなる。楽観的だが、実行能力もある。',
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
                '面談テーマルーレットに進む',
                style: TextStyle(fontSize: 18),
              ),
              color: Colors.pinkAccent,
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
