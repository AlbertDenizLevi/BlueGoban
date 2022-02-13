import 'package:flutter/material.dart';

class GobanBoard extends StatelessWidget {
  const GobanBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Color(0xffc49133),
              border: Border.all(
                width: 4,
              )),
        )
      ],
    );
  }
}
