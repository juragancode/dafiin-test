import 'package:dart_contoh_2/flying_monster.dart';
import 'package:dart_contoh_2/monster_ubur-ubur.dart';

class Ucoa extends UburUbur implements FlyingMonster {
  @override
  String fly() {
    return 'Terbang-terbang melayang';
  }
}
