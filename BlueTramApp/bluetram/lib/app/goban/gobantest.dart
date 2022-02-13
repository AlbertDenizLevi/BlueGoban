import 'package:flutter/material.dart';
import 'package:bluetram/app/goban/gobanboard.dart';

// this was inspired by this series https://www.youtube.com/watch?v=ZclQbcjXP2w&list=PLRWeBscLsJDPo_id9fxNt1knr49bCEKz6&ab_channel=SyntacOps
class GobanTest extends StatelessWidget {
  const GobanTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GOBAN'),
      ),
      body: GobanBoard(),
    );
  }
}
