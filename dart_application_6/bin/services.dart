import 'user.dart';

class Services {
  Future<User> getUserData() async {
    // Asumsikan kita mengambil data dari database dan mengembalikan respon
    return User();
  }
}

class ServicesSingleton {
  static final ServicesSingleton _instance = ServicesSingleton._internal();

  ServicesSingleton._internal();
  factory ServicesSingleton() {
    return _instance;
  }

  Future<User> getUserData() async {
    // Asumsikan kita mengambil data dari database dan mengembalikan respon
    return User();
  }
}
