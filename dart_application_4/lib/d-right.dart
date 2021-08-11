class User {
  // Use related things
}

class UserManager {
  final IDatastorage datastorage;

  UserManager(this.datastorage);

  void saveData(User user) {
    datastorage.saveData(user);
  }
}

abstract class IDatastorage {
  void saveData(User user);
}

class FirebaseStorage implements IDatastorage {
  @override
  void saveData(User user) {
    // connect to Firebase
    // save data
  }
}

class LocalStorage implements IDatastorage {
  @override
  void saveData(User user) {
    // connect to Local Storage
    // save data
  }
}
