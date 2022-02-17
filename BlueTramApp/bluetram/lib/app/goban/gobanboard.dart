import 'package:bluetram/app/goban/stone.dart';
import 'package:bluetram/app/goban/stonecolumn.dart';
import 'package:bluetram/app/goban/woodenboard.dart';
import 'package:flutter/material.dart';

class GobanBoard extends StatelessWidget {
  const GobanBoard({Key? key}) : super(key: key);

  final Color primary = Colors.black;
  final Color secondary = Colors.white;
  //Color? boardcolor = Colors.orange[200];
  final int size = 9;
  //GobanBoard.construct(this.size, this.primary, this.secondary);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50 * size + 100,
      height: 50 * (size) + 100,
      color: Colors.orange[200],
      child: Stack(children: [
        Woodden(size: 9),
        //for (Stone stone in stones) {}
        Padding(
          padding: const EdgeInsets.all(35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StoneColumn(),
              StoneColumn(),
              StoneColumn(),
              StoneColumn(),
              StoneColumn(),
              StoneColumn(),
              StoneColumn(),
              StoneColumn(),
              StoneColumn(),
              StoneColumn()
            ],
          ),
        ),
      ]),
    );
  }
}
