// To parse this JSON data, do
// https://app.quicktype.io/ was used when making this codde, know that the website does not support null safety jsut yet, required needs to be toggled and after toggling you need to erase th @ manually, you also need to null safe all the variables after choosing all properties optional toggle
//     final allMoves = allMovesFromJson(jsonString);

import 'dart:convert';

class AllMoves {
  AllMoves({
    required this.user,
    required this.activeGames,
    required this.ladders,
    required this.tournaments,
    required this.titles,
    required this.trophies,
    required this.groups,
    required this.isFriend,
    required this.friendRequestSent,
    required this.friendRequestReceived,
    required this.vs,
    required this.block,
    required this.achievements,
  });

  User? user;
  List<ActiveGame>? activeGames;
  List<dynamic>? ladders;
  List<dynamic>? tournaments;
  List<dynamic>? titles;
  List<dynamic>? trophies;
  List<dynamic>? groups;
  bool isFriend;
  bool friendRequestSent;
  bool friendRequestReceived;
  Vs? vs;
  Block? block;
  List<dynamic>? achievements;

  factory AllMoves.fromRawJson(String str) =>
      AllMoves.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllMoves.fromJson(Map<String, dynamic> json) => AllMoves(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        activeGames: json["active_games"] == null
            ? null
            : List<ActiveGame>.from(
                json["active_games"].map((x) => ActiveGame.fromJson(x))),
        ladders: json["ladders"] == null
            ? null
            : List<dynamic>.from(json["ladders"].map((x) => x)),
        tournaments: json["tournaments"] == null
            ? null
            : List<dynamic>.from(json["tournaments"].map((x) => x)),
        titles: json["titles"] == null
            ? null
            : List<dynamic>.from(json["titles"].map((x) => x)),
        trophies: json["trophies"] == null
            ? null
            : List<dynamic>.from(json["trophies"].map((x) => x)),
        groups: json["groups"] == null
            ? null
            : List<dynamic>.from(json["groups"].map((x) => x)),
        isFriend: json["is_friend"] == null ? null : json["is_friend"],
        friendRequestSent: json["friend_request_sent"] == null
            ? null
            : json["friend_request_sent"],
        friendRequestReceived: json["friend_request_received"] == null
            ? null
            : json["friend_request_received"],
        vs: json["vs"] == null ? null : Vs.fromJson(json["vs"]),
        block: json["block"] == null ? null : Block.fromJson(json["block"]),
        achievements: json["achievements"] == null
            ? null
            : List<dynamic>.from(json["achievements"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user?.toJson(),
        "active_games": activeGames == null
            ? null
            : List<dynamic>.from(activeGames!.map((x) => x.toJson())),
        "ladders":
            ladders == null ? null : List<dynamic>.from(ladders!.map((x) => x)),
        "tournaments": tournaments == null
            ? null
            : List<dynamic>.from(tournaments!.map((x) => x)),
        "titles":
            titles == null ? null : List<dynamic>.from(titles!.map((x) => x)),
        "trophies": trophies == null
            ? null
            : List<dynamic>.from(trophies!.map((x) => x)),
        "groups":
            groups == null ? null : List<dynamic>.from(groups!.map((x) => x)),
        "is_friend": isFriend == null ? null : isFriend,
        "friend_request_sent":
            friendRequestSent == null ? null : friendRequestSent,
        "friend_request_received":
            friendRequestReceived == null ? null : friendRequestReceived,
        "vs": vs == null ? null : vs?.toJson(),
        "block": block == null ? null : block?.toJson(),
        "achievements": achievements == null
            ? null
            : List<dynamic>.from(achievements!.map((x) => x)),
      };
}

class ActiveGame {
  ActiveGame({
    required this.id,
    required this.black,
    required this.white,
    required this.width,
    required this.height,
    required this.name,
    required this.json,
  });

  int id;
  Black? black;
  Black? white;
  int width;
  int height;
  String name;
  Json? json;

  factory ActiveGame.fromRawJson(String str) =>
      ActiveGame.fromJson(jsonDecode(str));

  String toRawJson() => jsonEncode(toJson());

  factory ActiveGame.fromJson(Map<String, dynamic> json) => ActiveGame(
        id: json["id"] == null ? null : json["id"],
        black: json["black"] == null ? null : Black.fromJson(json["black"]),
        white: json["white"] == null ? null : Black.fromJson(json["white"]),
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        name: json["name"] == null ? null : json["name"],
        json: json["json"] == null ? null : Json.fromJson(json["json"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "black": black == null ? null : black?.toJson(),
        "white": white == null ? null : white?.toJson(),
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "name": name == null ? null : name,
        "json": json == null ? null : json?.toJson(),
      };
}

class Black {
  Black({
    required this.username,
    required this.ranking,
    required this.ratings,
    required this.pro,
    required this.id,
  });

  String username;
  double ranking;
  Ratings? ratings;
  bool pro;
  int id;

  factory Black.fromRawJson(String str) => Black.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Black.fromJson(Map<String, dynamic> json) => Black(
        username: json["username"] == null ? null : json["username"],
        ranking: json["ranking"] == null ? null : json["ranking"].toDouble(),
        ratings:
            json["ratings"] == null ? null : Ratings.fromJson(json["ratings"]),
        pro: json["pro"] == null ? null : json["pro"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "ranking": ranking == null ? null : ranking,
        "ratings": ratings == null ? null : ratings?.toJson(),
        "pro": pro == null ? null : pro,
        "id": id == null ? null : id,
      };
}

class Ratings {
  Ratings({
    required this.version,
    required this.overall,
  });

  int version;
  Overall? overall;

  factory Ratings.fromRawJson(String str) => Ratings.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
        version: json["version"] == null ? null : json["version"],
        overall:
            json["overall"] == null ? null : Overall.fromJson(json["overall"]),
      );

  Map<String, dynamic> toJson() => {
        "version": version == null ? null : version,
        "overall": overall == null ? null : overall?.toJson(),
      };
}

class Overall {
  Overall({
    required this.rating,
    required this.deviation,
    required this.volatility,
  });

  double rating;
  double deviation;
  double volatility;

  factory Overall.fromRawJson(String str) => Overall.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Overall.fromJson(Map<String, dynamic> json) => Overall(
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        deviation:
            json["deviation"] == null ? null : json["deviation"].toDouble(),
        volatility:
            json["volatility"] == null ? null : json["volatility"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "rating": rating == null ? null : rating,
        "deviation": deviation == null ? null : deviation,
        "volatility": volatility == null ? null : volatility,
      };
}

class Json {
  Json({
    required this.whitePlayerId,
    required this.blackPlayerId,
    required this.groupIds,
    required this.gameId,
    required this.gameName,
    required this.private,
    required this.pauseOnWeekends,
    required this.players,
    required this.ranked,
    required this.disableAnalysis,
    required this.handicap,
    required this.komi,
    required this.width,
    required this.height,
    required this.rules,
    required this.rengo,
    required this.rengoTeams,
    required this.rengoCasualMode,
    required this.timeControl,
    required this.phase,
    required this.initialPlayer,
    required this.moves,
    required this.allowSelfCapture,
    required this.automaticStoneRemoval,
    required this.freeHandicapPlacement,
    required this.agaHandicapScoring,
    required this.allowKo,
    required this.allowSuperko,
    required this.superkoAlgorithm,
    required this.playerPool,
    required this.scoreTerritory,
    required this.scoreTerritoryInSeki,
    required this.scoreStones,
    required this.scoreHandicap,
    required this.scorePrisoners,
    required this.scorePasses,
    required this.whiteMustPassLast,
    required this.opponentPlaysFirstAfterResume,
    required this.strictSekiMode,
    required this.initialState,
    required this.startTime,
    required this.originalDisableAnalysis,
    required this.clock,
    required this.autoScore,
  });

  int whitePlayerId;
  int blackPlayerId;
  List<dynamic>? groupIds;
  int gameId;
  String gameName;
  bool private;
  bool pauseOnWeekends;
  Players? players;
  bool ranked;
  bool disableAnalysis;
  int handicap;
  double komi;
  int width;
  int height;
  String rules;
  bool rengo;
  RengoTeams? rengoTeams;
  bool rengoCasualMode;
  TimeControl? timeControl;
  String phase;
  String initialPlayer;
  List<List<dynamic>>? moves;
  bool allowSelfCapture;
  bool automaticStoneRemoval;
  bool freeHandicapPlacement;
  bool agaHandicapScoring;
  bool allowKo;
  bool allowSuperko;
  String superkoAlgorithm;
  Map<String, PlayerPool>? playerPool;
  bool scoreTerritory;
  bool scoreTerritoryInSeki;
  bool scoreStones;
  bool scoreHandicap;
  bool scorePrisoners;
  bool scorePasses;
  bool whiteMustPassLast;
  bool opponentPlaysFirstAfterResume;
  bool strictSekiMode;
  InitialState? initialState;
  int startTime;
  bool originalDisableAnalysis;
  Clock? clock;
  bool autoScore;

  factory Json.fromRawJson(String str) => Json.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Json.fromJson(Map<String, dynamic> json) => Json(
        whitePlayerId:
            json["white_player_id"] == null ? null : json["white_player_id"],
        blackPlayerId:
            json["black_player_id"] == null ? null : json["black_player_id"],
        groupIds: json["group_ids"] == null
            ? null
            : List<dynamic>.from(json["group_ids"].map((x) => x)),
        gameId: json["game_id"] == null ? null : json["game_id"],
        gameName: json["game_name"] == null ? null : json["game_name"],
        private: json["private"] == null ? null : json["private"],
        pauseOnWeekends: json["pause_on_weekends"] == null
            ? null
            : json["pause_on_weekends"],
        players:
            json["players"] == null ? null : Players.fromJson(json["players"]),
        ranked: json["ranked"] == null ? null : json["ranked"],
        disableAnalysis:
            json["disable_analysis"] == null ? null : json["disable_analysis"],
        handicap: json["handicap"] == null ? null : json["handicap"],
        komi: json["komi"] == null ? null : json["komi"].toDouble(),
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        rules: json["rules"] == null ? null : json["rules"],
        rengo: json["rengo"] == null ? null : json["rengo"],
        rengoTeams: json["rengo_teams"] == null
            ? null
            : RengoTeams.fromJson(json["rengo_teams"]),
        rengoCasualMode: json["rengo_casual_mode"] == null
            ? null
            : json["rengo_casual_mode"],
        timeControl: json["time_control"] == null
            ? null
            : TimeControl.fromJson(json["time_control"]),
        phase: json["phase"] == null ? null : json["phase"],
        initialPlayer:
            json["initial_player"] == null ? null : json["initial_player"],
        moves: json["moves"] == null
            ? null
            : List<List<dynamic>>.from(
                json["moves"].map((x) => List<dynamic>.from(x.map((x) => x)))),
        allowSelfCapture: json["allow_self_capture"] == null
            ? null
            : json["allow_self_capture"],
        automaticStoneRemoval: json["automatic_stone_removal"] == null
            ? null
            : json["automatic_stone_removal"],
        freeHandicapPlacement: json["free_handicap_placement"] == null
            ? null
            : json["free_handicap_placement"],
        agaHandicapScoring: json["aga_handicap_scoring"] == null
            ? null
            : json["aga_handicap_scoring"],
        allowKo: json["allow_ko"] == null ? null : json["allow_ko"],
        allowSuperko:
            json["allow_superko"] == null ? null : json["allow_superko"],
        superkoAlgorithm: json["superko_algorithm"] == null
            ? null
            : json["superko_algorithm"],
        playerPool: json["player_pool"] == null
            ? null
            : Map.from(json["player_pool"]).map((k, v) =>
                MapEntry<String, PlayerPool>(k, PlayerPool.fromJson(v))),
        scoreTerritory:
            json["score_territory"] == null ? null : json["score_territory"],
        scoreTerritoryInSeki: json["score_territory_in_seki"] == null
            ? null
            : json["score_territory_in_seki"],
        scoreStones: json["score_stones"] == null ? null : json["score_stones"],
        scoreHandicap:
            json["score_handicap"] == null ? null : json["score_handicap"],
        scorePrisoners:
            json["score_prisoners"] == null ? null : json["score_prisoners"],
        scorePasses: json["score_passes"] == null ? null : json["score_passes"],
        whiteMustPassLast: json["white_must_pass_last"] == null
            ? null
            : json["white_must_pass_last"],
        opponentPlaysFirstAfterResume:
            json["opponent_plays_first_after_resume"] == null
                ? null
                : json["opponent_plays_first_after_resume"],
        strictSekiMode:
            json["strict_seki_mode"] == null ? null : json["strict_seki_mode"],
        initialState: json["initial_state"] == null
            ? null
            : InitialState.fromJson(json["initial_state"]),
        startTime: json["start_time"] == null ? null : json["start_time"],
        originalDisableAnalysis: json["original_disable_analysis"] == null
            ? null
            : json["original_disable_analysis"],
        clock: json["clock"] == null ? null : Clock.fromJson(json["clock"]),
        autoScore: json["auto_score"] == null ? null : json["auto_score"],
      );

  Map<String, dynamic> toJson() => {
        "white_player_id": whitePlayerId == null ? null : whitePlayerId,
        "black_player_id": blackPlayerId == null ? null : blackPlayerId,
        "group_ids": groupIds == null
            ? null
            : List<dynamic>.from(groupIds!.map((x) => x)),
        "game_id": gameId == null ? null : gameId,
        "game_name": gameName == null ? null : gameName,
        "private": private == null ? null : private,
        "pause_on_weekends": pauseOnWeekends == null ? null : pauseOnWeekends,
        "players": players == null ? null : players?.toJson(),
        "ranked": ranked == null ? null : ranked,
        "disable_analysis": disableAnalysis == null ? null : disableAnalysis,
        "handicap": handicap == null ? null : handicap,
        "komi": komi == null ? null : komi,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "rules": rules == null ? null : rules,
        "rengo": rengo == null ? null : rengo,
        "rengo_teams": rengoTeams == null ? null : rengoTeams?.toJson(),
        "rengo_casual_mode": rengoCasualMode == null ? null : rengoCasualMode,
        "time_control": timeControl == null ? null : timeControl?.toJson(),
        "phase": phase == null ? null : phase,
        "initial_player": initialPlayer == null ? null : initialPlayer,
        "moves": moves == null
            ? null
            : List<dynamic>.from(
                moves!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "allow_self_capture":
            allowSelfCapture == null ? null : allowSelfCapture,
        "automatic_stone_removal":
            automaticStoneRemoval == null ? null : automaticStoneRemoval,
        "free_handicap_placement":
            freeHandicapPlacement == null ? null : freeHandicapPlacement,
        "aga_handicap_scoring":
            agaHandicapScoring == null ? null : agaHandicapScoring,
        "allow_ko": allowKo == null ? null : allowKo,
        "allow_superko": allowSuperko == null ? null : allowSuperko,
        "superko_algorithm": superkoAlgorithm == null ? null : superkoAlgorithm,
        "player_pool": playerPool == null
            ? null
            : Map.from(playerPool!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "score_territory": scoreTerritory == null ? null : scoreTerritory,
        "score_territory_in_seki":
            scoreTerritoryInSeki == null ? null : scoreTerritoryInSeki,
        "score_stones": scoreStones == null ? null : scoreStones,
        "score_handicap": scoreHandicap == null ? null : scoreHandicap,
        "score_prisoners": scorePrisoners == null ? null : scorePrisoners,
        "score_passes": scorePasses == null ? null : scorePasses,
        "white_must_pass_last":
            whiteMustPassLast == null ? null : whiteMustPassLast,
        "opponent_plays_first_after_resume":
            opponentPlaysFirstAfterResume == null
                ? null
                : opponentPlaysFirstAfterResume,
        "strict_seki_mode": strictSekiMode == null ? null : strictSekiMode,
        "initial_state": initialState == null ? null : initialState?.toJson(),
        "start_time": startTime == null ? null : startTime,
        "original_disable_analysis":
            originalDisableAnalysis == null ? null : originalDisableAnalysis,
        "clock": clock == null ? null : clock?.toJson(),
        "auto_score": autoScore == null ? null : autoScore,
      };
}

class Clock {
  Clock({
    required this.gameId,
    required this.currentPlayer,
    required this.blackPlayerId,
    required this.whitePlayerId,
    required this.title,
    required this.lastMove,
    required this.expiration,
    required this.blackTime,
    required this.whiteTime,
  });

  int gameId;
  int currentPlayer;
  int blackPlayerId;
  int whitePlayerId;
  String title;
  int lastMove;
  int expiration;
  Time? blackTime;
  Time? whiteTime;

  factory Clock.fromRawJson(String str) => Clock.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Clock.fromJson(Map<String, dynamic> json) => Clock(
        gameId: json["game_id"] == null ? null : json["game_id"],
        currentPlayer:
            json["current_player"] == null ? null : json["current_player"],
        blackPlayerId:
            json["black_player_id"] == null ? null : json["black_player_id"],
        whitePlayerId:
            json["white_player_id"] == null ? null : json["white_player_id"],
        title: json["title"] == null ? null : json["title"],
        lastMove: json["last_move"] == null ? null : json["last_move"],
        expiration: json["expiration"] == null ? null : json["expiration"],
        blackTime: json["black_time"] == null
            ? null
            : Time.fromJson(json["black_time"]),
        whiteTime: json["white_time"] == null
            ? null
            : Time.fromJson(json["white_time"]),
      );

  Map<String, dynamic> toJson() => {
        "game_id": gameId == null ? null : gameId,
        "current_player": currentPlayer == null ? null : currentPlayer,
        "black_player_id": blackPlayerId == null ? null : blackPlayerId,
        "white_player_id": whitePlayerId == null ? null : whitePlayerId,
        "title": title == null ? null : title,
        "last_move": lastMove == null ? null : lastMove,
        "expiration": expiration == null ? null : expiration,
        "black_time": blackTime == null ? null : blackTime?.toJson(),
        "white_time": whiteTime == null ? null : whiteTime?.toJson(),
      };
}

class Time {
  Time({
    required this.thinkingTime,
    required this.skipBonus,
  });

  int thinkingTime;
  bool skipBonus;

  factory Time.fromRawJson(String str) => Time.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        thinkingTime:
            json["thinking_time"] == null ? null : json["thinking_time"],
        skipBonus: json["skip_bonus"] == null ? null : json["skip_bonus"],
      );

  Map<String, dynamic> toJson() => {
        "thinking_time": thinkingTime == null ? null : thinkingTime,
        "skip_bonus": skipBonus == null ? null : skipBonus,
      };
}

class InitialState {
  InitialState({
    required this.black,
    required this.white,
  });

  String black;
  String white;

  factory InitialState.fromRawJson(String str) =>
      InitialState.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InitialState.fromJson(Map<String, dynamic> json) => InitialState(
        black: json["black"] == null ? null : json["black"],
        white: json["white"] == null ? null : json["white"],
      );

  Map<String, dynamic> toJson() => {
        "black": black == null ? null : black,
        "white": white == null ? null : white,
      };
}

class MoveClass {
  MoveClass({
    required this.blur,
  });

  int blur;

  factory MoveClass.fromRawJson(String str) =>
      MoveClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MoveClass.fromJson(Map<String, dynamic> json) => MoveClass(
        blur: json["blur"] == null ? null : json["blur"],
      );

  Map<String, dynamic> toJson() => {
        "blur": blur == null ? null : blur,
      };
}

class PlayerPool {
  PlayerPool({
    required this.username,
    required this.rank,
    required this.professional,
    required this.id,
  });

  String username;
  double rank;
  bool professional;
  int id;

  factory PlayerPool.fromRawJson(String str) =>
      PlayerPool.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerPool.fromJson(Map<String, dynamic> json) => PlayerPool(
        username: json["username"] == null ? null : json["username"],
        rank: json["rank"] == null ? null : json["rank"].toDouble(),
        professional:
            json["professional"] == null ? null : json["professional"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "rank": rank == null ? null : rank,
        "professional": professional == null ? null : professional,
        "id": id == null ? null : id,
      };
}

class Players {
  Players({
    required this.black,
    required this.white,
  });

  PlayerPool? black;
  PlayerPool? white;

  factory Players.fromRawJson(String str) => Players.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Players.fromJson(Map<String, dynamic> json) => Players(
        black:
            json["black"] == null ? null : PlayerPool.fromJson(json["black"]),
        white:
            json["white"] == null ? null : PlayerPool.fromJson(json["white"]),
      );

  Map<String, dynamic> toJson() => {
        "black": black == null ? null : black?.toJson(),
        "white": white == null ? null : white?.toJson(),
      };
}

class RengoTeams {
  RengoTeams({
    required this.black,
    required this.white,
  });

  List<dynamic>? black;
  List<dynamic>? white;

  factory RengoTeams.fromRawJson(String str) =>
      RengoTeams.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RengoTeams.fromJson(Map<String, dynamic> json) => RengoTeams(
        black: json["black"] == null
            ? null
            : List<dynamic>.from(json["black"].map((x) => x)),
        white: json["white"] == null
            ? null
            : List<dynamic>.from(json["white"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "black":
            black == null ? null : List<dynamic>.from(black!.map((x) => x)),
        "white":
            white == null ? null : List<dynamic>.from(white!.map((x) => x)),
      };
}

class TimeControl {
  TimeControl({
    required this.system,
    required this.timeControl,
    required this.speed,
    required this.pauseOnWeekends,
    required this.timeIncrement,
    required this.initialTime,
    required this.maxTime,
  });

  String system;
  String timeControl;
  String speed;
  bool pauseOnWeekends;
  int timeIncrement;
  int initialTime;
  int maxTime;

  factory TimeControl.fromRawJson(String str) =>
      TimeControl.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimeControl.fromJson(Map<String, dynamic> json) => TimeControl(
        system: json["system"] == null ? null : json["system"],
        timeControl: json["time_control"] == null ? null : json["time_control"],
        speed: json["speed"] == null ? null : json["speed"],
        pauseOnWeekends: json["pause_on_weekends"] == null
            ? null
            : json["pause_on_weekends"],
        timeIncrement:
            json["time_increment"] == null ? null : json["time_increment"],
        initialTime: json["initial_time"] == null ? null : json["initial_time"],
        maxTime: json["max_time"] == null ? null : json["max_time"],
      );

  Map<String, dynamic> toJson() => {
        "system": system == null ? null : system,
        "time_control": timeControl == null ? null : timeControl,
        "speed": speed == null ? null : speed,
        "pause_on_weekends": pauseOnWeekends == null ? null : pauseOnWeekends,
        "time_increment": timeIncrement == null ? null : timeIncrement,
        "initial_time": initialTime == null ? null : initialTime,
        "max_time": maxTime == null ? null : maxTime,
      };
}

class Block {
  Block({
    required this.blockChat,
    required this.blockGames,
  });

  bool blockChat;
  bool blockGames;

  factory Block.fromRawJson(String str) => Block.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Block.fromJson(Map<String, dynamic> json) => Block(
        blockChat: json["block_chat"] == null ? null : json["block_chat"],
        blockGames: json["block_games"] == null ? null : json["block_games"],
      );

  Map<String, dynamic> toJson() => {
        "block_chat": blockChat == null ? null : blockChat,
        "block_games": blockGames == null ? null : blockGames,
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.professional,
    required this.ranking,
    required this.rating,
    required this.deviation,
    required this.ratings,
    required this.country,
    required this.language,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.realNameIsPrivate,
    required this.about,
    required this.supporter,
    required this.uiClassExtra,
    required this.isModerator,
    required this.isSuperuser,
    required this.isTournamentModerator,
    required this.isBot,
    required this.timeoutProvisional,
    required this.botAi,
    required this.botOwner,
    required this.website,
    required this.icon,
    required this.registrationDate,
    required this.vacationLeft,
    required this.onVacation,
  });

  int id;
  String username;
  bool professional;
  double ranking;
  int rating;
  int deviation;
  Ratings? ratings;
  String country;
  String language;
  String name;
  String firstName;
  String lastName;
  bool realNameIsPrivate;
  String about;
  bool supporter;
  dynamic uiClassExtra;
  bool isModerator;
  bool isSuperuser;
  bool isTournamentModerator;
  bool isBot;
  bool timeoutProvisional;
  dynamic botAi;
  dynamic botOwner;
  String website;
  String icon;
  DateTime? registrationDate;
  int vacationLeft;
  bool onVacation;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        professional:
            json["professional"] == null ? null : json["professional"],
        ranking: json["ranking"] == null ? null : json["ranking"].toDouble(),
        rating: json["rating"] == null ? null : json["rating"],
        deviation: json["deviation"] == null ? null : json["deviation"],
        ratings:
            json["ratings"] == null ? null : Ratings.fromJson(json["ratings"]),
        country: json["country"] == null ? null : json["country"],
        language: json["language"] == null ? null : json["language"],
        name: json["name"] == null ? null : json["name"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        realNameIsPrivate: json["real_name_is_private"] == null
            ? null
            : json["real_name_is_private"],
        about: json["about"] == null ? null : json["about"],
        supporter: json["supporter"] == null ? null : json["supporter"],
        uiClassExtra: json["ui_class_extra"],
        isModerator: json["is_moderator"] == null ? null : json["is_moderator"],
        isSuperuser: json["is_superuser"] == null ? null : json["is_superuser"],
        isTournamentModerator: json["is_tournament_moderator"] == null
            ? null
            : json["is_tournament_moderator"],
        isBot: json["is_bot"] == null ? null : json["is_bot"],
        timeoutProvisional: json["timeout_provisional"] == null
            ? null
            : json["timeout_provisional"],
        botAi: json["bot_ai"],
        botOwner: json["bot_owner"],
        website: json["website"] == null ? null : json["website"],
        icon: json["icon"] == null ? null : json["icon"],
        registrationDate: json["registration_date"] == null
            ? null
            : DateTime.parse(json["registration_date"]),
        vacationLeft:
            json["vacation_left"] == null ? null : json["vacation_left"],
        onVacation: json["on_vacation"] == null ? null : json["on_vacation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "username": username == null ? null : username,
        "professional": professional == null ? null : professional,
        "ranking": ranking == null ? null : ranking,
        "rating": rating == null ? null : rating,
        "deviation": deviation == null ? null : deviation,
        "ratings": ratings == null ? null : ratings?.toJson(),
        "country": country == null ? null : country,
        "language": language == null ? null : language,
        "name": name == null ? null : name,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "real_name_is_private":
            realNameIsPrivate == null ? null : realNameIsPrivate,
        "about": about == null ? null : about,
        "supporter": supporter == null ? null : supporter,
        "ui_class_extra": uiClassExtra,
        "is_moderator": isModerator == null ? null : isModerator,
        "is_superuser": isSuperuser == null ? null : isSuperuser,
        "is_tournament_moderator":
            isTournamentModerator == null ? null : isTournamentModerator,
        "is_bot": isBot == null ? null : isBot,
        "timeout_provisional":
            timeoutProvisional == null ? null : timeoutProvisional,
        "bot_ai": botAi,
        "bot_owner": botOwner,
        "website": website == null ? null : website,
        "icon": icon == null ? null : icon,
        "registration_date": registrationDate == null
            ? null
            : registrationDate?.toIso8601String(),
        "vacation_left": vacationLeft == null ? null : vacationLeft,
        "on_vacation": onVacation == null ? null : onVacation,
      };
}

class Vs {
  Vs({
    required this.wins,
    required this.losses,
    required this.draws,
    required this.history,
  });

  int wins;
  int losses;
  int draws;
  List<dynamic>? history;

  factory Vs.fromRawJson(String str) => Vs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Vs.fromJson(Map<String, dynamic> json) => Vs(
        wins: json["wins"] == null ? null : json["wins"],
        losses: json["losses"] == null ? null : json["losses"],
        draws: json["draws"] == null ? null : json["draws"],
        history: json["history"] == null
            ? null
            : List<dynamic>.from(json["history"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "wins": wins == null ? null : wins,
        "losses": losses == null ? null : losses,
        "draws": draws == null ? null : draws,
        "history":
            history == null ? null : List<dynamic>.from(history!.map((x) => x)),
      };
}
