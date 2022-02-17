import 'package:flutter/material.dart';

import 'stoneshape.dart';

enum stoneMode {
  EMPTY,
  BLACK,
  WHITE,
}

class Stone extends StatelessWidget {
  const Stone({Key? key, required this.currentStoneMode}) : super(key: key);

  final currentStoneMode;

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
    return _buildStone();
  }
}
