import 'package:dart_contoh_2/monster.dart';
import 'package:dart_contoh_2/monster_kecoa.dart';
import 'package:dart_contoh_2/monster_ubur-ubur.dart';

void main(List<String> argument) async {
  List<Monster> monsters = [];
  monsters.add(UburUbur());
  monsters.add(Kecoa());
  monsters.add(UburUbur());

  for (var m in monsters) {
    if (m is UburUbur) {
      print(m.swim());
    }
  }
}
