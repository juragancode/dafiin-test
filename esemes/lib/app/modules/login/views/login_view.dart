import 'package:esemes/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.width * 0.6,
                height: Get.width * 0.6,
                child: Lottie.asset("assets/lottie/login.json"),
              ),
              SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () => authC.login(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/logo/google.png")),
                            border: Border.all(width: 2, color: Colors.black),
                            shape: BoxShape.circle,
                            color: Colors.red.shade900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: Text("Login With Google",
                            style: GoogleFonts.robotoSlab(
                                fontSize: 21,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      elevation: 10,
                      side: BorderSide(width: 3, color: Colors.black),
                      minimumSize: Size(100, 100),
                      primary: Color.fromARGB(255, 255, 10, 20)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "~ Esemes Messenger ~",
                    style: GoogleFonts.pacifico(),
                  ),
                  Text(
                    "- ver. 1.0.0 -",
                    style: GoogleFonts.pacifico(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
