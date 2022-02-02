import 'package:flutter/material.dart';

import 'package:bluetram/app/services/loginpage.dart';
import 'package:bluetram/app/services/websocketpage.dart';
import 'package:bluetram/app/services/mainpage.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Mainpage(),
        '/websocket': (context) => Websocketpage(),
        '/login': (context) => Loginpage(),
        //'/cameracv': (context) => CameraCV(),
        //'/bluetooth'
        //'/robotcontrol'
      },
    ));
