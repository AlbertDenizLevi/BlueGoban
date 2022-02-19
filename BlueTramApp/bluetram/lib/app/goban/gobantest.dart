import 'package:bluetram/app/services/gamemovewebsocket.dart';
import 'package:flutter/material.dart';
import 'package:bluetram/app/services/httpallmovesobject.dart';
import 'package:http/http.dart' as http;
import 'package:bluetram/app/goban/gobanboard.dart';
import 'package:bluetram/app/controllers/game_controller.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:bluetram/app/services/api_keys.dart';
import 'dart:async';

//TODO fix the immutable issue by making gameid and that boolean part of the game controller
Future<AllMoves> fetchAllMoves() async {
  //fetches a json that among MANY other things contains the move list of all the active games a player has
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
    throw Exception('Failed to load game');
  }
}

class GobanTest extends StatelessWidget {
  /* void play11() {//test code to check if set coord works
    gameController.setCoordValue(1, 1);
  } */

  void resetBoard() {
    //clears the board of stones
    gameController.resetBoard();
  }

  Future<int> setBoardFromGame(int selectedgame) async {
    //returns game id
    //selected game being the number of the active games
    final AllMoves allMoves = await fetchAllMoves();
    gameController.makeBoardFromMoveList(
        allMoves.activeGames![selectedgame].json!.moves!);
    return allMoves.activeGames![selectedgame].id;
  }

  Future<void> _joinGame(String gameid) async {
    //joins the first game on the active games list

    /*
    GET {{baseUrl}}/api/v1/ui/overview HTTP/1.1
    ookie: _ga=GA1.2.411460519.1634910286; __stripe_mid=42904a63-6a54-4963-b572-a657db64ce0379b059; csrftoken=2LGUJl0blDvNHhbZqrg9EIlgR6yiEdhbJxQ7rmsep4pPF63KD2m14XAihbfIUF69; sessionid=uca1ww1etb23l3jvxsxfe24twf3yh6ql
    referer: https://online-go.com/overview
    content-type: application/json
    */
    AllMoves allMoves = await fetchAllMoves();
    //String gameid = allMoves.activeGames![0].id.toString();
    String websocketIN = "test";
    await webAuthenticate(_channel);
    await webChatConnect(_channel);
    await webChatJoin(_channel, gameid);
    await webGameConnect(_channel, gameid);
    listenToOpponent();
    //if you have not started the pingpong of the websocket which keeps the socket alive, start it
    if (!flagPingPong) {
      while (true) {
        await Future.delayed(Duration(milliseconds: 10000));
        //every then seconds send a ping
        _channel.sink.add(
            "42[\"net/ping\",{\"client\":${DateTime.now().toUtc().millisecondsSinceEpoch},\"latency\":0}]");

        print(
            "42[\"net/ping\",{\"client\":${DateTime.now().toUtc().millisecondsSinceEpoch},\"latency\":0}]");
        flagPingPong = true;
      }
    }
  }

  //I wanted to simplify the websocket string but could not dare to yet
  Future<void> webChatConnect(WebSocketChannel _channelq) async {
    _channelq.sink.add(
        "42[\"chat/connect\",{\"auth\":\"$chatAuth\",\"player_id\":$playerId,\"ranking\":24,\"username\":\"$botusername\",\"ui_class\":\"provisional\"}]");
    await Future.delayed(Duration(milliseconds: 500));
    print("chat/connect");
  }

  Future<void> webGameConnect(WebSocketChannel _channelq, String gameid) async {
    _channelq.sink.add(
        "42[\"game/connect\",{\"game_id\":$gameid,\"player_id\":$playerId,\"chat\":true}]");
    await Future.delayed(Duration(milliseconds: 500));
    print("game/connect");
  }

  //https://stackoverflow.com/a/24085491
  bool isNumeric(String s) {
    if (s == "") {
      return false;
    }
    return double.tryParse(s) != null;
  }

  Future<void> webChatJoin(WebSocketChannel _channelq, String gameid) async {
    _channelq.sink.add("42[\"chat/join\",{\"channel\":\"game-$gameid\"}]");
    await Future.delayed(Duration(milliseconds: 500));
    print("chat/join");
  }

  Future<void> webAuthenticate(WebSocketChannel _channelq) async {
    _channelq.sink.add(
        "42[\"authenticate\",{\"auth\":\"$chatAuth\",\"player_id\":$playerId,\"username\":\"$botusername\",\"jwt\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhbm9ueW1vdXMiOmZhbHNlLCJpZCI6MTExMzI5MSwidXNlcm5hbWUiOiJCbHVlVHJhbUJvdCIsInJlZ2lzdHJhdGlvbl9kYXRlIjoiMjAyMi0wMS0yNiAxOTozMzo1MC4yMjE2MDgrMDA6MDAiLCJyYXRpbmdzIjp7InZlcnNpb24iOjUsIm92ZXJhbGwiOnsicmF0aW5nIjoxNTAwLCJkZXZpYXRpb24iOjM1MCwidm9sYXRpbGl0eSI6MC4wNn19LCJjb3VudHJ5IjoidW4iLCJwcm9mZXNzaW9uYWwiOmZhbHNlLCJyYW5raW5nIjoyNCwicHJvdmlzaW9uYWwiOjEsImNhbl9jcmVhdGVfdG91cm5hbWVudHMiOnRydWUsImlzX21vZGVyYXRvciI6ZmFsc2UsImlzX3N1cGVydXNlciI6ZmFsc2UsImlzX3RvdXJuYW1lbnRfbW9kZXJhdG9yIjpmYWxzZSwic3VwcG9ydGVyIjpmYWxzZSwic3VwcG9ydGVyX2xldmVsIjowLCJ0b3VybmFtZW50X2FkbWluIjpmYWxzZSwidWlfY2xhc3MiOiJwcm92aXNpb25hbCIsImljb24iOiJodHRwczovL3NlY3VyZS5ncmF2YXRhci5jb20vYXZhdGFyL2E3MTYzOWVmZjYyZmVlZmViZDU1Njk0YmIyY2Y2OGViP3M9MzImZD1yZXRybyIsImVtYWlsIjoiIiwiZW1haWxfdmFsaWRhdGVkIjp0cnVlLCJpc19hbm5vdW5jZXIiOmZhbHNlfQ.CsSIWaoBOG21NZGxoPXXVF_FGIfXDfcjxntXu6XbbVBXtDzc0igtxR3CJpu8tiajfX0ytcDmNsgpHW3pn8yg3sVsoikcn-HhzSu8TRc3m2hsp2Ip8Fqmuivf2TgZnmYW87rQ0xDTE-V-sV1u_vuKP_Cy3lsVGSGvG0Hv2p-LS0q3eWB4pYTlSI2VMGahKtdP7H4P6nNchTugw6tv1ALau0f2P5OkKcEWRjTdV5Y_cessF5_DuS_ADvZ_iBLvEU1-YM6sfFJvX7vf8PTuBcJd9JcjvYIIl0CnOPUwlnxxJtoq5eJC0IQZRK7yPruHVgTvbeHlLvi9oIoHA400ag_wpl2Dx3p83BbM2x9psQP1aQ3ow9eBMNTim-VzV-daJESkaLhDhWxA8abnjBhUIVxiUfDSq-LWTe3LJRx6wzMAO6Tz2E9_ODMGn7zJnBEzgfXg1vSFREcCRKcJgn8JWB-rNPOeRg2bBX1kUnDYcgG0M9uafI1d-2FooNiKenaETLz0ZdmyCgfyv6_N5gEbCedTb7Rh1G26vVcwttqPucpXzy5EgxxXX_Qf6dYsFR17IMk4vDSwOrhZ1Loeh-VTZmnMwooxsBI07BvwMB95ORXR9U9BsaKDv-bCIWzSPf9Hp_aMbSlBjp1wVwZPx-P_Ew4ORA6cABpYTe9sVvJ2zSGUmB4\",\"bid\":\"11169322200508036\",\"useragent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36\",\"language\":\"en\",\"language_version\":\"58c8b887e8ee257775982959aed01e1e\",\"client_version\":\"5.1-3897-g3a3deb80\"}]");
    await Future.delayed(Duration(milliseconds: 500));
    print("webauth");
  }

  Future<void> acceptPlay(String gameid) async {
    _channel.sink.add(
        "421[\"game/move\",{\"game_id\":$gameid,\"player_id\":$playerId,\"move\":\"${String.fromCharCode(97 + gameController.lastColumn)}${String.fromCharCode(97 + gameController.lastRow)}\",\"blur\":2646}]");

    print(
        "421[\"game/move\",{\"game_id\":$gameid,\"player_id\":$playerId,\"move\":\"${String.fromCharCode(97 + gameController.lastColumn)}${String.fromCharCode(97 + gameController.lastRow)}\",\"blur\":2646}]");
  }

  Future<void> listenToOpponent() async {
    var subscription = _channel.stream.listen((data) => {
          if (RegExp(
                  "42\\[\"game\\/[0-9]+\/move\",{\"game_id\":[0-9]+,\"move_number\":[0-9]*,\"move\":\\[[0-9]*,[0-9]*,[0-9]*\\]}\\]")
              .hasMatch(data))
            {
              //print("Opponent played a move");
              //final Gamemove gamemove = Gamemove.fromRawJson(websocketIN.substring(2));
              //It seems I am not able to parse the websocket like a json, the class I created for was for nothing, but I managed to edit the string to get the coords of the moves
              //print("found something")
              gameController.setStone(
                  int.parse(data
                      .substring(3, data.length - 3)
                      .split("[")[1]
                      .split(",")[0]),
                  int.parse(data
                      .substring(3, data.length - 3)
                      .split("[")[1]
                      .split(",")[1]))
            }
          else
            print("${data.toString()}") //print(data.toString())
        });
  }

  GobanTest({Key? key}) : super(key: key);
  final GameController gameController = Get.find<GameController>();
  bool flagPingPong = false;
  int gameid = 0;
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://online-go.com/socket.io/?transport=websocket'),
  );

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
              onPressed: () async => {gameid = await setBoardFromGame(0)},
              child: Text("Set game 0")),
          TextButton(
              onPressed: () async => {_joinGame(gameid.toString())},
              child: Text("Join Game")),
          TextButton(
              onPressed: () async => {await acceptPlay(gameid.toString())},
              child: Text("Play")),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();

    //super.dispose();
  }
}
