import 'package:dart_contoh_2/monster.dart';

class UburUbur extends Monster {
  String swim() => 'Wossh.. Wossh..';

  @override
  String eatHuman() {
    return 'Sedot...sedot asyik';
  }

  @override
  String move() {
    return 'Berenang-renang';
  }
}
