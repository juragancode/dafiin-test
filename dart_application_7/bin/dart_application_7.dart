import 'dart:async';

void main(List<String> arguments) async {
  var user = User();
  var userManager = UserManager(LocalStorage());

  print(await userManager.getUserAge(user));
}

class User {
  int age = 0;
}

class UserManager {
  final IDatastorage datastorage;

  UserManager(this.datastorage);

  void saveData(User user) {
    datastorage.saveData(user);
  }

  FutureOr<int> getUserAge(User user) async {
    return await datastorage.getUserAge(user);
  }
}

abstract class IDatastorage {
  void saveData(User user);
  FutureOr<int> getUserAge(User user);
}

class FirebaseStorage implements IDatastorage {
  @override
  void saveData(User user) {
    // connect to Firebase
    // save data
  }

  @override
  Future<int> getUserAge(User user) async {
    // ambil data firebase
    await Future.delayed(Duration(seconds: 2));
    return 20;
  }
}

class LocalStorage implements IDatastorage {
  @override
  void saveData(User user) {
    // connect to Local Storage
    // save data
  }

  @override
  int getUserAge(User user) {
    // ambil tanggal lahir
    // bandingkan tanggal lahir dengan tanggal sekarang
    // hitung umurnya
    return 10;
  }
}
