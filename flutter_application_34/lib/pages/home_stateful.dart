import 'package:flutter/material.dart';
import 'package:flutter_application_34/models/http_stateful.dart';

class HomeStateful extends StatefulWidget {
  const HomeStateful({Key? key}) : super(key: key);

  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  HttpStateful dataResponse = HttpStateful(createdAt: "createdAt", id: "id", name: "name", job: "job");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POST STATEFUL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                (dataResponse.id == null) ? "ID: Belum Ada Data" : "ID: ${dataResponse.id}",
                style: TextStyle(fontSize: 20),
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
              child: Text(
                (dataResponse.id == null) ? "Belum Ada Data" : "${dataResponse.name}",
                style: TextStyle(fontSize: 20),
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
              child: Text(
                (dataResponse.id == null) ? "Belum Ada Data" : "${dataResponse.job}",
                style: TextStyle(fontSize: 20),
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
              child: Text(
                (dataResponse.id == null) ? "Belum Ada Data" : "${dataResponse.createdAt}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
                onPressed: () {
                  HttpStateful.connectAPI("Kroger", "Developer").then((value) {
                    print(value.name);
                    setState(() {
                      dataResponse = value;
                    });
                  });
                },
                child: Text("POST", style: TextStyle(fontSize: 25)))
          ],
        ),
      ),
    );
  }
}
