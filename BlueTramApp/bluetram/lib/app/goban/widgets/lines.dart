import 'package:flutter/material.dart';
import 'package:bluetram/app/goban/enums/boardSize.dart';
import 'package:bluetram/app/goban/helpers/boardSizeHelper.dart';
import 'package:bluetram/app/goban/models/gobanModel.dart';
import 'package:bluetram/app/goban/widgets/line.dart';
import 'package:provider/provider.dart';

class Lines extends StatelessWidget {
  final double margin;

  const Lines({
    Key? key,
    required this.margin,
  }) : super(key: key);

  List<Widget> _createVerticalLines(
      BoardSize boardSize, Color color, double width) {
    return [
      for (int i = 0; i < BoardSizeHelper.getBoardSizeFromEnum(boardSize); i++)
        Line(
          lineColor: color,
          width: width,
          height: 1,
        )
    ];
  }

  List<Widget> _createHorizontalLines(
      BoardSize boardSize, Color color, double width) {
    return [
      for (int i = 0; i < BoardSizeHelper.getBoardSizeFromEnum(boardSize); i++)
        Line(
          lineColor: color,
          height: width,
          width: 1,
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var gobanModel = Provider.of<GobanModel>(context);

    return Stack(
      children: <Widget>[
        Positioned(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.all(margin),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _createVerticalLines(
                    gobanModel.boardSize,
                    gobanModel.gobanTheme.boardTheme.lineColor,
                    gobanModel.gobanTheme.boardTheme.lineWidth)),
          ),
        ),
        Positioned(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.all(margin),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _createHorizontalLines(
                    gobanModel.boardSize,
                    gobanModel.gobanTheme.boardTheme.lineColor,
                    gobanModel.gobanTheme.boardTheme.lineWidth)),
          ),
        )
      ],
    );
  }
}
