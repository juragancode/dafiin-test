import 'package:avatar_glow/avatar_glow.dart';
import 'package:esemes/app/controllers/auth_controller.dart';
import 'package:esemes/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.cyan,
            ),
            onPressed: () => Get.back(),
          ),
          actions: [
            IconButton(
              onPressed: () => authC.logout(),
              icon: Icon(
                Icons.logout,
                color: Colors.cyan,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  AvatarGlow(
                    endRadius: 120,
                    glowColor: Colors.cyan,
                    duration: Duration(seconds: 3),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      height: Get.width * 0.45,
                      width: Get.width * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/logo/noimage.png"),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Dafin Overclock",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "dafinoc@gmail.com",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => Get.toNamed(Routes.UPDATE_STATUS),
                      leading: Icon(Icons.note_add_outlined),
                      title: Text(
                        "Update status",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
                      leading: Icon(Icons.person_rounded),
                      title: Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.color_lens_outlined),
                      title: Text(
                        "Change Theme",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      trailing: Text("Light"),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: context.mediaQueryPadding.bottom + 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Es Em Es",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "Ver 1.0.0",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
