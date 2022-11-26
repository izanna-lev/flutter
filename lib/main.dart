import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:rownd_flutter_plugin/state/global_state.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/custem_class/utils/bindinges.dart';
import 'package:tralever_module/custem_class/utils/local_storage.dart';
import 'package:tralever_module/ui/screen/base_screen/view/base_screen.dart';
import 'package:tralever_module/ui/screen/login/view/splash_screen.dart';
import 'package:tralever_module/ui/screen/notification/notification_utills.dart';

import 'custem_class/utils/globle.dart';
import 'custem_class/utils/localization_serivce.dart';
import 'custem_class/utils/routes.dart';
import 'ui/screen/notification/view/firebase_option.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('-- main: Firebase.initializeApp');
  await GetStorage.init();
  globalVerbInit();
  requestPermission();
  userController.fcmToken = await FirebaseMessaging.instance.getToken();
  // FirebaseMessaging.instance.requestPermission();
  // await FirebaseMessaging.instance.getInitialMessage().then((value) async => {
  //       if (value != null)
  //         {NotificationUtils().handleNotificationData(value.data)}
  //     });
  GetLocalTimezone.currentTimeZone = DateTime.now().timeZoneName;
  GetLocalTimezone.currentTimeZoneName =
      await FlutterNativeTimezone.getLocalTimezone();
  print('currentTimezone${GetLocalTimezone.currentTimeZoneName}');
  await registerPlatformInstance();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await NotificationUtils().init();
  await FirebaseMessaging.instance.getToken().then((token) async {
    if (token != null) {
      log("FCM_TOKEN=====>$token");
      await saveFcmToken(token);
    }
  });
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider.value(value: GlobalStateNotifier())],
    child: const MyApp(),
  ));
  // await getInitialRoute();

  // runApp(MyApp());
}

getInitialRoute() async {
  if (LocalStorage.isUserSignIn()) {
    LocalStorage.getUserDetail();

    if (userController.rowndSignInModel != null) {
      initialRoute = BaseScreen.routeName;
    } else {
      initialRoute = SplashScreen.routeName;
    }
  } else {
    initialRoute = SplashScreen.routeName;
  }
}

Future<Map<Permission, PermissionStatus>> requestPermission() async {
  Map<Permission, PermissionStatus> statuses =
      await [Permission.notification].request();
  return statuses;
}

Future<void> initializeDefault() async {
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('Initialized default app $app');
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Traveler Module",
      debugShowCheckedModeBanner: false,
      initialBinding: BaseBinding(),
      translations: LocalizationService(context),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      initialRoute: initialRoute,
      getPages: routes,
      theme: ThemeData(
        backgroundColor: Colors.black,
        fontFamily: kAppFont,
      ),
    );
  }
}
