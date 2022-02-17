import 'package:get/get.dart';

class GameController extends GetxController {
  RxList<List<int>> _board = RxList<List<int>>();
  List<List<int>> get board => _board.value;
  set board(List<List<int>> value) => _board.value = value;

  void _buildBoard() {
    board = [
      List.filled(9, 1),
      List.filled(9, 1),
      List.filled(9, 1),
      List.filled(9, 1),
      List.filled(9, 1),
      List.filled(9, 1),
      List.filled(9, 1),
      List.filled(9, 1),
      List.filled(9, 1),
    ];
  }

  int getCoordValue(int columnNumber, int rowNumber) {
    return board[columnNumber][rowNumber];
  }

  void setCoordValue(int columnNumber, int rowNumber, int color) {
    board[columnNumber][rowNumber] = color;
  }

  @override
  void onInit() {
    super.onInit();
    _buildBoard();
  }
}