import 'package:flutter/material.dart';
import 'package:flutter_application_7/Main_Scaffold.dart';
import 'package:provider/provider.dart';
import 'Theme_Provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          title: 'Flutter Provider Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(brightness: Brightness.dark),
          ),
          home: MainScaffold(),
        ),
      ),
    );
  }
}
