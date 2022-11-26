// import 'dart:convert';
// import 'dart:developer';
// import 'dart:ui';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:get/get.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:tralever_module/custem_class/utils/local_storage.dart';
// import 'package:tralever_module/ui/screen/notification/view/notification_screen.dart';
//
// class NotificationUtils {
//   static const notificationChannelId = "onsite_notification";
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   /// to create a single instance
//   factory NotificationUtils() {
//     _instance ??= NotificationUtils._();
//     return _instance!;
//   }
//
//   NotificationUtils._();
//
//   static NotificationUtils? _instance;
//
//   late AndroidInitializationSettings initializationSettingsAndroid;
//
//   // create a notification channel in Android
//   late AndroidNotificationChannel androidNotificationChannel;
//
//   init() async {
//     print("init----------------NotificationUtils");
//     // firebase messaging
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     // request for notification permission
//     // only applicable for iOS, Mac, Web. For the Android the result is always authorized.
//     // ignore: unused_local_variable
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//
//     // initialize the notifications
//     // if (!kIsWeb) {
//     // ic_notification is a drawable source added in the Android
//     print(
//         "initializationSettingsAndroid----------------initializationSettingsAndroid");
//     initializationSettingsAndroid =
//         const AndroidInitializationSettings('drawable/appicon');
//
//     DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//             defaultPresentAlert: true,
//             defaultPresentBadge: true,
//             defaultPresentSound: true,
//             onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     InitializationSettings initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//
//     // initialise the plugin
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse:
//             (NotificationResponse? payload) async {
//       // notification tapped
//       if (payload != null) {
//         Map<String, dynamic> data = jsonDecode('${payload.payload}');
//         await handleNotificationData(data);
//       }
//     });
//     androidNotificationChannel = const AndroidNotificationChannel(
//       notificationChannelId, //'''agenda_boa_notification_channel', // id
//       'onsite', // title
//       description: 'Channel to show the app notifications.',
//       // description
//       importance: Importance.max,
//       playSound: true,
//       enableVibration: true,
//       showBadge: true,
//     );
//
//     // create the channel
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(androidNotificationChannel);
//
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//             alert: true, badge: true, sound: true);
//
//     //this function listen all notification
//     notificationListeners();
//   }
//
//   BuildContext? context;
//   void onDidReceiveLocalNotification(
//     int? id,
//     String? title,
//     String? body,
//     String? payload,
//   ) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     showDialog(
//       context: context!,
//       builder: (BuildContext context) => CupertinoAlertDialog(
//         title: Text(title!),
//         content: Text(body!),
//         actions: [
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: Text('Ok'),
//             onPressed: () async {
//               Navigator.of(context, rootNavigator: true).pop();
//               await Get.toNamed(NotificationScreen.routeName);
//             },
//           )
//         ],
//       ),
//     );
//   }
//
//   void scheduleNotification(
//       {required String receiverMobileNumber,
//       required String receiverFcmToken,
//       required String title,
//       required String message,
//       required String deliveryTime,
//       required Map<String, dynamic> data}) async {
//     tz.initializeTimeZones();
//     final String currentTimeZone =
//         await FlutterNativeTimezone.getLocalTimezone();
//     tz.setLocalLocation(tz.getLocation(currentTimeZone));
//
//     // BigTextStyleInformation bigTextStyleInformation = x(
//     //   message,
//     //   contentTitle: title,
//     //   summaryText: "",
//     // );
//
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         0,
//         title,
//         message,
//         tz.TZDateTime.now(tz.local),
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//               androidNotificationChannel.id, androidNotificationChannel.name,
//               channelDescription: androidNotificationChannel.description,
//               color: const Color(0xFF242157),
//               ticker: title,
//               importance: Importance.max,
//               priority: Priority.high,
//               enableVibration: true,
//               fullScreenIntent: true,
//               playSound: true,
//               channelShowBadge: true,
//               icon: "appicon"),
//         ),
//         payload: data.isNotEmpty ? jsonEncode(data) : null,
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime);
//   }
//
//   Future<void> handleNewNotification(
//       RemoteMessage message, bool fromBackground) async {
//     // display the notification manually
//
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//     log("handleNewNotification $notification ");
//     log("handleNewNotification1 $android ");
//     if (notification != null && GetPlatform.isAndroid) {
//       // the push is from foreground
//       // here we need to manually display the notification
//       displayLocalNotification(
//         id: message.hashCode,
//         title: message.notification?.title,
//         body: message.notification?.body,
//         data: message.data,
//       );
//       return;
//     }
//   }
//
//   bool notificationUnread = true;
//
//   Future<void> handleAppLunchLocalNotification() async {
//     final NotificationAppLaunchDetails? notificationAppLaunchDetails =
//         await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//     final didNotificationLaunchApp =
//         notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;
//     if (didNotificationLaunchApp && notificationUnread) {
//       if (notificationAppLaunchDetails!.notificationResponse?.payload != null) {
//         notificationUnread = false;
//         handleNotificationData(jsonDecode(
//             '${notificationAppLaunchDetails.notificationResponse?.payload}'));
//       }
//     }
//   }
//
//   /// handle the notification [data] when the user taps on the notification.
//   Future<void> handleNotificationData(Map<String, dynamic> data) async {
//     log("NOTIFICATION handleNotificationData $data");
//     int type = int.parse(data["type"] ?? "0");
//     log(type.toString());
//     if (LocalStorage.isUserSignIn()) {
//       // Get.find<BottomNavigationController>().selectedIndex = 0;
//     }
//   }
//
//   /// display a local notification
//   void displayLocalNotification({
//     required int id,
//     required String? title,
//     required String? body,
//     Map<String, dynamic> data = const {},
//   }) async {
//     if (kIsWeb) {
//     } else {
//       FlutterLocalNotificationsPlugin().show(
//         id,
//         title,
//         body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             androidNotificationChannel.id,
//             androidNotificationChannel.name,
//             channelDescription: androidNotificationChannel.description,
//             color: const Color(0xFF242157),
//             ticker: title,
//             importance: Importance.high,
//             // priority is required for heads up in android <= 7.1
//             priority: Priority.high,
//             icon: "drawable/appicon",
//           ),
//         ),
//         payload: data.isNotEmpty ? jsonEncode(data) : null,
//       );
//     }
//   }
//
//   notificationListeners() {
//     handleAppLunchLocalNotification();
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       await NotificationUtils().handleNotificationData(message.data);
//     });
//     // listen for foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       // received the message while the app was foreground
//       // here the notification is not shown automatically.
//
//       log("NOTIFICATION FirebaseMessaging.onMessage.listen $message.data");
//       await NotificationUtils().handleNewNotification(message, false);
//     });
//     FirebaseMessaging.instance.getInitialMessage().then((value) async {
//       if (value != null) {
//         await NotificationUtils().handleNotificationData(value.data);
//       }
//     });
//     // FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
//     //   log("NOTIFICATION FirebaseMessaging.onMessage.listen $message.data");
//     //   await NotificationUtils().handleNewNotification(message, false);
//     // });
//   }
// }
