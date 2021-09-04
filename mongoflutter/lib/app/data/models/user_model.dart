// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.name,
    this.email,
    this.password,
    this.profilePicture,
    this.coverPhoto,
    this.following,
    this.followers,
  });

  String? name;
  String? email;
  String? password;
  String? profilePicture;
  String? coverPhoto;
  List<dynamic>? following;
  List<dynamic>? followers;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        profilePicture: json["profilePicture"],
        coverPhoto: json["coverPhoto"],
        following: List<dynamic>.from(json["following"].map((x) => x)),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "profilePicture": profilePicture,
        "coverPhoto": coverPhoto,
        "following": List<dynamic>.from(following!.map((x) => x)),
        "followers": List<dynamic>.from(followers!.map((x) => x)),
      };
}
