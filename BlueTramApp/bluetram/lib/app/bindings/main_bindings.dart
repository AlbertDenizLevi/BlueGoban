import 'package:bluetram/app/controllers/game_controller.dart';

import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameController>(() => GameController());
    //Get.lazyPut<WebsocketController>(() => WebsocketController());
  }
}
