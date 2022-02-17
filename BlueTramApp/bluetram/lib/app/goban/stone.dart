import 'package:bluetram/app/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'stoneshape.dart';

enum stoneMode {
  EMPTY,
  BLACK,
  WHITE,
}

class Stone extends StatelessWidget {
  Stone(
      {Key? key,
      required this.currentStoneMode,
      required this.columnNumber,
      required this.rowNumber})
      : super(key: key);
  final GameController gameController = Get.find<GameController>();
  final currentStoneMode;
  final int columnNumber;
  final int rowNumber;

  StoneShape _buildStone() {
    switch (this.currentStoneMode) {
      case stoneMode.BLACK:
        return StoneShape(stoneColor: Colors.black);
      case stoneMode.WHITE:
        return StoneShape(stoneColor: Colors.white);
      default:
        return StoneShape(stoneColor: Colors.transparent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => gameController.setCoordValue(columnNumber, rowNumber),
        child: _buildStone());
  }
}
