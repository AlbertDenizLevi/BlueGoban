import 'package:bluetram/app/controllers/game_controller.dart';
//import 'package:bluetram/app/goban/stone.dart';
import 'package:bluetram/app/goban/stonecolumn.dart';
import 'package:bluetram/app/goban/woodenboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GobanBoard extends StatelessWidget {
  final GameController gameController = Get.find<GameController>();

  List<StoneColumn> _buildBoard() {
    int currentColumnNumber = 0;

    return gameController.board
        .map((boardColumn) => StoneColumn(
              columnOfStonesPlayed: boardColumn,
              columnNumber: currentColumnNumber++,
            ))
        .toList();
  }

  GobanBoard({Key? key, required this.size}) : super(key: key);

  final Color primary = Colors.black;
  final Color secondary = Colors.white;
  //Color? boardcolor = Colors.orange[200];
  final int size;
  //GobanBoard.construct(this.size, this.primary, this.secondary);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 35 * size + 100,
        height: 35 * (size) + 100,
        color: Colors.orange[200],
        child: Stack(children: [
          Woodden(size: size),
          //for (Stone stone in stones) {}
          Padding(
            padding: const EdgeInsets.all(32),
            child: GetBuilder<GameController>(
              builder: (GetxController gameController) => Row(
                children: _buildBoard(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
