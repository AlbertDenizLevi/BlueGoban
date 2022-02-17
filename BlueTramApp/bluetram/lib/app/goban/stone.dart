import 'package:flutter/material.dart';

class Stone extends StatelessWidget {
  final Color stoneColor;
  const Stone({Key? key, required this.stoneColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      //padding: EdgeInsets.fromLTRB(0, 0, 50, 50),

      decoration: BoxDecoration(
          color: stoneColor,
          borderRadius: BorderRadius.all(Radius.circular(200))),
    );
  }
}
