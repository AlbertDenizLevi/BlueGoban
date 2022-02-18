import 'package:get/get.dart';

class MoveTrouple {
  int x;
  int y; //dont trust my sense of direction, thse things switch a million times in this code base, there is no reason because I dont use any
  int c; //color

  static final int X = 0;
  static final int Y = 0;
  static final int C = 0;

  MoveTrouple({required this.x, required this.y, required this.c});
}

class WebsocketController extends GetxController {
  RxList<MoveTrouple> _movelist = RxList<MoveTrouple>();
  List<MoveTrouple> get movelist => _movelist.value;
  set movelist(List<MoveTrouple> value) => _movelist.value = value;

  RxInt _movenumber = 1.obs;
  int get movenumber => _movenumber.value;

  void setMove(int columnNumber, int rowNumber, int color) {
    movelist[movenumber] = MoveTrouple(x: columnNumber, y: rowNumber, c: color);
    _movenumber++;
    update();
  }

  void _buildMoves() {
    _movenumber = 1.obs;
    movelist = List.filled(500, MoveTrouple(c: 0, x: 0, y: 0));
  }

  @override
  void onInit() {
    super.onInit();
    _buildMoves();
  }
}
