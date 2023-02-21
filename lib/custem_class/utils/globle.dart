import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tralever_module/custem_class/utils/local_storage.dart';
import 'package:tralever_module/ui/screen/chats/view/chats_screen.dart';
import 'package:tralever_module/ui/screen/profile_screen/view/profile_screen.dart';
import 'package:tralever_module/ui/screen/settings_screen/view/settings_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/screen/Home_screen/view/home_screen.dart';
import '../../ui/shared/image_picker_controller.dart';
import '../../ui/shared/user_controller.dart';
import '../constant/app_icons.dart';

UserController userController = Get.put(UserController());
// String initialRoute = SplashScreen.routeName;
// String initialRoute =
//     LocalStorage.getUserDetail() ? BaseScreen.routeName : LoginScreen.routeName;
late AppImagePicker appImagePicker;
bool isFromItineraray = false;
String? currentTimezone;
int initialTab = 0;
// bool isGuestUser = false;
String? accessTokenBackup;

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

enum SETTING_SCREEN {
  ABOUT,
  TERMS_CONDITION,
  PRIVACY_POLICY
}


extension SETTING_SCREEN_Extension on SETTING_SCREEN {
  int? get screenType {
    switch (this) {
      case SETTING_SCREEN.ABOUT:
        return 1;
      case SETTING_SCREEN.TERMS_CONDITION:
        return 2;
      case SETTING_SCREEN.PRIVACY_POLICY:
        return 3;
      default:
        return null;
    }
  }
}

enum TypeOFNOTIFICATIONS {
  ADMIN,
  MESSAGE,
  CANCEL_REQUEST,
  ITINERARY_EDITED,
  ASSIGN_SPECIALIST,
  ITINERARY_SUBMITTED
}

extension TypeOfNOTIFICATIONSExtension on TypeOFNOTIFICATIONS {
  int? get notificationType {
    switch (this) {
      case TypeOFNOTIFICATIONS.ADMIN:
        return 1;
      case TypeOFNOTIFICATIONS.MESSAGE:
        return 2;
      case TypeOFNOTIFICATIONS.CANCEL_REQUEST:
        return 3;
      case TypeOFNOTIFICATIONS.ITINERARY_EDITED:
        return 4;
      case TypeOFNOTIFICATIONS.ASSIGN_SPECIALIST:
        return 5;
      case TypeOFNOTIFICATIONS.ITINERARY_SUBMITTED:
        return 6;
      default:
        return null;
    }
  }
}

///using this format
String chatListDate(String day) {
  if (day.isEmpty) {
    return "";
  }
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

String getItineraryDate(String date) {
  var localDate = DateTime.parse(date);
  // .toLocal();

  var inputFormat = DateFormat('yyyy-MM-dd');
  var inputDate = inputFormat.parse(localDate.toString());

  var outputFormat = DateFormat('MM/dd/yyyy');
  var outputDate = outputFormat.format(inputDate);
  print('OUTPUT_DATE-->${outputDate.toString()}');
  return outputDate.toString();
}

String getItineraryTime(String time) {
  var localTime = DateTime.parse(time);
  // .toLocal();

  var inputFormat = DateFormat('yyyy-MM-dd');
  var inputTime = inputFormat.parse(localTime.toString());

  var outputFormat = DateFormat('HH:mm');
  var outputTime = outputFormat.format(localTime);
  print('OUTPUT_TIME--->${outputTime}');
  return outputTime.toString();
}

///* nov 23 dayConverter:
String dayConverter(String day) {
  var localDate = DateTime.parse(day).toLocal();
  var inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
  var inputDate = inputFormat.parse(localDate.toString());
  var outputFormat = DateFormat("MMM dd");
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}

///* Ferry,Flight and Train Date-Time:

String dateAndTimeConverter(String date) {
  var localDate = DateTime.parse(date).toLocal();
  var inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
  var inputDate = inputFormat.parse(localDate.toString());
  var outputFormat = DateFormat("dd-MMM-yyyy | hh:mm\na");
  // .add_jm()
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}

flightDepartDateAndTimeConverter(DateTime date) {
  var localDate = date;
  // .toLocal();
  var inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
  var inputDate = inputFormat.parse(localDate.toString());
  var outputFormat = DateFormat("dd-MMM-yyyy | hh:mm a");
  // .add_jm()
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}

flightDepartArriveTimeConverter(DateTime date) {
  var localDate = date;
  // .toLocal();
  var inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
  var inputDate = inputFormat.parse(localDate.toString());
  var outputFormat = DateFormat("hh:mm a");
  // .add_jm()
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}

///* Hotel,Restaurant and activity Date-Time:

String hotelDateAndTimeConverter(DateTime date) {
  var localDate = date;
  var inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
  var inputDate = inputFormat.parse(localDate.toString());
  var outputFormat = DateFormat("dd-MMM-yyyy |  h:mm a");
  // .add_jm()
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}

/// my transactions Date
String myTransactionsDate(String day) {
  var localDate = DateTime.parse(day);
  var inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
  var inputDate = inputFormat.parse(localDate.toString());
  var outputFormat = DateFormat("dd-MMM-yyyy");
  // .add_jm()
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}

appLaunchUrl({required Uri url}) async {
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}

class GetLocalTimezone {
  static late String? currentTimeZone;
  static late String? currentTimeZoneName;
}

String calculateTimeDifferenceBetween(
    {required DateTime startDate, required DateTime endDate}) {
  int seconds = endDate.difference(startDate).inSeconds;
  print('SECOND${seconds}');
  if (seconds < 60) {
    return '$seconds second';
  } else if (seconds >= 60 && seconds < 3600) {
    return '${startDate.difference(endDate).inMinutes.abs()} minute';
  } else if (seconds >= 3600 && seconds < 86400) {
    return '${startDate.difference(endDate).inHours} hour';
  } else {
    return '${startDate.difference(endDate).inDays} day';
  }
}

daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

registerPlatformInstance() {
  if (Platform.isAndroid) {
    GeolocatorAndroid.registerWith();
  } else if (Platform.isIOS) {
    GeolocatorApple.registerWith();
  }
}

Future saveFcmToken(String fcmToken) async {
  log("FCM TOKEN : ${fcmToken}");
  if (LocalStorage.getFCMToken().isEmpty) {
    LocalStorage.setFCMToken(fcmToken);
  }
}

displayNotificationTimeFromTimestamp(DateTime date) {
  var localDate = date.toLocal();
  var inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
  var inputDate = inputFormat.parse(localDate.toString());
  var outputFormat = DateFormat("dd MMM yyyy hh:mm a");
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}
//the birthday's date
// final birthday = DateTime(1967, 10, 12);
// final date2 = DateTime.now();
// final difference = daysBetween(birthday, date2);

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

  static String displayMSGTimeFromTimestamp(String strDate) {
    if (strDate.isEmpty) {
      return "";
    }
    var date = DateTime.parse(strDate);
    var v = DateTime.now().difference(date);
    if (v.inHours < 24) {
      return timeFormat(date.toLocal());
    } else {
      var outputFormat = DateFormat('d MMM yy, hh:mma');
      var outputDate = outputFormat.format(date.toLocal());
      return outputDate;
    }
  }

  static DateTime getUTCDateFromString(String strDate) {
    var outputFormat = DateFormat('yyyy-MM-dd\'T\'HH:mm:ss.sssZ');
    var outputDate = outputFormat.parse(strDate, true);
    return outputDate;
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
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          )
        : const SizedBox(),
    //titleSpacing: 200,
    actions: actions == null ? [] : actions,
    title: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
    backgroundColor: Colors.white,
  );
}
