import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tralever_module/ui/screen/chats/view/allmessages.dart';
import 'package:tralever_module/ui/screen/profile_screen/view/profile_screen.dart';
import 'package:tralever_module/ui/screen/settings_screen/view/settings_screen.dart';
import '../../ui/screen/Home_screen/view/home_screen.dart';
import '../../ui/screen/chats/view/chats_screen.dart';
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
List<Widget> navigationScreensWithHome = [
  const HomeScreen(),
  //AllMessages(),
  const ChatsScreen(),
  const ProfileScreen(),
  const SettingScreen(),
];

class NavigationTabContainModel {
  final String icon, name;

  NavigationTabContainModel({
    required this.icon,
    required this.name,
  });
}

///using this format
String chatListDate(String day) {
  var localDate = DateTime.parse(day);
  var inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
  var inputDate = inputFormat.parse(localDate.toString());
  var outputFormat = DateFormat("dd-MMM-yyyy");
  // var outputFormat = DateFormat("dd-MMM-yyyy |").add_jm();
  // .add_jm()
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}

///using this format
String chatListTime(String date) {
  var localDate = DateTime.parse(date).toLocal();
  var inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
  var inputDate = inputFormat.parse(localDate.toString());
  var outputFormat = DateFormat("h:mm a");

  var outputDate = outputFormat.format(inputDate);
  return outputDate;
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

enum DateTimeFormat { date, time }

String timeFormat(DateTime timestamp) {
  var outputFormat = DateFormat('h:mm a');
  var outputDate = outputFormat.format(timestamp);
  return outputDate;
}

extension DateTimeFormatExtension on DateTimeFormat {
  String get datePickerFormat {
    switch (this) {
      case DateTimeFormat.date:
        return 'yyyy-MMMM-dd';
      case DateTimeFormat.time:
        return "HH:mm";
    }
  }

  static String displayMSGTimeFromTimestamp(DateTime timestamp) {
    var v = DateTime.now().difference(timestamp);
    if (v.inHours < 24) {
      return timeFormat(timestamp);
    } else {
      var outputFormat = DateFormat('MM-dd-yyyy');
      var outputDate = outputFormat.format(timestamp);
      return outputDate;
    }
  }
}

AppBar appBar(
    {required String title,
    bool isBackButtonShow = true,
    List<Widget>? actions}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    leadingWidth: 50,
    automaticallyImplyLeading: false,
    leading: isBackButtonShow
        ? IconButton(
            splashRadius: 10,
            focusNode: FocusNode(canRequestFocus: false),
            enableFeedback: false,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          )
        : SizedBox(),
    //titleSpacing: 200,
    actions: actions == null ? [] : actions,
    title: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
    backgroundColor: Colors.white,
  );
}
