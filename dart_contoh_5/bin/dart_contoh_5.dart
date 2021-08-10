const pi = 3.14;
void main(List<String> arguments) {
  var a = const ConstClass(number: 5);
  var b = const ConstClass(number: 5);

  print(identical(a, b));
  print(pi);
}

class RegularClass {
  final int number;
  static const myConst = 12;

  RegularClass({required this.number}) {
    const anotherConst = 14;
    print(anotherConst);
  }
}

class ConstClass {
  final int number;
  const ConstClass({required this.number});
}
