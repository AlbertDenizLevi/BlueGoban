import 'package:flutter/material.dart';

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
                  height: 50,
                  width: 50,
                  //padding: EdgeInsets.symmetric(),
                  decoration: BoxDecoration(
                    color: Colors.orange[200],
                    border: Border.all(width: 1),
                  ),
                )
            ],
          ),
      ],
    );
  }
}
