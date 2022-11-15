import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:rownd_flutter_plugin/state/global_state.dart';
import 'package:tralever_module/custem_class/utils/local_storage.dart';
import 'package:tralever_module/ui/screen/base_screen/view/base_screen.dart';
import 'package:tralever_module/ui/screen/login/view/splash_screen.dart';

import 'custem_class/constant/app_settings.dart';
import 'custem_class/utils/bindinges.dart';
import 'custem_class/utils/globle.dart';
import 'custem_class/utils/localization_serivce.dart';
import 'custem_class/utils/routes.dart';

void main() async {
  globalVerbInit();
  await GetStorage.init();
  // await getInitialRoute();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => GlobalStateNotifier())],
    child: const MyApp(),
  ));
  // runApp(MyApp());
}

getInitialRoute() async {
  if (LocalStorage.isUserSignIn()) {
    LocalStorage.getUserDetail();

    if (userController.rowndSignInModel != null) {
      // print("rowndSignInModel===>${userController.rowndSignInModel}");
      initialRoute = BaseScreen.routeName;
    } else {
      initialRoute = SplashScreen.routeName;
    }
  } else {
    initialRoute = SplashScreen.routeName;
  }
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

// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:rownd_flutter_plugin/rownd.dart';
// import 'package:rownd_flutter_plugin/rownd_platform_interface.dart';
// import 'package:rownd_flutter_plugin/state/global_state.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String _platformVersion = 'Unknown';
//   final _rowndFlutterPlugin = RowndPlugin();
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//
//     _rowndFlutterPlugin.configure("e2f1fafb-228f-4eb7-85b7-8e784aa12567");
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     String platformVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     // We also handle the message potentially returning null.
//     try {
//       platformVersion = await _rowndFlutterPlugin.getPlatformVersion() ??
//           'Unknown platform version';
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _platformVersion = platformVersion;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (_) => _rowndFlutterPlugin.state(),
//         child: MaterialApp(
//           themeMode: ThemeMode.system,
//           darkTheme: ThemeData(brightness: Brightness.dark),
//           home: Scaffold(
//             appBar: AppBar(
//               title: const Text('Plugin example app'),
//             ),
//             body: Consumer<GlobalStateNotifier>(
//               builder: (_, rownd, __) => Column(children: [
//                 Center(child: Text('Running on: $_platformVersion\n')),
//                 ElevatedButton(
//                     onPressed: () {
//                       if (rownd.state.auth?.isAuthenticated ?? false) {
//                         _rowndFlutterPlugin.signOut();
//                       } else {
//                         RowndSignInOptions signInOpts = RowndSignInOptions();
//                         signInOpts.postSignInRedirect =
//                             "https://www.google.com";
//                         _rowndFlutterPlugin.requestSignIn(signInOpts);
//                       }
//                     },
//                     child: Text((rownd.state.auth?.isAuthenticated ?? false)
//                         ? 'Sign out'
//                         : 'Sign in')),
//                 if (rownd.state.auth?.isAuthenticated ?? false)
//                   ElevatedButton(
//                       onPressed: () {
//                         _rowndFlutterPlugin.manageAccount();
//                       },
//                       child: const Text('Manage account'))
//               ]),
//             ),
//           ),
//         ));
//   }
// }
