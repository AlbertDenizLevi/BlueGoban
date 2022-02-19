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
      //center the whole board
      child: Container(
        //add the wood colored base of the board
        width: 35 * size +
            100, // changing any number here will cause shifting of the stones, have not made the math to make sure that does not happen and  the board will not be modular until I figure that out
        height: 35 * (size) + 100,
        color: Colors.orange[
            200], // should probably keep this color in a differet file TODO
        child: Stack(children: [
          Woodden(
              size:
                  size), //the squares, these are done before the stones themselves since the board is always below the stones

          Padding(
            padding: const EdgeInsets.all(
                30), //this moves the stones created by the buildStones function into the right place
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
