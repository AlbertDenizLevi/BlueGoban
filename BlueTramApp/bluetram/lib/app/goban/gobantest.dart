import 'package:flutter/material.dart';
import 'package:goban/data_classes/move.dart';
import 'package:goban/enums/player.dart';
import 'package:goban/gobanController.dart';
import 'package:goban/themes/gobanTheme.dart';
import 'package:goban/data_classes/position.dart';
import 'package:goban/enums/boardSize.dart';

class GobanTest extends StatefulWidget {
  const GobanTest({Key? key}) : super(key: key);

  @override
  _GobanTestState createState() => _GobanTestState();
}

class _GobanTestState extends State<GobanTest> {
  Player player = Player.Black;
  String gobanTheme = 'default';
  BoardSize boardSize = BoardSize.Thirteen;

  GobanController gobanController = GobanController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        gobanController.goban,
      ],
    ));
  }
}
