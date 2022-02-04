import 'package:flutter/material.dart';

import 'package:bluetram/app/services/loginpage.dart';
import 'package:bluetram/app/services/websocketpage.dart';
import 'package:bluetram/app/services/mainpage.dart';
//import 'package:bluetram/app/services/robotcontrol.dart';
import 'package:bluetram/app/services/bluetooth.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Mainpage(),
        '/websocket': (context) => Websocketpage(),
        '/login': (context) => Loginpage(),
        //'/cameracv': (context) => CameraCV(),
        '/bluetooth': (context) => Bluetooth(),
        //'/robotcontrol': (context) => RobotControl(),
      },
    ));
