import 'package:flutter/material.dart';
import 'package:flutter_application_54/controller/auth.dart';
import 'package:flutter_application_54/controller/controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final c = Get.find<LoginC>();
  final auth = Get.find<AuthC>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login PAGE"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                autocorrect: false,
                controller: c.emailC,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => TextField(
                  autocorrect: false,
                  controller: c.passC,
                  obscureText: c.hidden.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () => c.hidden.toggle(),
                        icon: c.hidden.isTrue
                            ? Icon(Icons.remove_red_eye)
                            : Icon(Icons.remove_red_eye_outlined)),
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => CheckboxListTile(
                  value: c.remeberme.value,
                  onChanged: (value) => c.remeberme.toggle(),
                  title: Text("Remember Me"),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              ElevatedButton(
                  onPressed: () => auth.login(
                        c.emailC.text,
                        c.passC.text,
                        c.remeberme.value,
                      ),
                  child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
