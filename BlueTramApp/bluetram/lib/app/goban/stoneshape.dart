import 'package:flutter/material.dart';

class StoneShape extends StatelessWidget {
  final Color stoneColor;
  const StoneShape({Key? key, required this.stoneColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      child: Container(
        height: 30,
        width: 30,
        //padding: EdgeInsets.fromLTRB(0, 0, 50, 50),

        decoration: BoxDecoration(
            color: stoneColor,
            borderRadius: BorderRadius.all(Radius.circular(200))),
      ),
    );
  }
}
