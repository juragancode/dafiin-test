import 'package:flutter/material.dart';
import 'package:flutter_login/Screens/Login/login_screen.dart';
import 'package:flutter_login/Screens/Signup/signup_screen.dart';
import 'package:flutter_login/Screens/Welcome/components/background.dart';
import 'package:flutter_login/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "WELCOME TO EDU",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 0.005),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: height * 0.2,
            ),
            SizedBox(height: height * 0.005),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
