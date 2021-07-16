import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("ClipPath"),
        ),
        body: Center(
            child: ClipPath(
          clipper: MyClipper(),
          child: Image(
              width: 300,
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1611307742746-43cbea512c37?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmF0dXJlJTIwbGFuZHNjYXBlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80")),
        )),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.75, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
