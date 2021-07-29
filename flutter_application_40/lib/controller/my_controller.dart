import 'package:get/state_manager.dart';

class MyController extends GetxController{
  var count = 0.obs;

  void change() => count++;
  void reset() => count.value = 0;


  @override
  void onInit() {
    print("oninit");

    ever(count, (_)=> print("dijalankan"));
    super.onInit();
  }
}