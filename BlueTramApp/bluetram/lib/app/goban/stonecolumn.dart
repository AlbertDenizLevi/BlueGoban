import 'package:bluetram/app/controllers/game_controller.dart';
import 'package:bluetram/app/goban/stone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoneColumn extends StatelessWidget {
  StoneColumn({
    Key? key,
    required this.columnOfStonesPlayed,
    required this.columnNumber,
  }) : super(key: key);
  final GameController gameController = Get.find<GameController>();
  final List<int> columnOfStonesPlayed;
  final int columnNumber;

  List<Stone> _buildStoneColumn() {
    return columnOfStonesPlayed
        .map((number) => number == 1
            ? Stone(
                currentStoneMode: stoneMode.WHITE,
              )
            : number == 2
                ? Stone(
                    currentStoneMode: stoneMode.BLACK,
                  )
                : Stone(
                    currentStoneMode: stoneMode.EMPTY,
                  ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: _buildStoneColumn());
  }
}
