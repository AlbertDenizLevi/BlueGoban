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
          GetPage(
              name: '/',
              page: () => Mainpage(),
              binding:
                  MainBindings()), //just the buttons for all the pages below, want to make this a side menu
          GetPage(
              name: '/websocket',
              page: () =>
                  Websocketpage()), //connect to the websocket of online-go.com, every move reconnects
          GetPage(
              name: '/bluetooth',
              page: () =>
                  Bluetooth()), //completely copied then simlified from the flutter blue serializable's example code
          GetPage(
              name: '/goban',
              page: () => GobanTest(),
              binding:
                  MainBindings()), //currently used for everything, from goban itself to online play to json parsiing
          GetPage(
              name: '/login',
              page: () =>
                  Loginpage()), //currently used for testing json parsing
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
