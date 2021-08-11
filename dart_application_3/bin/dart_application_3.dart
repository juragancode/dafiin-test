void main(List<String> arguments) {
  var persons = <Person>[
    Person('Administrator', 32),
    Person('User', 42),
    Person('Administrator', 20),
    Person('Merchant', 35),
    Person('Administrator', 25),
    Person('User', 22),
    Person('Merchant', 32),
    Person('User', 15),
    Person('Merchant', 50),
  ];

  // persons.sort((p1, p2) {
  //   if (p1.role.compareTo(p2.role) != 0) {
  //     return p1.role.compareTo(p2.role);
  //   } else {
  //     return p1.age.compareTo(p2.age);
  //   }
  // });

  persons.sort((p1, p2) {
    if (p1.roleWeight - p2.roleWeight != 0) {
      return p1.roleWeight - p2.roleWeight;
    } else {
      return p1.age.compareTo(p2.age);
    }
  });

  persons.forEach((element) {
    print(element.role + ' - ' + element.age.toString());
  });
}

class Person {
  final String role;
  final int age;

  Person(this.role, this.age);

  int get roleWeight {
    switch (role) {
      case 'Merchant':
        return 1;
      case 'Administrator':
        return 2;
      default:
        return 3;
    }
  }

  // final String name;
  // final int age;

  // Person({required this.name, this.age = 0}) {
  //   // ignore: unnecessary_null_comparison
  //   assert(name != null, 'You must give the Person name');
  // }
}
