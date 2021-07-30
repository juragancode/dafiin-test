import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Home Page",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shadowColor: Colors.blue,
                  minimumSize: Size(100, 40),
                  onSurface: Colors.teal,
                  elevation: 15,
                  side: BorderSide(width: 3, color: Colors.cyan),
                  primary: Colors.cyan,
                  shape: StadiumBorder(),
                  backgroundColor: Colors.purple[200]),
              onPressed: () => Get.to(() => CountPage()),
              child: Text(
                "Next",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CountPage extends StatelessWidget {
  final count = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "$count",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Get.putAsync<SharedPreferences>(() async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setInt('counter', 123456);

            count.value = prefs.getInt('counter')!.toInt();
            return prefs;
          });
        },
      ),
    );
  }
}
