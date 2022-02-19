import 'package:flutter/material.dart';

//wooden is fully moduler on the board size department,
class Woodden extends StatelessWidget {
  final int size;
  const Woodden({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (var i = 0; i < size - 1; i++)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (var i = 0; i < size - 1; i++)
                Container(
                  height: 40,
                  width: 40,
                  //padding: EdgeInsets.symmetric(),
                  decoration: BoxDecoration(
                    color: Colors.orange[200], //color file TODO
                    border:
                        Border.all(width: 1), //border color might be a variable
                  ),
                )
            ],
          ),
      ],
    );
  }
}
