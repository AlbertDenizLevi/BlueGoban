import 'package:bluetram/app/goban/gobanboard.dart';
import 'package:flutter/material.dart';

class GobanTest extends StatelessWidget {
  const GobanTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GOBAN'),
      ),
      body: GobanBoard(
        size: 9,
      ),
    );
  }
}
