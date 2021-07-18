import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                selectDate.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: selectDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    helpText: "Help",
                    cancelText: "Cancel",
                    confirmText: "Confirm",
                    fieldHintText: "Input Date",
                    fieldLabelText: "Date",
                    //  initialEntryMode: DatePickerEntryMode.input,
                    // initialDatePickerMode: DatePickerMode.year,
                  ).then((value) {
                    setState(() {
                      selectDate = value!;
                    });
                  });
                },
                child: Text("Atur Tanggal"))
          ],
        ),
      ),
    );
  }
}
