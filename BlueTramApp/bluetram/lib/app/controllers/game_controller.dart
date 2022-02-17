import 'package:get/get.dart';

class GameController extends GetxController {
  RxList<List<int>> _board = RxList<List<int>>();
  List<List<int>> get board => _board.value;
  set board(List<List<int>> value) => _board.value = value;

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
  }

  int getCoordValue(int columnNumber, int rowNumber) {
    return board[columnNumber][rowNumber];
  }

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
      board[columnNumber][rowNumber] = (selectedCoord % 2) + 1; //1->2, 2->1
    }
    _turnBlack.value = !_turnBlack.value; //its next players turn now
    //board[columnNumber][rowNumber] = color;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _buildBoard();
  }
}
