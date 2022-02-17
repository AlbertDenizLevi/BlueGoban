import 'package:bluetram/app/goban/stone.dart';
import 'package:flutter/material.dart';

class StoneColumn extends StatelessWidget {
  const StoneColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < 10; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
            child: Stone(
              stoneColor: Colors.black,
            ),
          ),
      ],
    );
  }
}
