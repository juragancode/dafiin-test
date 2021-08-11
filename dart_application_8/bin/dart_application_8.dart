void main(List<String> arguments) {
  // dynamic myDynamic;

  // myDynamic = Person();
  // if (myDynamic is Person) {
  //   print(myDynamic.name);
  // }

  var myVar = Person();

  print(myVar.name);
}

class Person {
  String name = 'Hajri';
}
