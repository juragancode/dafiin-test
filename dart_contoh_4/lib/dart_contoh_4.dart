class Person {
  String name = 'Default name';
  void getData() {
    name = 'Dafin';
    print('get data [done]');
  }

  Future<void> getDataAsync() async {
    await Future.delayed(Duration(seconds: 3));
    name = 'Dafin';
    print('get data [done]');
  }

//   String name;
//   int age;
//   static int maxAge = 150;

  // Function(String name) doingHobby;
//   Person(this.name, int age) {
//     this.age = (age > 150) ? 150 : age;
//   }
//
}
