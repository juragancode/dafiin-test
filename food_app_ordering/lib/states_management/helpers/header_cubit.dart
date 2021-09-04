import 'package:bloc/bloc.dart';
import 'package:food_app_ordering/models/Header.dart';

class HeaderCubit extends Cubit<Header> {
  HeaderCubit() : super(Header('', ''));

  update(String title, String imageUrl) => emit(Header(title, imageUrl));
}
