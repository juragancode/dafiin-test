import 'package:get/get.dart';

import '../controllers/room_chats_controller.dart';

class RoomChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomChatsController>(
      () => RoomChatsController(),
    );
  }
}
