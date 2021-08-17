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
                    endRadius: 130,
                    glowColor: Color.fromARGB(
                      255,
                      250,
                      0,
                      100,
                    ),
                    duration: Duration(seconds: 3),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      height: Get.width * 0.45,
                      width: Get.width * 0.45,
                      child: Obx(
                        () => ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: authC.user.value.photoUrl == 'noimage'
                              ? Image.asset(
                                  "assets/logo/noimage.png",
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  authC.user.value.photoUrl!,
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      "${authC.user.value.name}",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    "${authC.user.value.email}",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${authC.user.value.status}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.lightBlue.shade900,
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
                      leading: Icon(Icons.update, color: Colors.cyan),
                      title: Text(
                        "Update status",
                        style: TextStyle(color: Colors.cyan, fontSize: 22),
                      ),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
                      leading: Icon(Icons.person_rounded, color: Colors.cyan),
                      title: Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.cyan, fontSize: 22),
                      ),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      onTap: () {},
                      leading:
                          Icon(Icons.color_lens_outlined, color: Colors.cyan),
                      title: Text(
                        "Change Theme",
                        style: TextStyle(fontSize: 22, color: Colors.cyan),
                      ),
                      trailing: Text(
                        "Light",
                        style: TextStyle(fontSize: 14, color: Colors.cyan),
                      ),
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
                    style: TextStyle(
                        color: Colors.cyan, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Ver 1.0.0",
                    style: TextStyle(
                        color: Colors.cyan, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
