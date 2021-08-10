import 'package:dart_application_1/securebox.dart';

void main(List<String> arguments) {
  var box = SecureBox<Person>(Person('Dafin'), '123');

  print(box.getData('123')!.name);
}

class Person {
  final String name;

  Person(this.name);
}
