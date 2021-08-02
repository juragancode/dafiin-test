import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => Get.to(() => SecondPage(),
                arguments: "Argument from Home Page"),
            child: Text("Second Page")),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${Get.routing.current}",
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () => Get.to(() => OtherPage()),
                child: Text("Other Page")),
          ],
        ),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Other Page"),
            Text(
              "${Get.previousRoute}",
              textAlign: TextAlign.center,
            ),
            Text(
              "${Get.isSnackbarOpen}",
              textAlign: TextAlign.center,
            ),
            Text(
              GetPlatform.isDesktop ? "Ini Desktop" : "Ini Bukan Desktop",
              textAlign: TextAlign.center,
            ),
            Text(
              "Height: ${Get.height}",
              textAlign: TextAlign.center,
            ),
            Text(
              "Width: ${Get.width}",
              textAlign: TextAlign.center,
            ),
             Text(
              "Orientation: ${context.orientation}",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // print("Snackbar Status Open: ${Get.isSnackbarOpen}");
        // Get.snackbar("Title", "This is Message");
        // print("Snackbar Status Open: ${Get.isSnackbarOpen}");
        // Get.removeRoute(Get.rawRoute!);
        Get.until((route) => Get.currentRoute == '/');
      }),
    );
  }
}
