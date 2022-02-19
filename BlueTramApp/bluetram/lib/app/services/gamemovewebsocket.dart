//https://app.quicktype.io/ was used when making this codde, know that the website does not support null safety jsut yet, required needs to be toggled and after toggling you need to erase th @ manually, you also need to null safe all the variables after choosing "all properties optional" toggle
//final gamemove = Gamemove.fromRawJson(response.body);

import 'dart:convert';

class Gamemove {
  Gamemove({
    required this.gamemove,
  });

  List<dynamic>? gamemove;

  factory Gamemove.fromRawJson(String str) =>
      Gamemove.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gamemove.fromJson(Map<String, dynamic> json) => Gamemove(
        gamemove: json["gamemove"] == null
            ? null
            : List<dynamic>.from(json["gamemove"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "gamemove": gamemove == null
            ? null
            : List<dynamic>.from(gamemove!.map((x) => x)),
      };
}

class GamemoveClass {
  GamemoveClass({
    required this.gameId,
    required this.moveNumber,
    required this.move,
  });

  int gameId;
  int moveNumber;
  List<int>? move;

  factory GamemoveClass.fromRawJson(String str) =>
      GamemoveClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GamemoveClass.fromJson(Map<String, dynamic> json) => GamemoveClass(
        gameId: json["game_id"] == null ? null : json["game_id"],
        moveNumber: json["move_number"] == null ? null : json["move_number"],
        move: json["move"] == null
            ? null
            : List<int>.from(json["move"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "game_id": gameId == null ? null : gameId,
        "move_number": moveNumber == null ? null : moveNumber,
        "move": move == null ? null : List<dynamic>.from(move!.map((x) => x)),
      };
}
