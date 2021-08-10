import 'package:dart_contoh_4/dart_contoh_4.dart';

void main(List<String> arguments) async {
  var p = Person();
  print('Job 1');
  print('Job 2');
  await p.getDataAsync().then((_) {
    print('Job 3 : ${p.name}');
  });

  print('Job 4');

//   var p = Person('Zhao Zhenyi', 170);

//   print(Person.maxAge);
}

// void davidHobby(String name) {
//   print('$name is Swimming');
// }
