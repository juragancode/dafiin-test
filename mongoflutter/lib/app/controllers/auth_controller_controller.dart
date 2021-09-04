import 'package:get/get.dart';
import 'package:mongoflutter/app/data/models/user_model.dart';
import 'package:mongoflutter/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var user = User();
  Future<void> signup() async {
    Uri url = Uri.parse("http://localhost:9000/signup");
    var res = await http.post(url,
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: User());
    print(res.body);
    Get.offAllNamed(Routes.HOME);
  }

  Future<void> signin() async {
    Uri url = Uri.parse("http://localhost:9000/signin");
    var res = await http.post(url,
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: User());
    print(res.body);
    Get.offAllNamed(Routes.HOME);
  }
}
