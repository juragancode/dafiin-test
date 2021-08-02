import 'package:flutter_application_53/controller/MyC.dart';
import 'package:get/get.dart';

class BindingMy implements Bindings{
  @override
  void dependencies() {
    Get.put(ControllerC());
  }
  
}