void main(List<String> arguments) {
  var m = MonsterUcoa(status: UcoaStatus.confused);
  print('Hallo Ucoa');
  m
    ..move()
    ..eat();
}

enum UcoaStatus { normal, poisoned, confused }

class MonsterUcoa {
  final UcoaStatus status;
  MonsterUcoa({this.status = UcoaStatus.normal});
  void move() {
    switch (status) {
      case UcoaStatus.normal:
        print('Ucoa is Moving');
        break;
      case UcoaStatus.poisoned:
        print('Ucoa cannot move. Ucoa is Dying. Ucoa needs help');
        break;
      case UcoaStatus.confused:
        print('Ucoa is Spinning. Dart language is Confusing');
        break;
      default:
    }
  }

  void eat() {
    print('Ucoa is Eating Indomie');
  }
}
