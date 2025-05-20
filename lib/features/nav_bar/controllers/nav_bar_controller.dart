// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shuroo/core/utils/constants/app_sizer.dart';
//
// import '../../../core/utils/constants/icon_path.dart';
//
//
// class CreatorNavBarController extends GetxController {
//   final _selectedIndex = 0.obs;
//
//   int get currentIndex => _selectedIndex.value;
//
//   void changeIndex(int index) {
//     _selectedIndex.value = index;
//   }
//
//   final List<Widget> screens = const [
//     // CreatorHomeScreen(),
//     // EventScreen(),
//     // SettingsScreen(),
//     // CreatorProfile()
//
//   ];
//
//   final List<String> labels = const ['Home', 'Events', 'Settings', 'Profile'];
//
//   final List<Image> activeIcons = [
//     Image.asset(IconPath.home, height: 24.h, width: 24.w, fit: BoxFit.cover),
//     Image.asset(IconPath.favorites, height: 24.h, width: 24.w, fit: BoxFit.cover),
//     Image.asset(IconPath.add, height: 24.h, width: 24.w, fit: BoxFit.cover),
//     Image.asset(IconPath.jobs, height: 24.h, width: 24.w, fit: BoxFit.cover),
//   ];
//
//   final List<Image> inActiveIcons = [
//     Image.asset(IconPath.home, height: 26.h, width: 26.w, fit: BoxFit.cover),
//     Image.asset(IconPath., height: 26.h, width: 26.w, fit: BoxFit.cover),
//     Image.asset(IconPath.setting, height: 26.h, width: 26.w, fit: BoxFit.cover),
//     Image.asset(IconPath.profile, height: 26.h, width: 26.w, fit: BoxFit.cover),
//   ];
// }

import 'package:get/get.dart';
import 'package:shuroo/features/favorites/presentation/screen/favourite_screen.dart';
import 'package:shuroo/features/home/presentation/screen/home_screen.dart';
import 'package:shuroo/features/jobs/presentation/screen/job_details_screen.dart';
import 'package:shuroo/features/jobs/presentation/screen/job_screen.dart';
import 'package:shuroo/features/messages/presentation/screen/messages_screen.dart';
import 'package:shuroo/features/post_creation_repost_delete/presentation/screen/make_post_screen.dart';

class NavBarController extends GetxController {
  int selectedIndex = 0;
  int get currentIndex => selectedIndex;

  List screens = [
    HomeScreen(),
    FavouriteScreen(),
    MakePostScreen(),
    MessagesScreen(),
    JobScreen(),
  ];
  void changeIndex(int index) {
    if (selectedIndex == index) {
      return;
    }
    selectedIndex = index;
    update();
  }
  void backToHome() {
    changeIndex(0);
  }
}