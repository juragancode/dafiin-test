import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String id;
  String name;
  String job;
  String created;

  PostResult({required this.id, required this.name, required this.job, required this.created});
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'job': job,
      'created': created,
    };
  }

  factory PostResult.fromMap(Map<String, dynamic> map) {
    return PostResult(
      id: map['id'],
      name: map['name'],
      job: map['job'],
      created: map['created'],
    );
  }



  String toJson() => json.encode(toMap());

  factory PostResult.fromJson(String source) => PostResult.fromMap(json.decode(source));

  static void connectToAPI(String s, String t) {}
}
