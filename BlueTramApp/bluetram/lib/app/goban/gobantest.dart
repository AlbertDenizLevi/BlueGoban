import 'package:bluetram/app/goban/gobanboard.dart';
import 'package:flutter/material.dart';
import 'package:bluetram/app/controllers/game_controller.dart';
import 'package:get/get.dart';

class GobanTest extends StatelessWidget {
  void play11() {
    gameController.setCoordValue(1, 1);
  }

  void resetBoard() {
    gameController.resetBoard();
  }

  GobanTest({Key? key}) : super(key: key);
  final GameController gameController = Get.find<GameController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GOBAN'),
      ),
      body: Column(
        children: [
          GobanBoard(
            size: 9,
          ),
          TextButton(
              onPressed: () {
                play11();
              },
              child: Text("press to play 1-1"))
        ],
      ),
    );
  }
}
