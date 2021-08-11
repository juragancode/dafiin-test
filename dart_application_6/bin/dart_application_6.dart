import 'services.dart';

void main(List<String> arguments) async {
  var services1 = ServicesSingleton();
  var services2 = ServicesSingleton();

  if (services1 == services2) {
    print('Sama');
  } else {
    print('Beda');
  }
}
