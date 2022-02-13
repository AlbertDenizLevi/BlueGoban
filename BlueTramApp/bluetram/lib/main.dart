import 'package:flutter/material.dart';

import 'package:bluetram/app/pages/loginpage.dart';
import 'package:bluetram/app/pages/websocketpage.dart';
import 'package:bluetram/app/pages/mainpage.dart';
//import 'package:bluetram/app/services/robotcontrol.dart';
import 'package:bluetram/app/bluetoothstuff/bluetooth.dart';
import 'package:bluetram/app/goban/gobantest.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Mainpage(),
        '/websocket': (context) => Websocketpage(),
        '/login': (context) => Loginpage(),
        //'/cameracv': (context) => CameraCV(),
        '/bluetooth': (context) => Bluetooth(),
        //'/robotcontrol': (context) => RobotControl(),
        '/goban': (context) => GobanTest(),
      },
    ));
