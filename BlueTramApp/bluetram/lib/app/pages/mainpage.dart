import 'package:flutter/material.dart';

class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BlueTram Goban App'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          TextButton(
            child: Text('Websocket'),
            onPressed: () {
              Navigator.pushNamed(context, '/websocket');
            },
          ),
          TextButton(
            child: Text('Login'),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          TextButton(
            child: Text('bluetooth'),
            onPressed: () {
              Navigator.pushNamed(context, '/bluetooth');
            },
          ),
          TextButton(
            child: Text('robotcontrol'),
            onPressed: () {
              Navigator.pushNamed(context, '/robotcontrol');
            },
          ),
          TextButton(
            child: Text('goban'),
            onPressed: () {
              Navigator.pushNamed(context, '/goban');
            },
          ),
        ],
      )),
    );
  }
}
