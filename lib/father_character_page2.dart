import 'package:flutter/material.dart';

class FatherCharacterPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Growth Facilitator for Students"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: RaisedButton(
          child: const Text(
            '送信',
            style: TextStyle(fontSize: 18),
          ),
          color: Colors.grey,
          shape: const StadiumBorder(),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FatherCharacterPage2(),
                ));
          },
        ),
      ),
    );
  }
}
