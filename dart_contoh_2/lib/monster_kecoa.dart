import 'package:dart_contoh_2/flying_monster.dart';
import 'package:dart_contoh_2/monster.dart';

class Kecoa extends Monster implements FlyingMonster {
  @override
  String fly() => 'Syuungg...';

  @override
  String move() {
    return 'Merayap-rayap lamban';
  }
}
