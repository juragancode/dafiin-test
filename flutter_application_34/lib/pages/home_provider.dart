import 'package:flutter/material.dart';
import 'package:flutter_application_34/models/http_provider.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("POST PROVIDER"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Consumer<HttpProvider>(builder: (context, value, child) => Text((value.data["id"] == null) ?
                  "ID: Belum Ada Data" : "ID : ${value.data["id"]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Text(
                "Name:",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
               child: Consumer<HttpProvider>(builder: (context, value, child) => Text((value.data["name"] == null) ?
                  "Belum Ada Data" : "${value.data["name"]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Text(
                "Job:",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Consumer<HttpProvider>(builder: (context, value, child) => Text((value.data["job"] == null) ?
                  "Belum Ada Data" : "${value.data["job"]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Text(
                "Creat at:",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Consumer<HttpProvider>(builder: (context, value, child) => Text((value.data["createdAt"] == null) ?
                  "Belum Ada Data" : "${value.data["createdAt"]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
                onPressed: () {
                  dataProvider.connectAPI("Dafin", "Analis Keuangan");
                },
                child: Text("POST", style: TextStyle(fontSize: 25)))
          ],
        ),
      ),
    );
  }
}
