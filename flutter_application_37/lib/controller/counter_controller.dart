import 'package:get/state_manager.dart';

class CounterController extends GetxController{
  var counter = 0.obs;

  var isDark = false.obs;

  void changeTheme() => isDark.value = !isDark.value;

  void increment() => counter + 1;
}