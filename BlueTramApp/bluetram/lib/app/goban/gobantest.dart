import 'package:flutter/material.dart';
import 'package:bluetram/app/services/httpallmovesobject.dart';
import 'package:http/http.dart' as http;
import 'package:bluetram/app/goban/gobanboard.dart';
import 'package:bluetram/app/controllers/game_controller.dart';
import 'package:get/get.dart';

Future<AllMoves> fetchAllMoves() async {
  final response = await http
      .get(Uri.parse('https://online-go.com/api/v1/players/1113291/full'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //print(response.body);
    final allMoves = AllMoves.fromRawJson(response.body);
    //print(allMoves.activeGames![0].json!.moves![0]);
    return allMoves;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class GobanTest extends StatelessWidget {
  void play11() {
    gameController.setCoordValue(1, 1);
  }

  void resetBoard() {
    gameController.resetBoard();
  }

  Future<void> setBoardFromGame(int selectedgame) async {
    //selected game being the number of the active games
    final AllMoves allMoves = await fetchAllMoves();
    gameController.makeBoardFromMoveList(
        allMoves.activeGames![selectedgame].json!.moves!);
  }

  GobanTest({Key? key}) : super(key: key);
  final GameController gameController = Get.find<GameController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GOBAN'),
      ),
      body: Column(
        children: [
          GobanBoard(
            size: 9,
          ),
          TextButton(
              onPressed: () {
                resetBoard();
              },
              child: Text("RESET")),
          TextButton(
              onPressed: () async => {await setBoardFromGame(0)},
              child: Text("Set game 0"))
        ],
      ),
    );
  }
}
