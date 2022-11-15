import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:tralever_module/ui/screen/chats/view/chats_screen.dart';
import 'package:tralever_module/ui/screen/profile_screen/view/profile_screen.dart';
import 'package:tralever_module/ui/screen/settings_screen/view/settings_screen.dart';

import '../../ui/screen/Home_screen/view/home_screen.dart';
import '../../ui/screen/login/view/splash_screen.dart';
import '../../ui/shared/image_picker_controller.dart';
import '../../ui/shared/user_controller.dart';
import '../constant/app_icons.dart';

UserController userController = Get.put(UserController());
String initialRoute = SplashScreen.routeName;
late AppImagePicker appImagePicker;
//
int initialTab = 0;
// bool isGuestUser = false;

globalVerbInit() {
  appImagePicker = AppImagePicker();
}

final List<NavigationTabContainModel> navigationTabList = [
  NavigationTabContainModel(icon: AppIcons.homeIcon, name: "Home"),
  NavigationTabContainModel(icon: AppIcons.chatIcon, name: "Chats"),
  NavigationTabContainModel(icon: AppIcons.profileIcon, name: "Profile"),
  NavigationTabContainModel(icon: AppIcons.settingIcon, name: "Settings"),
];
List<Widget> navigationScreensWithHome = const [
  HomeScreen(),
  ChatsScreen(),
  ProfileScreen(),
  SettingScreen(),
];

class NavigationTabContainModel {
  final String icon, name;

  NavigationTabContainModel({
    required this.icon,
    required this.name,
  });
}

String dayFormatConverter(String day) {
  var dateFormat =
      DateFormat("DD-MMM-YYYY HH:MM aa"); // you can change the format here
  var utcDate =
      dateFormat.format(DateTime.parse(day)); // pass the UTC time here
  var localDate = dateFormat.parse(utcDate, true).toLocal().toString();
  var output =
      DateFormat('DD-MMM-YYYY|HH:MM a').format(DateTime.parse(localDate));
  // var output = DateFormat('EEEE, dd MMMM yyyy').format(input);
  return output;
}

// String dayFormatConverter(String? day) {
//   var input = DateFormat('yyyy-MM-dd hh:mm').parse(day!);
// //  var output = DateFormat('dd MMM, yy hh:mm a').format(input);
//   var output = DateFormat('EEEE, dd MMMM yyyy').format(input);
//   return output;
// }
//
// DateTime hoverMinutes(String? day) {
//   var input = DateFormat('HH:MM').parse(day!);
//   // var output = DateFormat('EEEE, dd MMMM yyyy').format(input);
//   return input;
// }
//
// DateTime monthDate(String? day) {
//   var input = DateFormat('MMM:DD').parse(day!);
// //  var output = DateFormat('EEEE, dd MMMM yyyy').format(input);
//   return input;
// }
//
// DateTime monthDateYear(String? day) {
//   var input = DateFormat('MM/DD/YYYY').parse(day!);
//   // var output = DateFormat('EEEE, dd MMMM yyyy').format(input);
//   //  return output;
//   return input;
// }
//
// String monthDateYearAndTime(String? day) {
//   var input = DateFormat('DD-MM-YYYY | HH:MM').parse(day!);
//   var output = DateFormat('EEEE, dd MMMM yyyy').format(input);
//   //  return output;
//   return output;
// }
