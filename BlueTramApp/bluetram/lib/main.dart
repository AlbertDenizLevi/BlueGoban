import 'package:bluetram/app/bindings/main_bindings.dart';
import 'package:flutter/material.dart';

import 'package:bluetram/app/pages/loginpage.dart';
import 'package:bluetram/app/pages/websocketpage.dart';
import 'package:bluetram/app/pages/mainpage.dart';
//import 'package:bluetram/app/services/robotcontrol.dart';
import 'package:bluetram/app/bluetoothstuff/bluetooth.dart';
import 'package:bluetram/app/goban/gobantest.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
        initialBinding: MainBindings(),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => Mainpage()),
          GetPage(name: '/websocket', page: () => Websocketpage()),
          GetPage(name: '/bluetooth', page: () => Bluetooth()),
          GetPage(name: '/goban', page: () => GobanTest())
        ] /*
      routes: {
        '/': (context) => Mainpage(),
        '/websocket': (context) => Websocketpage(),
        '/login': (context) => Loginpage(),
        //'/cameracv': (context) => CameraCV(),
        '/bluetooth': (context) => Bluetooth(),
        //'/robotcontrol': (context) => RobotControl(),
        '/goban': (context) => GobanTest(), 
      },*/
        ));
