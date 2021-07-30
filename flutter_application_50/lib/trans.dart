import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'title': 'Hallo, Good Evening %s ',
          'body': 'Home Screen View',
        },
        'id': {
          'title': 'Halaman Utama',
          'body': 'Tampilan Halaman Utama',
        },
      };
}
