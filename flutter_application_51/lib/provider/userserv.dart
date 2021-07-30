import 'dart:convert';

import 'package:get/get.dart';

class UserProvider extends GetConnect {
  final url =
      "https://getconnect-28f05-default-rtdb.asia-southeast1.firebasedatabase.app/";

  Future<Response> getUser(int id) => get('http://youapi/users/$id');

  Future<Response> postData(
    String name,
    String email,
    String phone,
  ) {
    final body = json.encode({
      "name": name,
      "email": email,
      "phone": phone,
    });
    return post(url + "users.json", body);
  }

  Future<Response> deleteData(String id) {
    return delete(url + "users/$id.json");
  }

  Future<Response> editData(
    String id,
    String name,
    String email,
    String phone,
  ) {
    final body = json.encode({
      "name": name,
      "email": email,
      "phone": phone,
    });

    return patch(url + "users/$id.json", body);
  }
}
