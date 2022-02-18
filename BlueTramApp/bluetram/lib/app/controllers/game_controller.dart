import 'package:get/get.dart';

class GameController extends GetxController {
  RxList<List<int>> _board = RxList<List<int>>();
  List<List<int>> get board => _board.value;
  set board(List<List<int>> value) => _board.value = value;
  RxInt _lastColumn = 0.obs; //player move listeners
  int get lastColumn => _lastColumn.value;
  RxInt _lastRow = 0.obs; //player move listeners
  int get lastRow => _lastRow.value;

  RxBool _turnBlack = true.obs;
  bool get turnBlack => _turnBlack.value;

  void _buildBoard() {
    board = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      List.filled(9, 0),
      List.filled(9, 0),
      List.filled(9, 0),
      List.filled(9, 0),
      List.filled(9, 0),
      List.filled(9, 0),
      List.filled(9, 0),
      List.filled(9, 0),
    ];
  }

  void resetBoard() {
    board = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      List.filled(9, 0),
      List.filled(9, 0),
      List.filled(9, 0),
      List.filled(9, 0),
      List.filled(9, 0),
      List.filled(9, 0),
      List.filled(9, 0),
      List.filled(9, 0),
    ];
    update();
  }

  int getCoordValue(int columnNumber, int rowNumber) {
    return board[columnNumber][rowNumber];
  }

  //this is used for players moves
  void setCoordValue(int columnNumber, int rowNumber) {
    final selectedCoord = board[columnNumber][rowNumber];
    if (selectedCoord == 0) {
      if (turnBlack) {
        board[columnNumber][rowNumber] = 2; //2 is black stone
      } else {
        board[columnNumber][rowNumber] = 1; //1 is white stone
      }
    } //the coord is empty
    else {
      //if there is already a stone change the color of the stone
      board[columnNumber][rowNumber] = (selectedCoord % 2) + 1; //1->2, 2->1
    }
    _turnBlack.value = !_turnBlack.value; //its next players turn now
    //board[columnNumber][rowNumber] = color;
    _lastColumn.value = columnNumber;
    _lastRow.value = rowNumber;
    update();
  }

  //this is used for opponents moves, the difference is there is no update on the last move made by the player of ours, we use that update to send a message to the ogs
  void setStone(int columnNumber, int rowNumber) {
    final selectedCoord = board[columnNumber][rowNumber];
    if (selectedCoord == 0) {
      if (turnBlack) {
        board[columnNumber][rowNumber] = 2; //2 is black stone
      } else {
        board[columnNumber][rowNumber] = 1; //1 is white stone
      }
    } //the coord is empty
    else {
      //if there is already a stone change the color of the stone
      board[columnNumber][rowNumber] = (selectedCoord % 2) + 1; //1->2, 2->1
    }
    _turnBlack.value = !_turnBlack.value; //its next players turn now
    //board[columnNumber][rowNumber] = color;
    //_lastColumn.value = columnNumber;
    //_lastRow.value = rowNumber;
    update();
  }

  void makeBoardFromMoveList(List<List<dynamic>> moves) {
    for (List<dynamic> move in moves) {
      setStone(move[0], move[1]);
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _buildBoard();
  }
}
