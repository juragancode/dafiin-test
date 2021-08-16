import 'package:get/get.dart';

import 'package:esemes/app/modules/contact_list/bindings/contact_list_binding.dart';
import 'package:esemes/app/modules/contact_list/views/contact_list_view.dart';
import 'package:esemes/app/modules/edit_profile/bindings/edit_profile_binding.dart';
import 'package:esemes/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:esemes/app/modules/home/bindings/home_binding.dart';
import 'package:esemes/app/modules/home/views/home_view.dart';
import 'package:esemes/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:esemes/app/modules/introduction/views/introduction_view.dart';
import 'package:esemes/app/modules/login/bindings/login_binding.dart';
import 'package:esemes/app/modules/login/views/login_view.dart';
import 'package:esemes/app/modules/profile/bindings/profile_binding.dart';
import 'package:esemes/app/modules/profile/views/profile_view.dart';
import 'package:esemes/app/modules/room_chats/bindings/room_chats_binding.dart';
import 'package:esemes/app/modules/room_chats/views/room_chats_view.dart';
import 'package:esemes/app/modules/update_status/bindings/update_status_binding.dart';
import 'package:esemes/app/modules/update_status/views/update_status_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_LIST,
      page: () => ContactListView(),
      binding: ContactListBinding(),
    ),
    GetPage(
      name: _Paths.ROOM_CHATS,
      page: () => RoomChatsView(),
      binding: RoomChatsBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_STATUS,
      page: () => UpdateStatusView(),
      binding: UpdateStatusBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
  ];
}
