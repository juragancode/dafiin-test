import 'package:esemes/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Komunikasi menjadi mudah, cepat dan aman",
          body: "Terhubung dengan orang-orang melalui Smartphone kamu",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Center(
              child: Lottie.asset("assets/lottie/main-laptop-duduk.json"),
            ),
          ),
        ),
        PageViewModel(
          title: "Temukan teman baru",
          body: "Find, Chatting, Calling, with your friend",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Center(
              child: Lottie.asset("assets/lottie/ojek.json"),
            ),
          ),
        ),
        PageViewModel(
          title: "Es Em Es",
          body: "Chatting through The World",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Center(
              child: Lottie.asset("assets/lottie/65837-clouds-in-the-sky.json"),
            ),
          ),
        ),
        PageViewModel(
          title: "Gabung sekarang!",
          body: "Daftarkan diri anda agar selalu terhubung dengan teman-teman",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Center(
              child: Lottie.asset("assets/lottie/register.json"),
            ),
          ),
        ),
      ],
      onDone: () => Get.offAllNamed(Routes.LOGIN),
      showSkipButton: true,
      skip: Text("Skip"),
      next: Text(
        "Next",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      done: Text("Register", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
          size: Size.square(10.0),
          activeSize: Size(20.0, 10.0),
          color: Colors.black26,
          spacing: EdgeInsets.symmetric(horizontal: 3.0),
          activeColor: Colors.cyan),
    ));
  }
}
