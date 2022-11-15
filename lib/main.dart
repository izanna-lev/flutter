import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tralever_module/ui/screen/base_screen/view/base_screen.dart';
import 'package:tralever_module/ui/screen/login/view/splash_screen.dart';

import 'custem_class/constant/app_settings.dart';
import 'custem_class/utils/bindinges.dart';
import 'custem_class/utils/globle.dart';
import 'custem_class/utils/local_storage.dart';
import 'custem_class/utils/localization_serivce.dart';
import 'custem_class/utils/routes.dart';

void main() async {
  globalVerbInit();
  await GetStorage.init();
  await getInitialRoute();
  runApp(const MyApp());
}

getInitialRoute() async {
  if (LocalStorage.isUserLogin()) {
    LocalStorage.getUserDetails();

    if (userController.userModel?.user != null) {
      initialRoute = BaseScreen.routeName;
    } else {
      initialRoute = SplashScreen.routeName;
    }
  } else {
    initialRoute = SplashScreen.routeName;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
