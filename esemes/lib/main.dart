import 'package:esemes/app/controllers/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/errorpage.dart';
import 'app/utils/loadingpage.dart';
import 'app/utils/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return ErrorScreen();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Es Em Es",
            initialRoute: Routes.LOGIN,
            getPages: AppPages.routes,
          );
          // return FutureBuilder(
          //     future: Future.delayed(Duration(seconds: 2)),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.done) {
          //         return Obx(
          //           () => GetMaterialApp(
          //             debugShowCheckedModeBanner: false,
          //             title: "Es Em Es",
          //             initialRoute: authC.isSkipIntro.isTrue
          //                 ? authC.isAuth.isTrue
          //                     ? Routes.HOME
          //                     : Routes.LOGIN
          //                 : Routes.INTRODUCTION,
          //             getPages: AppPages.routes,
          //           ),
          //         );
          //       }
          //       return SplashScreen();
          //     });
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return LoadingScreen();
      },
    );
  }
}
