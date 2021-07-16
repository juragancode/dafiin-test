import 'package:flutter/material.dart';
// ini class buatan saya
class UserProfile extends StatelessWidget {
final String name;
final String role;

UserProfile({this.name = "No Name", this.role = "No Role"});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage("https://image.flaticon.com/icons/png/512/64/64495.png"),
            fit: BoxFit.cover,
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "[" + role + "]",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]);
  }
}
