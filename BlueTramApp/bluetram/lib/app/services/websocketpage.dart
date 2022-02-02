import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:bluetram/app/services/api_keys.dart';
import 'dart:async';

class Websocketpage extends StatefulWidget {
  const Websocketpage({
    Key? key,
  }) : super(key: key);

  @override
  _WebsocketpageState createState() => _WebsocketpageState();
}

class _WebsocketpageState extends State<Websocketpage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://online-go.com/socket.io/?transport=websocket'),
  );
  bool flagPingPong = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Websocket Play test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(labelText: 'gameid'),
                ),
              ),
              const SizedBox(height: 24),
              Form(
                child: TextFormField(
                  controller: _controller2,
                  decoration: const InputDecoration(labelText: 'move coords'),
                ),
              ),
              const SizedBox(height: 24),
              StreamBuilder(
                stream: _channel.stream,
                builder: (context, snapshot) {
                  return Text(snapshot.hasData
                      ? '${snapshot.data}'
                      : 'no answer from the socket');
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _joinGame,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _joinGame() async {
    //if the game id entered is kinda right (probably should add a proper check using Rest api stuff, here is a working http request that gives your active game ids in a list)
    /*
    GET {{baseUrl}}/api/v1/ui/overview HTTP/1.1
    ookie: _ga=GA1.2.411460519.1634910286; __stripe_mid=42904a63-6a54-4963-b572-a657db64ce0379b059; csrftoken=2LGUJl0blDvNHhbZqrg9EIlgR6yiEdhbJxQ7rmsep4pPF63KD2m14XAihbfIUF69; sessionid=uca1ww1etb23l3jvxsxfe24twf3yh6ql
    referer: https://online-go.com/overview
    content-type: application/json
    */
    if (_controller.text.isNotEmpty & isNumeric(_controller.text)) {
      await webAuthenticate(_channel);
      await webChatConnect(_channel);
      await webChatJoin(_channel);
      await webGameConnect(_channel);

      //if there is enough info for a new move and the button is pressed in a such occaciaon
      if (_controller2.text.isNotEmpty &
          RegExp(r'[a-t][a-t]').hasMatch(_controller2.text)) {
        _channel.sink.add(
            "420[\"game/move\",{\"game_id\":${_controller.text},\"player_id\":$playerId,\"move\":\"${_controller2.text}\",\"blur\":2646}]");
      }

      if (!flagPingPong) {
        Timer t = new Timer.periodic(new Duration(seconds: 10), (t) {
          _channel.sink.add(
              "42[\"net/ping\",{\"client\":${DateTime.now().toUtc().millisecondsSinceEpoch},\"latency\":0}]");
        });
        flagPingPong = true;
      }
    }
  }

  //I wanted to simplify the websocket string but could not dare to yet
  Future<void> webChatConnect(WebSocketChannel _channelq) async {
    _channelq.sink.add(
        "42[\"chat/connect\",{\"auth\":\"$chatAuth\",\"player_id\":$playerId,\"ranking\":24,\"username\":\"$botusername\",\"ui_class\":\"provisional\"}]");
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<void> webGameConnect(WebSocketChannel _channelq) async {
    _channelq.sink.add(
        "42[\"game/connect\",{\"game_id\":${_controller.text},\"player_id\":$playerId,\"chat\":true}]");
    await Future.delayed(Duration(milliseconds: 500));
  }

  //https://stackoverflow.com/a/24085491
  bool isNumeric(String s) {
    if (s == "") {
      return false;
    }
    return double.tryParse(s) != null;
  }

  Future<void> webChatJoin(WebSocketChannel _channelq) async {
    _channelq.sink
        .add("42[\"chat/join\",{\"channel\":\"game-${_controller.text}\"}]");
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<void> webAuthenticate(WebSocketChannel _channelq) async {
    _channelq.sink.add(
        "42[\"authenticate\",{\"auth\":\"$chatAuth\",\"player_id\":$playerId,\"username\":\"$botusername\",\"jwt\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhbm9ueW1vdXMiOmZhbHNlLCJpZCI6MTExMzI5MSwidXNlcm5hbWUiOiJCbHVlVHJhbUJvdCIsInJlZ2lzdHJhdGlvbl9kYXRlIjoiMjAyMi0wMS0yNiAxOTozMzo1MC4yMjE2MDgrMDA6MDAiLCJyYXRpbmdzIjp7InZlcnNpb24iOjUsIm92ZXJhbGwiOnsicmF0aW5nIjoxNTAwLCJkZXZpYXRpb24iOjM1MCwidm9sYXRpbGl0eSI6MC4wNn19LCJjb3VudHJ5IjoidW4iLCJwcm9mZXNzaW9uYWwiOmZhbHNlLCJyYW5raW5nIjoyNCwicHJvdmlzaW9uYWwiOjEsImNhbl9jcmVhdGVfdG91cm5hbWVudHMiOnRydWUsImlzX21vZGVyYXRvciI6ZmFsc2UsImlzX3N1cGVydXNlciI6ZmFsc2UsImlzX3RvdXJuYW1lbnRfbW9kZXJhdG9yIjpmYWxzZSwic3VwcG9ydGVyIjpmYWxzZSwic3VwcG9ydGVyX2xldmVsIjowLCJ0b3VybmFtZW50X2FkbWluIjpmYWxzZSwidWlfY2xhc3MiOiJwcm92aXNpb25hbCIsImljb24iOiJodHRwczovL3NlY3VyZS5ncmF2YXRhci5jb20vYXZhdGFyL2E3MTYzOWVmZjYyZmVlZmViZDU1Njk0YmIyY2Y2OGViP3M9MzImZD1yZXRybyIsImVtYWlsIjoiIiwiZW1haWxfdmFsaWRhdGVkIjp0cnVlLCJpc19hbm5vdW5jZXIiOmZhbHNlfQ.CsSIWaoBOG21NZGxoPXXVF_FGIfXDfcjxntXu6XbbVBXtDzc0igtxR3CJpu8tiajfX0ytcDmNsgpHW3pn8yg3sVsoikcn-HhzSu8TRc3m2hsp2Ip8Fqmuivf2TgZnmYW87rQ0xDTE-V-sV1u_vuKP_Cy3lsVGSGvG0Hv2p-LS0q3eWB4pYTlSI2VMGahKtdP7H4P6nNchTugw6tv1ALau0f2P5OkKcEWRjTdV5Y_cessF5_DuS_ADvZ_iBLvEU1-YM6sfFJvX7vf8PTuBcJd9JcjvYIIl0CnOPUwlnxxJtoq5eJC0IQZRK7yPruHVgTvbeHlLvi9oIoHA400ag_wpl2Dx3p83BbM2x9psQP1aQ3ow9eBMNTim-VzV-daJESkaLhDhWxA8abnjBhUIVxiUfDSq-LWTe3LJRx6wzMAO6Tz2E9_ODMGn7zJnBEzgfXg1vSFREcCRKcJgn8JWB-rNPOeRg2bBX1kUnDYcgG0M9uafI1d-2FooNiKenaETLz0ZdmyCgfyv6_N5gEbCedTb7Rh1G26vVcwttqPucpXzy5EgxxXX_Qf6dYsFR17IMk4vDSwOrhZ1Loeh-VTZmnMwooxsBI07BvwMB95ORXR9U9BsaKDv-bCIWzSPf9Hp_aMbSlBjp1wVwZPx-P_Ew4ORA6cABpYTe9sVvJ2zSGUmB4\",\"bid\":\"11169322200508036\",\"useragent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36\",\"language\":\"en\",\"language_version\":\"58c8b887e8ee257775982959aed01e1e\",\"client_version\":\"5.1-3897-g3a3deb80\"}]");
    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}
